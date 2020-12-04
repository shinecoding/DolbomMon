package com.dolbommon.dbmon.search;


import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class JobSearchController {
	SqlSession sqlSession;
	
	public SqlSession getSqlSession() {
		return sqlSession;
	}
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	
	//구인페이지로 이동하기

	@RequestMapping("/sitter_list") 
	public ModelAndView sitter(HttpSession ses) {
		String userid = (String)ses.getAttribute("userid");
		
		JobSearchDaoImp dao = sqlSession.getMapper(JobSearchDaoImp.class);
		List<TeacherVO> list = dao.jobSearchBoardList(); //선생님 리스트
		HashSet<TeacherVO> hash = dao.selectAllTeacher();//지도의 모든 선생/부모 위치
		TeacherVO mvo = dao.selectTTMap(userid); //내 위치
		int totalRecord = dao.getTotalRecord();	//총 게시물 수
		
		
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("list", list);
		mav.addObject("hash", hash);
		mav.addObject("mvo", mvo);
		mav.addObject("totalRecord", totalRecord);//총 게시물 수
		mav.setViewName("search/sitter");
		
		return mav;
	
	}
	//메인화면에 띄워줄 리스트
	@RequestMapping("/teacher_chart") 
	public ModelAndView teacher_chart() {
		JobSearchDaoImp dao = sqlSession.getMapper(JobSearchDaoImp.class);
		List<TeacherVO> list = dao.jobSearchBoardList();
		int totalRecord = dao.getTotalRecord();	//총 게시물 수
		//List<MemberVO> mvoList = dao.selectTMem();
		ModelAndView mav = new ModelAndView();
		
		//mav.addObject("mvoList", mvoList);
		mav.addObject("list", list);
		mav.addObject("totalRecord", totalRecord);
		mav.setViewName("search/sitter");
		
		return mav;
	
	}
	
	@RequestMapping(value="/searchAct", method=RequestMethod.GET, produces="application/json; charset=UTF-8")
	@ResponseBody
	public List<TeacherVO> searchAct(String activity_type) {
		System.out.println("액티비티 타입"+activity_type);
		JobSearchDaoImp dao = sqlSession.getMapper(JobSearchDaoImp.class);
		List<TeacherVO> list = dao.jobSearchActType(activity_type);
		return list;
	}
	
	@RequestMapping(value="/searchCare", method=RequestMethod.GET, produces="application/json; charset=UTF-8")
	@ResponseBody
	public List<TeacherVO> searchCare(String care_type) {			
		JobSearchDaoImp dao = sqlSession.getMapper(JobSearchDaoImp.class);
		List<TeacherVO> list = dao.jobSearchCareType(care_type); 
		return list;	
		
	}
	
	@RequestMapping(value="/filterOrder", method=RequestMethod.GET, produces="application/json; charset=UTF-8")
	@ResponseBody
	public List<TeacherVO> filterOrder(String order){
		
		JobSearchDaoImp dao = sqlSession.getMapper(JobSearchDaoImp.class);
		
		List<TeacherVO> list = new ArrayList<TeacherVO>();
		
		if(order.equals("last_edit")){
			list = dao.filterLastEdit();
		} else if(order.equals("certi_cnt")){
			list = dao.filterCertiCnt();
		} else if(order.equals("wage_low")){
			list = dao.filterWageLow();
		} else if(order.equals("wage_high")){
			list = dao.filterWageHigh();
		}
		
		return list;
	}
	
}
