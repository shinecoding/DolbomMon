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
import org.springframework.web.servlet.ModelAndView;

import com.dolbommon.dbmon.certification.CertificationVO;
import com.dolbommon.dbmon.report.ReportDaoImp;
import com.dolbommon.dbmon.report.ReportVO;

@Controller
public class ManagmentController {
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping("/management")
	public ModelAndView management(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		String type = (String)req.getParameter("type");
		
		mav.addObject("type", type);
		mav.setViewName("management/management");
		return mav;
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
	@RequestMapping("/certiManage")
	public String certiManage() {
		return "management/certificationManage";
	}
	
	@RequestMapping("/certificationManage")
	public String certificationManage() {
		return "management/certificationManage";
	}
	
	@RequestMapping(value = "/reportList")
	@ResponseBody 
	public Map<String, Object> getRecordList(ReportVO boardVO){
		ManageDaoImp dao = sqlSession.getMapper(ManageDaoImp.class);
		Map<String, Object> mp = new HashMap<String, Object>();
		mp.put("data", dao.selectReport(boardVO));
	
		return mp;
	}
	
	@RequestMapping(value = "/certificationList")
	@ResponseBody 
	public Map<String, Object> certificationList(CertificationVO boardVO){
		ManageDaoImp dao = sqlSession.getMapper(ManageDaoImp.class);
		Map<String, Object> mp = new HashMap<String, Object>();
		mp.put("data", dao.selectCerti(boardVO));

		return mp;
	}
	
	@RequestMapping("/updateShingoRow")
	@ResponseBody
	public String updateShingoRow(HttpServletRequest req) {
		String shingo_response = (String)req.getParameter("shingo_response");
		String no = (String)req.getParameter("no");
		ReportDaoImp dao = sqlSession.getMapper(ReportDaoImp.class);
		dao.editResponse(shingo_response, no);
		
		return "";
	}
	@RequestMapping("/updateCerti")
	@ResponseBody
	public String updateCerti(HttpServletRequest req) {
		String certi = (String)req.getParameter("certi");
		String no = (String)req.getParameter("no");
		String type = (String)req.getParameter("type");
		ManageDaoImp dao = sqlSession.getMapper(ManageDaoImp.class);
		dao.editCerti(certi, no, type);
		
		return "";
	}
	
}
