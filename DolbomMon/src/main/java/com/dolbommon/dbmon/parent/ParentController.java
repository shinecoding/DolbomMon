package com.dolbommon.dbmon.parent;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dolbommon.dbmon.member.MemberDaoImp;
import com.dolbommon.dbmon.member.RegularDateVO;
import com.dolbommon.dbmon.member.SpecificDateVO;
import com.dolbommon.dbmon.search.RecruitBoardDaoImp;
import com.dolbommon.dbmon.search.RecruitBoardVO;

@Controller
public class ParentController {
	
	SqlSession sqlSession;
	public SqlSession getSqlSession() {
		return sqlSession;
	}
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	@Autowired
	DataSourceTransactionManager transactionManager;
	
	@RequestMapping("/mypage") //�θ�� ����������
	public String mypage() {
		return "/parents/mypage";
	}


	@RequestMapping("/parentApplyHistory") // 내가, 내게 지원한
	public ModelAndView parentApplyHistory(HttpSession ses) {
		String userid = (String)ses.getAttribute("userid");
		
		ParentDaoImp dao = sqlSession.getMapper(ParentDaoImp.class);
		
		List<ParentHistoryVO> list = dao.selectAllRdBoard(userid);
		
		
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("list", list);
		mav.setViewName("/parents/parentApplyHistory");
		
		return mav;
	}
	@RequestMapping("/parentView") //
	public ModelAndView parentView(int no, HttpSession ses) {
		
		RecruitBoardDaoImp dao = sqlSession.getMapper(RecruitBoardDaoImp.class);
		dao.hitCount(no);
		List<ApplyToParentInfoVO> tlist = dao.applyDbmSelect(no);
		RecruitBoardVO rbVO = dao.jobSearchBoardSelect(no);
		ChildrenVO cVO = dao.jobSearchChildSelect(no);
		
		String who = (String)ses.getAttribute("who");
		String userid = (String)ses.getAttribute("userid");
		int apChk = 0;
		if(who.equals("T")) {
			apChk = dao.applyChk(no, userid);
		}
		
		
		ModelAndView mav = new ModelAndView();
		
		String timeType = rbVO.getTime_type();
		if(timeType.equals("S")) {
			SpecificDateVO sdVO = dao.jobSearchSpecificDateSelect(no);
			mav.addObject("sdVO", sdVO);
		}else if(timeType.equals("R")){
			RegularDateVO rdVO = dao.jobSearchRegularDateSelect(no);
			mav.addObject("rdVO", rdVO);
		}
		
		mav.addObject("apChk", apChk);
		mav.addObject("tlist", tlist);
		mav.addObject("cVO", cVO);
		mav.addObject("rbVO", rbVO);
		mav.setViewName("/parents/parentView");
		
		return mav;
	}

	@RequestMapping("/parentEdit")
	public String parentEdit() {
		return "/parents/parentEdit";
	}
	@RequestMapping("/parentWage")
	public String parentWage() {
		return "/parents/parentWage";
	}

	@RequestMapping("/scheduleEdit")
	public String scheduleEdit() {
		return "/parents/scheduleEdit";

	}
	
	/////////////// 학부모에게 지원하기
	@RequestMapping("/applyToParent")
	public ModelAndView applyToParent(HttpSession ses, RecruitBoardVO rbVO, int no) {
		String teacherId = (String)ses.getAttribute("userid");
		
		RecruitBoardDaoImp dao = sqlSession.getMapper(RecruitBoardDaoImp.class);
		ApplyToParentVO atpVO = dao.getParentId(no);
		System.out.println("학부모 아이디 ==> " + atpVO.getP_userid());
		String parentId = atpVO.getP_userid();
		
		String who = (String)ses.getAttribute("who");
		String t_userid = (String)ses.getAttribute("userid");
		int apChk = 0;
		if(who.equals("T")) {
			apChk = dao.applyChk(no, t_userid);
		}
		
		ModelAndView mav = new ModelAndView();
		
		if(apChk>0) {
			
		} else {
			int apresult = dao.applyToParent(no, teacherId, parentId);
			System.out.println("신청결과 => " + apresult);
			
			mav.addObject("apresult", apresult);
		}
		
		mav.setViewName("redirect:/parentView?no="+no);
		return mav;
	}
	
	@RequestMapping(value = "/refusalDbm", method = RequestMethod.POST)
	@ResponseBody
	public int refusalDbm(@RequestParam("dbmid") String dbmid) {
		
		RecruitBoardDaoImp dao = sqlSession.getMapper(RecruitBoardDaoImp.class);
		int result = dao.refusalDbm(dbmid);
		
		return result;
	}

	@RequestMapping(value = "/applyCancel", method = RequestMethod.POST)
	@ResponseBody
	public int applyCancel(@RequestParam("dbmid") String dbmid) {
		
		RecruitBoardDaoImp dao = sqlSession.getMapper(RecruitBoardDaoImp.class);
		int result = dao.applyCancel(dbmid);
		
		return result;
	}
	
	///////////// 돌봄몬 구하기 글쓰기폼으로 이동
	@RequestMapping("/dbmSearchWriteForm")
	public String dbmSearchWriteForm() {
		return "parents/dbmSearchWriteForm";
	}
	
	//// 돌봄몬 구하기 글쓰기 
	@RequestMapping(value="/dbmSearchWriteFormOk", method = RequestMethod.POST)
	public ModelAndView dbmSearchWriteFormOk(HttpServletRequest req, HttpSession ses, RecruitBoardVO rbVO, ChildrenVO cVO, SpecificDateVO sdVO, RegularDateVO rdVO) {
		
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(DefaultTransactionDefinition.PROPAGATION_REQUIRED);
		
		TransactionStatus status = transactionManager.getTransaction(def);
		
		rbVO.setUserid((String)ses.getAttribute("userid"));
		
		String consultation = (String)rbVO.getConsultation();
		if(consultation==null || consultation=="") {
			rbVO.setConsultation("N");
		}
		
		ParentDaoImp dao = sqlSession.getMapper(ParentDaoImp.class);
		ModelAndView mav = new ModelAndView();
		
		String time_type = (String)rbVO.getTime_type();
		System.out.println("type_type => " + time_type);
		int result = 0;
		try {
			System.out.println("in");
			dao.insertDbmSearch(rbVO);
			System.out.println("parent_list 데이터 등록 됨");
			dao.insertDsChildInfo(rbVO, cVO);
			System.out.println("자녀 정보 등록됨");
			if(time_type.equals("S")) {
				System.out.println("S");
				result = dao.insertDsSpecificDate(rbVO, sdVO);
			}else {
				System.out.println("R");
				result = dao.insertDsRegularDate(rbVO, rdVO);
			}
			transactionManager.commit(status);
		}catch(Exception e) {
			transactionManager.rollback(status);
		}
		
		mav.addObject("result", result);
		mav.setViewName("/parents/writeResult");
		
		return mav;
	
	}
	
	
}
