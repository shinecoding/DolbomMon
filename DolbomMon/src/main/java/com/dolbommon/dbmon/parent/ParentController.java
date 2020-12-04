package com.dolbommon.dbmon.parent;


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
	@RequestMapping("/parentHeart") //�������
	public String parentHeart() {
		return "/parents/parentHeart";
	}
	@RequestMapping("/parentApplyHistory") //���γ���
	public String parentApplyHistory() {
		return "/parents/parentApplyHistory";
	}
	@RequestMapping("/parentView") //
	public String parentView() {
		return "/parents/parentView";
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
