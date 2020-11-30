package com.dolbommon.dbmon.search;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
	
	@Autowired
	DataSourceTransactionManager transactionManager;
	
	//구인페이지로 이동하기
	//돌봄몬찾기


	@RequestMapping("/sitter_list") 
	public ModelAndView sitter() {
		JobSearchDaoImp dao = sqlSession.getMapper(JobSearchDaoImp.class);
		List<JobSearchBoardVO> list = dao.jobSearchBoardList();
		int totalRecord = dao.getTotalRecord();	//총 게시물 수
		List<MemberVO> mvoList = dao.selectTMemNo();
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("mvoList", mvoList);
		mav.addObject("list", list);
		mav.addObject("totalRecord", totalRecord);
		mav.setViewName("search/sitter");
		
		return mav;
	
	}
	@RequestMapping("/teacher_chart") 
	public ModelAndView teacher_chart() {
		JobSearchDaoImp dao = sqlSession.getMapper(JobSearchDaoImp.class);
		List<JobSearchBoardVO> list = dao.jobSearchBoardList();
		int totalRecord = dao.getTotalRecord();	//총 게시물 수
		List<MemberVO> mvoList = dao.selectTMemNo();
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("mvoList", mvoList);
		mav.addObject("list", list);
		mav.addObject("totalRecord", totalRecord);
		mav.setViewName("search/sitter");
		
		return mav;
	
	}
}
