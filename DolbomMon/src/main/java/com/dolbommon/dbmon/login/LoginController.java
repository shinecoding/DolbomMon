package com.dolbommon.dbmon.login;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {

	SqlSession sqlSession;

	public SqlSession getSqlSession() {
		return sqlSession;
	}
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	//로그인 폼으로 이동

	@RequestMapping("/login")
	public String login() {
		return "login/loginForm";	
	}
	//로그인 화면
	@RequestMapping(value="/loginOk", method=RequestMethod.POST)
	public ModelAndView loginOk(LoginVO vo, HttpSession ses) {
		LoginDaoImp dao = sqlSession.getMapper(LoginDaoImp.class);
		LoginVO resultVO = dao.loginOk(vo);
		ModelAndView mav = new ModelAndView();
		
		if(resultVO==null) {
			mav.setViewName("redirect:login");			
		}else {
			ses.setAttribute("userid", resultVO.getUserid());
			ses.setAttribute("username", resultVO.getUsername());
			ses.setAttribute("logStatus", "Y");
			mav.setViewName("redirect:/");	
		}
		return mav;
	}
	
	//로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession ses) {
		ses.invalidate();
		
		return "home";
	}
	
	//계정찾기 폼으로 이동

	@RequestMapping("/searchId")
	public String searchId() {
		return "login/idSearch";		
	}
	
	//계정 찾기
//	@RequestMapping("/idInfo")
//	public ModelAndView idInfo() {
	
//		return null;	
//	}
	
	//계정 정보
	@RequestMapping("/idInfo")
	public String idInfo() {
		
		return "login/idInfo";
	}
}
