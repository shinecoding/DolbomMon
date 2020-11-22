package com.dolbommon.dbmon.board;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {

	@RequestMapping("/freeBoard")
	public String freeBoard() {
		
		return "freeBoard/freeBoard";
	}
	
}
