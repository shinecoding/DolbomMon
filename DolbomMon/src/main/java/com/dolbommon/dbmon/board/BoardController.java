package com.dolbommon.dbmon.board;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {

	//게시판 리스트로 이동
	@RequestMapping("/freeBoard")
	public String freeBoard() {
		
		return "freeBoard/freeBoard";
	}
	
	//게시판 글쓰기 폼으로 이동
	@RequestMapping("/freeBoardWrite")
	public String freeBoardWrite() {
		
		return "freeBoard/freeBoardWrite";
	}
	
	//게시판 글쓰기
	@RequestMapping(value="/freeBoardWriteOk", method=RequestMethod.POST)
	public ModelAndView freeBoardWriteOk() {
		
		return null;	
	}
	
	//게시글 보기
//	@RequestMapping("/freeBoardView")
//	public ModelAndView freeBoardView() {
		
//		return null;
//	}
	@RequestMapping("/freeBoardView")
	public String freeBoardView() {
		
		return "freeBoard/freeBoardView";
	}
	
	//공지사항 게시판으로 이동
	@RequestMapping("/noticeBoard")
	public String noticeBoard() {
		
		return "freeBoard/noticeBoard";
	}
	
	//공지사항 글쓰기 폼으로 이동
	@RequestMapping("/noticeBoardWrite")
	public String noticeBoardWrite() {
		
		return "freeBoard/noticeBoardWrite";
	}
	
	@RequestMapping("/noticeBoardView")
	public String noticeBoardView() {
		
		return "freeBoard/noticeBoardView";
	}
	
}
