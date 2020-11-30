package com.dolbommon.dbmon.parent;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ParentController {

	@RequestMapping("/mypage") //�θ�� ����������
	public String mypage() {
		return "/parents/mypage";
	}
	@RequestMapping("/parentHeart") //�������
	public String parentHeart() {
		return "/parents/parentHeart";
	}
	@RequestMapping("/parentApplyHistory") //���γ���
	public String parentApplyHistory() {
		return "/parents/parentApplyHistory";
	}
	@RequestMapping("/parentView") //
	public String parentView() {
		return "/parents/parentView";
	}

	@RequestMapping("/parentEdit")
	public String parentEdit() {
		return "/parents/parentEdit";
	}
	@RequestMapping("/parentWage")
	public String parentWage() {
		return "/parents/parentWage";
	}
	
	@RequestMapping("/dbmSearchWriteForm")
	public String dbmSearchWriteForm() {
		return "/parents/dbmSearchWriteForm";
	}
	
	@RequestMapping("/dbmSearchWriteFormOk")
	public String dbmSearchWriteFormOk() {
		return "";
	}

}
