package com.dolbommon.dbmon.QnA;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class QnAController {

	

	
	private noticeListService noticeListService;

	
	public void setNoticeListService(noticeListService noticeListService) {

	this.noticeListService = noticeListService;

	}

	@RequestMapping("/hom33e")

	public String list(Model model){

	model.addAttribute("dateForm","yyyy-MM-dd"); // 날짜 패턴 지정

	//model.addAttribute("home",noticeListService.service());

	return "home"; 

	}//list()

	 

	}//class