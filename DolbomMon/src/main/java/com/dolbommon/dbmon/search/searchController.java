package com.dolbommon.dbmon.search;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class searchController {
	@RequestMapping("/parent") //구인페이지
	public String parent() {
		return "/search/parent";
	}
	@RequestMapping("/sitter") //구직페이지
	public String sitter() {
		return "/search/sitter";
	}

}
