package com.dolbommon.dbmon.login;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {

	
	//로그인 페이지로 이동
	@RequestMapping("/login")
	public String login() {
		return "login/loginForm";	
	}
	
	//로그인
	@RequestMapping(value="/loginOk", method=RequestMethod.POST)
	public ModelAndView loginOk() {
		
		return null;
	}
	
	//계정 찾기 페이지로 이동
	@RequestMapping("/searchId")
	public String searchId() {
		return "login/idSearch";		
	}
	
	//계정 찾기
//	@RequestMapping("/idInfo")
//	public ModelAndView idInfo() {
	
//		return null;	
//	}
	
	//계정 찾기
	@RequestMapping("/idInfo")
	public String idInfo() {
		
		return "login/idInfo";

	}
	

}
