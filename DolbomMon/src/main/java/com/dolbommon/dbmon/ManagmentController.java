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
import com.dolbommon.dbmon.deal.PaymentVO;
import com.dolbommon.dbmon.member.MemberVO;
import com.dolbommon.dbmon.report.ReportDaoImp;
import com.dolbommon.dbmon.report.ReportVO;

@Controller
public class ManagmentController {
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping("/management")
	public ModelAndView management(ManagerVO vo, HttpServletRequest req, HttpSession ses) {
		ModelAndView mav = new ModelAndView();
		String type = (String)req.getParameter("type");
		String no = (String)req.getParameter("no");
		String userid = (String)ses.getAttribute("managerId");
		ManageDaoImp dao = sqlSession.getMapper(ManageDaoImp.class);
		vo = dao.getDepartment(userid);
		
		mav.addObject("type", type);
		mav.addObject("no", no);
		mav.addObject("vo", vo);
		mav.setViewName("management/management");
		return mav;
	}
	@RequestMapping("/managerLogin")
	public String managerLogin() {
		return "management/managerLogin";
	}
	
	@RequestMapping(value="/managerLoginOk", method=RequestMethod.POST) //인터셉터용
	public ModelAndView login(ManagerVO vo, HttpSession session) {
		ModelAndView mav = new ModelAndView();
	    //암호화
		String encryPassword = PwdSha256.encrypt(vo.getUserpwd());
	    vo.setUserpwd(encryPassword);
		ManageDaoImp dao = sqlSession.getMapper(ManageDaoImp.class);
		int result = dao.mangerLogin(vo);
		if(result>=1) {
			mav.addObject("type", "memberManage");
			mav.setViewName("redirect:management");
			session.setAttribute("managerStatus", "Y");
			session.setAttribute("managerId", vo.getUserid());
		}else {
			mav.setViewName("redirect:management");
		}
		return mav;
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
	
	@RequestMapping(value = "/certificationManageList")
	@ResponseBody 
	public Map<String, Object> certificationManageList(CertificationVO boardVO){
		ManageDaoImp dao = sqlSession.getMapper(ManageDaoImp.class);
		Map<String, Object> mp = new HashMap<String, Object>();
		mp.put("data", dao.selectCerti(boardVO));
		return mp;
	}
	@RequestMapping(value = "/memberManageList")
	@ResponseBody 
	public Map<String, Object> memberManageList(MemberVO boardVO){
		ManageDaoImp dao = sqlSession.getMapper(ManageDaoImp.class);
		Map<String, Object> mp = new HashMap<String, Object>();
		mp.put("data", dao.selectMember(boardVO));
		return mp;
	}
	@RequestMapping(value = "/managerList")
	@ResponseBody 
	public Map<String, Object> managerList(ManagerVO boardVO){
		ManageDaoImp dao = sqlSession.getMapper(ManageDaoImp.class);
		Map<String, Object> mp = new HashMap<String, Object>();
		mp.put("data", dao.selectManager(boardVO));
		return mp;
	}
	
	@RequestMapping(value = "/paymentList")
	@ResponseBody 
	public Map<String, Object> paymentList(PaymentVO boardVO){
		ManageDaoImp dao = sqlSession.getMapper(ManageDaoImp.class);
		Map<String, Object> mp = new HashMap<String, Object>();
		mp.put("data", dao.selectPayment(boardVO));
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
	@RequestMapping("/goMyPage")
	public ModelAndView goMyPage(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		String userid = (String)req.getParameter("userid");
		ManageDaoImp dao = sqlSession.getMapper(ManageDaoImp.class);
		//선생검색
		int cnt = dao.countTeacher(userid);
		if(cnt>=1) {
			mav.addObject("userid", userid);
			mav.setViewName("redirect:teacherView");
			return mav;
		}else {
			mav.addObject("userid", userid);
			mav.setViewName("redirect:parentView");
			return mav;
		}
	}
	
	@RequestMapping("/memberMemo")
	public ModelAndView memberMemo(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		String no = (String)req.getParameter("no");
		ManageDaoImp dao = sqlSession.getMapper(ManageDaoImp.class);
		String memo = dao.selectMemo(no);
		
		mav.addObject("no", no);
		mav.addObject("memo", memo);
		mav.setViewName("management/memberMemo");
		return mav;
	}
	@RequestMapping("/memoInsert")
	@ResponseBody
	public String memoInsert(HttpServletRequest req) {
		String no = (String)req.getParameter("no");
		String memo = (String)req.getParameter("memo");
		ManageDaoImp dao = sqlSession.getMapper(ManageDaoImp.class);
		int result = dao.insertMemo(no, memo);
		
		return "ok";
	}

	@RequestMapping("/reasonInsert")
	@ResponseBody
	public String reasonInsert(HttpServletRequest req) {
		String no = (String)req.getParameter("no");
		String reason = (String)req.getParameter("memo");
		ManageDaoImp dao = sqlSession.getMapper(ManageDaoImp.class);
		int result = dao.reasonInsert(no, reason);
		
		return "ok";
	}
	@RequestMapping("/updateActivity")
	@ResponseBody
	public String updateActivity(HttpServletRequest req) {
		String certi = (String)req.getParameter("certi");
		String no = (String)req.getParameter("no");
		String type = (String)req.getParameter("type");
		ManageDaoImp dao = sqlSession.getMapper(ManageDaoImp.class);
		dao.updateActivity(certi, no, type);
		return "";
	}
	
	@RequestMapping("/updateManager")
	@ResponseBody
	public ModelAndView updateManager(ManagerVO vo, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		ManageDaoImp dao = sqlSession.getMapper(ManageDaoImp.class);
		vo = dao.choiceManager(vo.getUserid());
		mav.addObject("vo", vo);
		mav.setViewName("management/managerEdit");
		return mav;
	}
	
	@RequestMapping("/managerEdit")
	@ResponseBody
	public String managerEdit(ManagerVO vo, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		ManageDaoImp dao = sqlSession.getMapper(ManageDaoImp.class);
		int result = dao.updateManaer(vo);
		return "";
	}
	
	
	
	@RequestMapping("/inactivityReason")
	public ModelAndView inactivityReason(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		String no = (String)req.getParameter("no");
		ManageDaoImp dao = sqlSession.getMapper(ManageDaoImp.class);
		String reason = dao.selectReason(no);
		
		mav.addObject("no", no);
		mav.addObject("reason", reason);
		mav.setViewName("management/inactivityReason");
		return mav;
	}
	@RequestMapping("/leaveReason")
	public ModelAndView leaveReason(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		String no = (String)req.getParameter("no");
		ManageDaoImp dao = sqlSession.getMapper(ManageDaoImp.class);
		String reason = dao.selectleaveReason(no);
		
		mav.addObject("no", no);
		mav.addObject("reason", reason);
		mav.setViewName("management/leaveReason");
		return mav;
	}
	@RequestMapping(value="/managerInsert", method=RequestMethod.POST, produces="application/text; charset=UTF-8")
	@ResponseBody
	public String managerRegister(ManagerVO vo, HttpServletRequest req) {
		ManageDaoImp dao = sqlSession.getMapper(ManageDaoImp.class);
		//암호화
		String encryPassword = PwdSha256.encrypt(vo.getUserpwd());
		vo.setUserpwd(encryPassword);
		dao.insertManager(vo);
		return "";
	}
	
	@RequestMapping("/increaseSession")
	@ResponseBody
	public int increaseSession(HttpSession session) throws Exception{
	    int incTime = 1800;
	    session.setMaxInactiveInterval(incTime);
	    return incTime;
	}
}
