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
	
	@RequestMapping(value="/loginOk", method=RequestMethod.POST)
	public ModelAndView loginOk() {
		
		return null;
	}
	
	@RequestMapping("/searchId")
	public String searchId() {
		return "login/idSearch";		
	}
	
	@RequestMapping("/idInfo")
	public ModelAndView idInfo() {
	
		return null;	
	}
	
	// 선생님, 부모님 회원가입 선택
	@RequestMapping("/join")
	public String join() {
		return "register/join";
	}
	
	// 학부모 회원가입 시작
	@RequestMapping("/parentJoinStart")
	public String joinParentStart() {
		return "register/parent/regForm";
	}
	
	// 돌봄몬 회원가입 시작
	@RequestMapping("/dbmJoinStart")
	public String joinDbmStart() {
		return "register/dbm/start";
	}
	
	// 우편코드 선택창
	@RequestMapping("/zipcodeSearch")
	public String zipcodeSearch() {
		
		return "register/zipcodeSearch";
	}
	

}
