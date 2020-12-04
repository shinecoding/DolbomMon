package com.dolbommon.dbmon.parent;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
}
