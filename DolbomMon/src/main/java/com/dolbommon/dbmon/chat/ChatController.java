package com.dolbommon.dbmon.chat;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
	public ModelAndView chatMain(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		
		String userid = (String)session.getAttribute("userid");
		
		mav.addObject("roomList", chatdao.selectAllRoom(userid)); //방정보..
		mav.addObject("myId", userid);
		mav.setViewName("chat/chatMain");
		return mav;
	}
	
	//////////////
	
	//방만들기 and 채팅방열기
	@RequestMapping(value="/makeRoom", method=RequestMethod.POST)
	@ResponseBody
	public List<ChatRoomDTO> makeakeRoom(ChatRoomDTO room, HttpSession session) {
		
		String userid = (String)session.getAttribute("userid");
		
		//userid는 고정으로 테스트. test4가 글쓴이.
		room.setUserid("test3"); //글, 프로필 대상
		
		int result = chatdao.roomCheck(userid, room.getUserid());
		
		List<ChatRoomDTO> resultRoomDTO =null;
		if(result>=1) {
			resultRoomDTO = chatdao.selectAllRoom(userid);
			return resultRoomDTO;
		}
		room.setUserid_t((String)session.getAttribute("userid")); //접속한 사람.. 추후 선생님 아이디(댓글등록자아이디)로 변경. 만약 선생님에게 부모님이 신청한거면?
		chatdao.insertRoom(room); //방 생성 // 방번호 가져오기.
		
		resultRoomDTO = chatdao.selectAllRoom(userid);
		return resultRoomDTO;
	}
	
	//채팅입력 //입력할때마다 방번호가 최신시간으로 갱신되게 만들기? 아니면 방삭제권한..? 그럼 방에다가 삭제권한 줘야하는데. . 시간을 현재시간으로 갱신하게 만들기.
	@RequestMapping(value="/insertChat", method=RequestMethod.POST)
	@ResponseBody
	public String insertChat(ChatDTO chat, HttpServletRequest req, HttpSession session) {
		if(session.getAttribute("userid") != null) {
			String userid = (String)session.getAttribute("userid");
			chat.setRoomseq((String)req.getParameter("roomseq"));
			chat.setUserid(userid);
			chatdao.insertChat(chat);
		}
		
		return "ok";
		
	}
	
	//방 클릭시 채팅내용에 반영되게하기
	@RequestMapping("/selectChatRoom")
	@ResponseBody
	public List<ChatDTO> selectRoom(HttpServletRequest req) {
		int roomNo = Integer.parseInt((String)req.getParameter("roomNo"));
		List resultDTO = chatdao.selectRoom(roomNo);
		return resultDTO;
	}
	
	
	
	/////////////
	
	
	
	
	
	
	

	
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
	
	
	
	/*
	 * //채팅입력
	 * 
	 * @RequestMapping(value="/insertChat", method=RequestMethod.POST)
	 * 
	 * @ResponseBody public String insertChat(ChatDTO chat, HttpSession session) {
	 * 
	 * if(session.getAttribute("userid") != null) { String userid =
	 * (String)session.getAttribute("userid"); chat.setUserid(userid);
	 * chatdao.insertChat(chat); }
	 * 
	 * return "redirect:/chat?roomseq="+chat.getRoomseq();
	 * 
	 * }
	 */
	
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
