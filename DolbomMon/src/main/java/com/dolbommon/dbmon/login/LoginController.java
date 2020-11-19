package com.dolbommon.dbmon.login;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {
	
	
	@RequestMapping("/login")
	public String login() {
		return "login/loginForm";	
	}
	
	//로그인 화면
	@RequestMapping(value="/loginOk", method=RequestMethod.POST)
	public ModelAndView loginOk() {
		
		return null;
	}
	
	
	@RequestMapping("/searchId")
	public String searchId() {
		return "login/idSearch";		
	}
	
	//�④쑴�젟 筌≪뼐由�
//	@RequestMapping("/idInfo")
//	public ModelAndView idInfo() {
	
//		return null;	
//	}
	
	//�④쑴�젟 筌≪뼐由�
	@RequestMapping("/idInfo")
	public String idInfo() {
		
		return "login/idInfo";

	}
}
