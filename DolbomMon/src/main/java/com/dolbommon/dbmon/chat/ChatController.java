package com.dolbommon.dbmon.chat;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ChatController {
	@Autowired
	SqlSession sqlSession;
	
	@Autowired
	ChatDAO chatdao;
	
	@RequestMapping("/chat")
	public String chatMain(Model model) {
		//채팅 폼으로 이동 임시.
		
		//model.addAttribute("roomList", chatdao.selectAllRoom()); //방정보..
		return "chat/chatMain";
	}
	
	//////////////
	@RequestMapping(value="/makeRoom", method=RequestMethod.POST)
	@ResponseBody
	public String makeakeRoom(ChatRoomDTO room, HttpSession session) {
		String userid = (String)session.getAttribute("userid");
		room.setUserid(userid);
		System.out.println(room.getRoomname());
		System.out.println(room.getUserid());
		chatdao.insertRoom(room);
		
		return "ok";
		
	}
	
	
	
	
	/////////////
	
	
	
	
	
	
	
	@RequestMapping(value = "/goChatList", method = RequestMethod.GET)
	public String goChatList(Model model) {// 채팅방목록이동액션

		model.addAttribute("roomList", chatdao.selectAllRoom());

		return "redirect:chat";
	}
	
	@RequestMapping(value="/goMakeRoom", method=RequestMethod.POST)
	public String goMakeRoom(ChatRoomDTO room, HttpSession session) {

		
		return "redirect:chat";
		
	}
	
	
	
	@RequestMapping(value = "/makeChat", method = RequestMethod.POST)
	public String makeChat(ChatRoomDTO room, HttpSession session) {// 채팅방만들기폼이동액션

		if (session.getAttribute("loginId") != null) {
			String userid = (String) session.getAttribute("loginId");
			room.setUserid(userid);
			chatdao.insertRoom(room);
		}
		return "redirect:/goChatList";
	}
	
	
	
	//채팅입력
	@RequestMapping(value="/insertChat", method=RequestMethod.POST)
	@ResponseBody
	public String insertChat(ChatDTO chat, HttpSession session) {
		
		if(session.getAttribute("userid") != null) {
			String userid = (String)session.getAttribute("userid");
			chat.setUserid(userid);
			chatdao.insertChat(chat);
		}
		
		return "redirect:/chat?roomseq="+chat.getRoomseq();
		
	}
	
	@RequestMapping("/goChatRoom")
	public String goChatRoom(Model model, ChatDTO chat, HttpSession session) {
		
		model.addAttribute("chatList", chatdao.selectChat(chat.getRoomseq()));
		model.addAttribute("roomseq", chat.getRoomseq());
		return "chatroom";
	}
	@RequestMapping("/chatMessage")
	public List<ChatDTO> chatMessage(String roomseq, HttpSession session){
		
		return chatdao.selectChat(roomseq);
	}
	
	
}
