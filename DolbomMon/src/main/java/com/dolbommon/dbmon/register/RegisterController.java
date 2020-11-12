package com.dolbommon.dbmon.register;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class RegisterController {

	
	// 로그인 폼으로
	@RequestMapping("/regForm")
	public String regForm() {
		
		return "register/regForm";
	}
	
	// 우편코드 선택창
	@RequestMapping("/zipcodeSearch")
	public String zipcodeSearch() {
		
		return "register/zipcodeSearch";
	}
	
	// 회원가입
	@RequestMapping(value="/regFormOk", method=RequestMethod.POST)
	public String regFormOk() {
		return "home";
	}
	
	@RequestMapping("/dbmSearchWriteForm")
	public String dbmSearchWriteForm() {
		return "parent/dbmSearchWriteForm";
	}
	
	@RequestMapping("/schedule")
	public String setSchedule() {
		return "parent/schedule";
	}
}
