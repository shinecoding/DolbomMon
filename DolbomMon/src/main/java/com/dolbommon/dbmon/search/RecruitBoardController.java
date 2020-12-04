package com.dolbommon.dbmon.search;

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
import org.springframework.web.servlet.ModelAndView;

import com.dolbommon.dbmon.member.RegularDateVO;
import com.dolbommon.dbmon.member.SpecificDateVO;
import com.dolbommon.dbmon.parent.ChildrenVO;
import com.dolbommon.dbmon.parent.DbmSearchVO;
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
		List<MemberVO> mvoList = dao.selectTMemNo();
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("mvoList", mvoList);
		mav.addObject("list2", list2);
		mav.addObject("totalRecords", totalRecords);
		mav.setViewName("search/parent");
		
		return mav;
	}

	///////////// 돌봄몬 구하기 글쓰기폼으로 이동
	@RequestMapping("/dbmSearchWriteForm")
	public String dbmSearchWriteForm() {
		return "/parents/dbmSearchWriteForm";
	}
	
	//// 돌봄몬 구하기 글쓰기 
	@RequestMapping(value="/dbmSearchWriteFormOk", method = RequestMethod.POST)
	public ModelAndView dbmSearchWriteFormOk(HttpServletRequest req, HttpSession ses, DbmSearchVO dsVO, ChildrenVO cVO, SpecificDateVO sdVO, RegularDateVO rdVO) {
		
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(DefaultTransactionDefinition.PROPAGATION_REQUIRED);
		
		TransactionStatus status = transactionManager.getTransaction(def);
		
		dsVO.setUserid((String)ses.getAttribute("userid"));
		
		String consultation = (String)dsVO.getConsultation();
		if(consultation==null || consultation=="") {
			dsVO.setConsultation("N");
		}
		
		ParentDaoImp dao = sqlSession.getMapper(ParentDaoImp.class);
		ModelAndView mav = new ModelAndView();
		
		String time_type = (String)dsVO.getTime_type();
		int result = 0;
		
		try {
			dao.insertDbmSearch(dsVO);
			dao.insertDsChildInfo(dsVO, cVO);
			if(time_type.equals("S")) {
				result = dao.insertDsSpecificDate(dsVO, sdVO);
			}else {
				result = dao.insertDsRegularDate(dsVO, rdVO);
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


	
