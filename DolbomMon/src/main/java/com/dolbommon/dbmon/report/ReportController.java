package com.dolbommon.dbmon.report;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReportController {
	@Autowired
	SqlSession sqlSession;
	
	//신고하기 뷰페이지 이동
	@RequestMapping("/report")
	public String reportView() {
		
		return "management/reportView";
	}
}
