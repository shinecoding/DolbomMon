package com.dolbommon.dbmon.search;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

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

import com.dolbommon.dbmon.member.RegularDateVO;
import com.dolbommon.dbmon.member.SpecificDateVO;
import com.dolbommon.dbmon.parent.ChildrenVO;
import com.dolbommon.dbmon.parent.ParentDaoImp;


@Controller
public class RecruitBoardController {
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
	
	//구직페이지로 이동하기
	@RequestMapping("/parent_list") 
	public ModelAndView parent(HttpSession ses, HttpServletRequest req) {
		String userid = (String)ses.getAttribute("userid");
		
		RecruitBoardDaoImp dao = sqlSession.getMapper(RecruitBoardDaoImp.class);
		RecruitBoardVO rVo = new RecruitBoardVO();
		List<RecruitBoardVO> list2 = dao.recruitBoardList();
		int totalRecords = dao.getTotalRecords();	//총 게시물 수

		RecruitBoardVO mvo = null;
//		if(req.getParameter("userid")==null) {
//			//로그인 안 했을 때 지도 위치 지정 >test1계정의 위치 띄워줌
//			mvo = dao.selectTTMap("test1");
//		} else {
//		mvo = dao.selectTTMap(userid); //내 위치
//		}
		

		ModelAndView mav = new ModelAndView();
		
		mav.addObject("list2", list2);
		mav.addObject("totalRecords", totalRecords);
		mav.setViewName("search/parent");

		return mav;
	}

	@RequestMapping("/editBoard")
	public ModelAndView editBoard(int no) {
		RecruitBoardDaoImp dao = sqlSession.getMapper(RecruitBoardDaoImp.class);
		
		RecruitBoardVO vo = dao.recruitBoardSelect(no);
		ModelAndView mav = new ModelAndView();
		
		String time_type = vo.getTime_type();
		
		if(time_type.equals("R")) {
			RegularDateVO rdVO = dao.recruitRegularDateSelect(no);
			mav.addObject("rdVO", rdVO);
		}else {
			SpecificDateVO sdVO = dao.recruitSpecificDateSelect(no);
			mav.addObject("sdVO", sdVO);
		}
		
		ChildrenVO cVO = dao.recruitChildSelect(no);
		String child_birth = cVO.getChild_birth();
		String child_birthAdd[] = child_birth.split(",");
		int child_cnt = child_birthAdd.length;
		cVO.setChild_cnt(child_cnt);
		
		mav.addObject("no", no);
		mav.addObject("cVO", cVO);
		mav.addObject("vo" ,vo);
		mav.setViewName("parents/dbmSearchEditForm");
		
		return mav;
	}
	//필터
	@RequestMapping(value="/careAct", method=RequestMethod.GET, produces="application/json; charset=UTF-8")
	@ResponseBody
	public List<RecruitBoardVO> careAct(String activity_type) {
		System.out.println("액티비티 타입 "+activity_type);
		RecruitBoardDaoImp dao = sqlSession.getMapper(RecruitBoardDaoImp.class);
		List<RecruitBoardVO> list = dao.recruitActType(activity_type);
		
		return list;
	}
	//select 필터
	@RequestMapping(value="/careSelect", method=RequestMethod.GET, produces="application/json; charset=UTF-8")
	@ResponseBody
	public List<RecruitBoardVO> careSelect(String care_type) {
		System.out.println("케어 타입 "+care_type);
		RecruitBoardDaoImp dao = sqlSession.getMapper(RecruitBoardDaoImp.class);
		List<RecruitBoardVO> list = new ArrayList<RecruitBoardVO>();
		
		if(care_type.equals("all")) {
			list = dao.recruitBoardList();
		}else {
			list = dao.recruitCareSelect(care_type); 	
		}	
		return list;
	}
	
	//정렬 필터
	@RequestMapping(value="/filterArray", method=RequestMethod.GET, produces="application/json; charset=UTF-8")
	@ResponseBody
	public List<RecruitBoardVO> filterOrder(String order){
		
		RecruitBoardDaoImp dao = sqlSession.getMapper(RecruitBoardDaoImp.class);
		
		List<RecruitBoardVO> list = new ArrayList<RecruitBoardVO>();
		
		if(order.equals("new")){
			list = dao.recruitBoardList();
		} else if(order.equals("wage_high")){
			list = dao.filterHighWage();
		} else if(order.equals("wage_low")){
			list = dao.filterLowWage();
		}	
		return list;
	}
	////돌봄몬 구하기 수정하기 
	@RequestMapping(value="/dbmSearchWriteEditOk", method = RequestMethod.POST)
	public ModelAndView dbmSearchWriteFormOk(int no, HttpServletRequest req, HttpSession ses, RecruitBoardVO rbVO, ChildrenVO cVO, SpecificDateVO sdVO, RegularDateVO rdVO) {
		
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(DefaultTransactionDefinition.PROPAGATION_REQUIRED);
		
		TransactionStatus status = transactionManager.getTransaction(def);
		
		RecruitBoardDaoImp dao = sqlSession.getMapper(RecruitBoardDaoImp.class);
		
		String consultation = (String)rbVO.getConsultation();
		if(consultation==null || consultation=="") {
			rbVO.setConsultation("N");
		}
		String time_consultation = (String)rbVO.getTime_consultation();
		if(time_consultation==null || time_consultation=="") {
			rbVO.setTime_consultation("N");
		}
		
		String time_type = rbVO.getTime_type();
		
		String childb = cVO.getChild_birth();
		String childbArr[] = childb.split(",");
		///////////////////// 자녀 정보 (생년월일)///////////////////////
		String child_birthStr = "";
		for(int i=0;i<childbArr.length;i++) {
			if(!childbArr[i].equals("")) {
				child_birthStr += childbArr[i]+",";
			}
		}
		String child_birth = child_birthStr.substring(0, child_birthStr.length()-1);
		System.out.println("자녀 생년월일 => " + child_birth);
		cVO.setChild_birth(child_birth);
		/////////////////////////////////////////////////////////
		System.out.println("글번호 => " + no);
		int editResult = 0;
		try {
			System.out.println("업데이트 시작 => ");
			dao.updateDbmSearch(no, rbVO);
			System.out.println("parent_list 업데이트 됨");
			dao.updateDsChildInfo(no, rbVO, cVO);
			System.out.println("add_child 업데이트 됨");
			
			if(time_type.equals("R")) {
				System.out.println("Rd 업데이트");
				editResult = dao.updateDsRegularDate(no, rbVO, rdVO);
				System.out.println("Rd 업데이트 됨");
			}else {
				System.out.println("Sd 업데이트");
				editResult = dao.updateDsSpecificDate(no, rbVO, sdVO);
				System.out.println("Sd 업데이트 됨");
			}
			transactionManager.commit(status);
		}catch(Exception e) {
			transactionManager.rollback(status);
			System.out.println("에러 발생 =>"+e.getMessage());
		}
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("no", no);
		mav.addObject("editResult", editResult);
		mav.setViewName("/parents/writeResult");
		
		return mav;
	
	}
	
	
	
	
	
}





	
