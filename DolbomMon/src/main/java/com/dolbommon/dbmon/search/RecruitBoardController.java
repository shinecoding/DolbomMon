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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import com.dolbommon.dbmon.member.RegularDateVO;
import com.dolbommon.dbmon.member.SpecificDateVO;
import com.dolbommon.dbmon.parent.ChildrenVO;


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
			list = dao.filterNewArray();
		} else if(order.equals("wage_high")){
			list = dao.filterHighWage();
		} else if(order.equals("wage_low")){
			list = dao.filterLowWage();
		}
		
		return list;
	}

}


	
