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

}
