package com.dolbommon.dbmon;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ManagmentController {
	@RequestMapping("/management")
	public String management() {
		
		return "/management/management";
	}
	@RequestMapping("/managerLogin")
	public String login() {
		return "/management/managerLogin";
	}
}
