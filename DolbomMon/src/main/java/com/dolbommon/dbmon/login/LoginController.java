package com.dolbommon.dbmon.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {

	SqlSession sqlSession;
	
	public SqlSession getSqlSession() {
		return sqlSession;
	}
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	
	//濡쒓렇�씤 �럹�씠吏�濡� �씠�룞
	@RequestMapping("/login")
	public String login() {
		return "login/loginForm";	
	}
	
	//濡쒓렇�씤
	@RequestMapping(value="/loginOk", method=RequestMethod.POST)
	public ModelAndView loginOk(LoginVO vo, HttpSession ses) {
		
		LoginDaoImp dao = sqlSession.getMapper(LoginDaoImp.class);
		LoginVO resultVO = dao.loginOk(vo);
		ModelAndView mav = new ModelAndView();
		
		
		
		
		return null;
	}
	
	//怨꾩젙 李얘린 �럹�씠吏�濡� �씠�룞
	@RequestMapping("/searchId")
	public String searchId() {
		return "login/idSearch";		
	}
	
	//怨꾩젙 李얘린
//	@RequestMapping("/idInfo")
//	public ModelAndView idInfo() {
	
//		return null;	
//	}
	
	//怨꾩젙 李얘린
	@RequestMapping("/idInfo")
	public String idInfo() {
		
		return "login/idInfo";

	}
}
