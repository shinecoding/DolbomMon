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
	
	@Autowired
	ChatDAO chat;
	
	@RequestMapping("/chat")
	public ModelAndView chatMain() {
		ModelAndView mav = new ModelAndView();
		//채팅 폼으로 이동 임시.
		mav.setViewName("chat/chatMain");
		return mav;
	}
	
}
