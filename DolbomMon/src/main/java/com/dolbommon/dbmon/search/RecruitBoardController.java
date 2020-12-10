package com.dolbommon.dbmon.search;

import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	//구인페이지로 이동하기
	@RequestMapping("/parent_list") 
	public ModelAndView parent() {
		
		RecruitBoardDaoImp dao = sqlSession.getMapper(RecruitBoardDaoImp.class);
		
		List<RecruitBoardVO> list2 = dao.recruitBoardList();
		int totalRecords = dao.getTotalRecords();	//총 게시물 수
		//List<MemberVO> mvoList = dao.selectTMemNo();
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
	
	
	
	
	
	
}




















	
