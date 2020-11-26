package com.dolbommon.dbmon.chat;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ChatController {
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping("/chat")
	public ModelAndView chatMain() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("chat/chatMain");
		return mav;
	}
	
}
