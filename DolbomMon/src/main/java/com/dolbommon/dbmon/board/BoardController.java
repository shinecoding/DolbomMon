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
	@RequestMapping("/boardWrite")
	public String boardWrite() {
		
		return "freeBoard/boardWrite";
	}
	
	//게시판 글쓰기
	@RequestMapping(value="/boardWriteOk", method=RequestMethod.POST)
	public ModelAndView boardWriteOk() {
		
		return null;	
	}
	
}
