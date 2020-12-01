package com.dolbommon.dbmon.search;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dolbommon.dbmon.Teacher.TeacherVO;
@Controller
public class JobSearchController {
	@Autowired
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

	@RequestMapping("/sitter_list") 
	public ModelAndView sitter() {

		JobSearchDaoImp dao = sqlSession.getMapper(JobSearchDaoImp.class);
		List<TeacherVO> list = dao.jobSearchBoardList();
		int totalRecord = dao.getTotalRecord();	//총 게시물 수
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("list", list);
		
		mav.addObject("totalRecord", totalRecord);
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
	
	@RequestMapping(value="/searchAct1", method=RequestMethod.GET, produces="application/text; charset=UTF-8")
	@ResponseBody
	public List<TeacherVO> searchAct1(TeacherVO vo) {
		JobSearchDaoImp dao = sqlSession.getMapper(JobSearchDaoImp.class);
		List<TeacherVO> list = dao.selectTAct1();
		
		
		return list;
	}
}
