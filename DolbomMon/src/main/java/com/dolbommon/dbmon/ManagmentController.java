package com.dolbommon.dbmon;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dolbommon.dbmon.report.ReportVO;

@Controller
public class ManagmentController {
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping("/management")
	public String management() {
		return "management/management";
	}
	@RequestMapping("/managerLogin") //인터셉터용
	public String login() {
		return "management/managerLogin";
	}

	
	@RequestMapping("/test")
	public String test() {
		return "management/test";
	}
	
	@RequestMapping("/memberManage")
	public String memberManage(){
		return "management/memberManage";
	}
	
	@RequestMapping("/managerRegister")
	public String managerRegister(){
		return "management/managerRegister";

	}
	@RequestMapping("/accountManage")
	public String accountManage(){
		return "management/accountManage";
	}
	@RequestMapping("/managerManage")
	public String managerManage(){
		return "management/managerManage";
	}
	
	@RequestMapping("/managerLogout")
	public String managerLogout(HttpSession session) {
		session.setAttribute("managerStatus", "N");
		return "management/managerLogin";
	}
	@RequestMapping("/managerlogin2") //임시로그인
	public String managerlogin(HttpSession session) {
		session.setAttribute("managerStatus", "Y");
		return "management/management";
	}
	
	@RequestMapping("/reportManage")
	public String reportManage() {
		return "management/reportManage";
	}
	
	@RequestMapping(value = "/reportList")
	 public @ResponseBody Object getRecordList(HttpServletRequest request,
	   HttpServletResponse response,
	   @ModelAttribute("ReportVO") ReportVO boardVO){
		ManageDaoImp dao = sqlSession.getMapper(ManageDaoImp.class);
	  Map<String, Object> mp = new HashMap<String, Object>();
	  mp.put("data", dao.selectReport(boardVO));

	  Object result = mp;
	  
	  return result;
	}
}
