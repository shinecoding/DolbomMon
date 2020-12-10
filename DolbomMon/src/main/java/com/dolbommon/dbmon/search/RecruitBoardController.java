package com.dolbommon.dbmon.search;

import java.text.SimpleDateFormat;
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
	
	//구인페이지로 이동하기
	@RequestMapping("/parent_list") 
	public ModelAndView parent() {
		
		RecruitBoardDaoImp dao = sqlSession.getMapper(RecruitBoardDaoImp.class);
		
		List<RecruitBoardVO> list2 = dao.recruitBoardList();
		int totalRecords = dao.getTotalRecords();	//총 게시물 수
		
		ModelAndView mav = new ModelAndView();
		
		//mav.addObject("mvoList", mvoList);
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
		
		
		mav.addObject("cVO", cVO);
		mav.addObject("vo" ,vo);
		mav.setViewName("parents/dbmSearchEditForm");
		
		return mav;
	}
	
	@RequestMapping(value="/dbmSearchWriteEditOk", method = RequestMethod.POST)
	public ModelAndView dbmSearchWriteEditOk(HttpSession ses ) {
		
		RecruitBoardDaoImp dao = sqlSession.getMapper(RecruitBoardDaoImp.class);
		
		
		ModelAndView mav = new ModelAndView();
		
		return mav;
	}
	
	////돌봄몬 구하기 수정하기 
//	@RequestMapping(value="/dbmSearchWriteEditOk", method = RequestMethod.POST)
//	public ModelAndView dbmSearchWriteFormOk(HttpServletRequest req, HttpSession ses, RecruitBoardVO rbVO, ChildrenVO cVO, SpecificDateVO sdVO, RegularDateVO rdVO) {
//		
//		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
//		def.setPropagationBehavior(DefaultTransactionDefinition.PROPAGATION_REQUIRED);
//		
//		TransactionStatus status = transactionManager.getTransaction(def);
//		
//		RecruitBoardDaoImp dao = sqlSession.getMapper(RecruitBoardDaoImp.class);
//		
//		String time_type = rbVO.getTime_type();
//		
//		String childb = cVO.getChild_birth();
//		String childbArr[] = childb.split(",");
//		///////////////////// 자녀 정보 (생년월일)///////////////////////
//		String child_birthStr = "";
//		for(int i=0;i<childbArr.length;i++) {
//			if(!childbArr[i].equals("")) {
//				child_birthStr += childbArr[i]+",";
//			}
//		}
//		String child_birth = child_birthStr.substring(0, child_birthStr.length()-1);
//		System.out.println("자녀 생년월일 => " + child_birth);
//		cVO.setChild_birth(child_birth);
//		/////////////////////////////////////////////////////////
//		
//		int result = 0;
//		try {
//			System.out.println("업데이트 시작 => ");
//			dao.updateDbmSearch(rbVO);
//			System.out.println("parent_list 업데이트 됨");
//			dao.updateDsChildInfo(rbVO, cVO);
//			System.out.println("add_child 업데이트 됨");
//			
//			if(time_type.equals("R")) {
//				System.out.println("Rd 업데이트");
//				result = dao.updateDsRegularDate(rbVO, rdVO);
//				System.out.println("Rd 업데이트 됨");
//			}else {
//				System.out.println("Sd 업데이트");
//				result = dao.updateDsSpecificDate(rbVO, sdVO);
//				System.out.println("Sd 업데이트 됨");
//			}
//			transactionManager.commit(status);
//		}catch(Exception e) {
//			transactionManager.rollback(status);
//		}
//		ModelAndView mav = new ModelAndView();
//		
//		mav.addObject("result", result);
//		mav.setViewName("/parents/writeResult");
//		
//		return mav;
//	
//	}
	
	
	
	
	
}




















	
