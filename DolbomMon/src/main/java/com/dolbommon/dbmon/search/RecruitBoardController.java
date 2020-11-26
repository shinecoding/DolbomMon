package com.dolbommon.dbmon.search;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
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
//		@RequestMapping(value = "/search/parent", method=RequestMethod.GET) 
//		public ModelAndView parent() {
			//RecruitBoardDaoImp dao = sqlSession.getMapper(RecruitBoardDaoImp.class);
//			List<RecruitBoardVO> list = dao.recruitBoardList();
//			int totalRecord = dao.getTotalRecord();	//총 게시물 수
			
//			ModelAndView mav = new ModelAndView();
//			mav.addObject("list", list);
//			mav.addObject("totalRecord", totalRecord);
//			mav.setViewName("search/parent");
			
//			return mav;
		
//		}
		/*
		 * //구인게시판 글쓰기
		 * 
		 * @RequestMapping("/freeBoardWrite") public String freeBoardWrite() {
		 * 
		 * return "freeBoard/freeBoardWrite"; }
		 */
		
	}




















