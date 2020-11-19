package com.dolbommon.dbmon.board;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {

	
	@RequestMapping("/freeBoard")
	public String freeBoard() {
		
		return "freeBoard/freeBoard";
	}
	
	
	@RequestMapping("/freeBoardWrite")
	public String freeBoardWrite() {
		
		return "freeBoard/freeBoardWrite";
	}
	
	@RequestMapping(value="/freeBoardWriteOk", method=RequestMethod.POST)
	public ModelAndView freeBoardWriteOk() {
		
		return null;	
	}
	
	
//	@RequestMapping("/freeBoardView")
//	public ModelAndView freeBoardView() {
		
//		return null;
//	}
	@RequestMapping("/freeBoardView")
	public String freeBoardView() {
		
		return "freeBoard/freeBoardView";
	}
	
	//怨듭��궗�빆 寃뚯떆�뙋�쑝濡� �씠�룞
	@RequestMapping("/noticeBoard")
	public String noticeBoard() {
		
		return "freeBoard/noticeBoard";
	}
	
	//怨듭��궗�빆 湲��벐湲� �뤌�쑝濡� �씠�룞
	@RequestMapping("/noticeBoardWrite")
	public String noticeBoardWrite() {
		
		return "freeBoard/noticeBoardWrite";
	}
	
	//怨듭��궗�빆 寃뚯떆湲� 蹂닿린
//	@RequestMapping(value="/noticeBoardView", method=RequestMethod.POST)
//	public ModelAndView noticeBoardView() {
		
//		return null;
//	}
	
	@RequestMapping("/noticeBoardView")
	public String noticeBoardView() {
		
		return "freeBoard/noticeBoardView";
	}
	
	//�떊怨좉쾶�떆�뙋�쑝濡� �씠�룞
	@RequestMapping("/bulletinBoard")
	public String bulletinBoard() {
		
		return "freeBoard/bulletinBoard";
	}
	
	//�떊怨좉쾶�떆湲� 蹂닿린
	@RequestMapping("/bulletinBoardView")
	public String bulletinBoardView() {
		
		return "freeBoard/bulletinBoardView";
	}
	
	//�씤利앷쾶�떆�뙋�쑝濡� �씠�룞
	@RequestMapping("/confirmBoard")
	public String confirmBoard() {
		
		return "freeBoard/confirmBoard";
	}
	
	//�씤利앷� 蹂닿린
	@RequestMapping("/confirmBoardView")
	public String confirmBoardView() {
		
		return "freeBoard/confirmBoardView";
	}
}
