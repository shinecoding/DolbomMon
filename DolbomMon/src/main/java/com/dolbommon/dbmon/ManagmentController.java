package com.dolbommon.dbmon;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ManagmentController {
	@RequestMapping("/management")
	public String management() {
		return "management/management";
	}
	@RequestMapping("/managerLogin")
	public String login() {
		return "management/managerLogin";
	}

	
	@RequestMapping("/test")
	public String test() {
		return "management/test";
	}
	
	@RequestMapping(value="/memberManage", method=RequestMethod.POST)
	public String memberManage(){
		return "management/memberManage";
	}
	
	@RequestMapping("/managerRegister")
	public String managerRegister(){
		return "management/managerRegister";
<<<<<<< HEAD
=======
	}
	@RequestMapping("/accountManage")
	public String accountManage(){
		return "management/accountManage";
	}
	@RequestMapping("/managerManage")
	public String managerManage(){
		return "management/managerManage";
>>>>>>> 4f0544714dbbcd144bd33b753d1049a3f092323e
	}
	@RequestMapping("/accountManage")
	public String accountManage(){
		return "management/accountManage";
	}
	@RequestMapping("/managerManage")
	public String managerManage(){
		return "management/managerManage";
	}


}
