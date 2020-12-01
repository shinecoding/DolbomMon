package com.dolbommon.dbmon.pay;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class PayController {
	SqlSession sqlSession;

	public SqlSession getSqlSession() {
		return sqlSession;
	}
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	// =======================================================

	@RequestMapping("/payment")
	public ModelAndView payment(HttpSession ses) {
		String userid = (String)ses.getAttribute("userid");
		PayDaoImp dao = sqlSession.getMapper(PayDaoImp.class);
		MemberVO mvo = dao.selectPayMember(userid);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("mvo", mvo);
		mav.setViewName("pay/payment");
		return mav;
	}
	
	@RequestMapping(value="/paySuccess", method=RequestMethod.POST)
	public ModelAndView paySuccess(HttpServletRequest req) {
		String msg = req.getParameter("msg");
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.setViewName("pay/paySuccess");
		return mav;
	}
	
}
