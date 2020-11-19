package com.dolbommon.firstpage;

import org.springframework.web.bind.annotation.RequestMapping;

public class FirstpageController {
	
	@RequestMapping("/main")
	public String management() {
		
		return "/main/main";
	}
}
