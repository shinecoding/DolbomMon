package com.dolbommon.dbmon.register;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class RegisterController {

	// 선생님, 부모님 회원가입 선택
	@RequestMapping("/join")
	public String join() {
		return "register/join";
	}
	
	// 학부모 회원가입 시작
	@RequestMapping("/parentJoinStart")
	public String joinParentStart() {
		return "register/parent/start";
	}
	
	// 돌봄몬 회원가입 시작
	@RequestMapping("/dbmJoinStart")
	public String joinDbmStart() {
		return "register/dbm/start";
	}
	
	// 회원가입 폼으로
	@RequestMapping("/regForm")
	public String regForm() {
		
		return "register/regForm";
	}
	
	// 우편코드 선택창
	@RequestMapping("/zipcodeSearch")
	public String zipcodeSearch() {
		
		return "register/zipcodeSearch";
	}
	
	// 회원가입하기
	@RequestMapping(value="/regFormOk", method=RequestMethod.POST)
	public String regFormOk() {
		return "home";
	}
}
