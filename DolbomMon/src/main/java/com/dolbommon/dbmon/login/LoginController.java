package com.dolbommon.dbmon.login;

import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	
	//계정 정보
	@RequestMapping(value="/idInfo", method=RequestMethod.POST)
	public ModelAndView idInfo(LoginVO vo, HttpServletRequest req) {
		
		vo.setUsername((String)req.getParameter("username"));
		vo.setBirth((String)req.getParameter("birth"));
		vo.setTel1((String)req.getParameter("tel1"));
		
		
		LoginDaoImp dao = sqlSession.getMapper(LoginDaoImp.class);
		LoginVO logVO = dao.findUserid(vo);
		
		ModelAndView mav = new ModelAndView();
		
		//아이디 조회 실패시
		if(logVO==null) {
			mav.setViewName("login/loginResult");
		}else {
			mav.addObject("logVO", logVO);
			mav.setViewName("login/idInfo");
		}
		return mav;
		
	}
	
	//임시비밀번호 발급
	@RequestMapping(value="/temporaryPwd", method=RequestMethod.POST)
	public String temporaryPwd(LoginVO vo, HttpServletRequest req) {
		
		vo.setUsername((String)req.getParameter("username"));
		vo.setBirth((String)req.getParameter("birth"));
		vo.setTel1((String)req.getParameter("tel1"));
		vo.setUserpwd(UUID.randomUUID().toString().replaceAll("-", "").substring(0, 8));
		
	//	System.out.println(vo.getUsername());
	//	System.out.println(vo.getBirth());
	//	System.out.println(vo.getTel1());
	//	System.out.println(vo.getUserpwd());
		
		LoginDaoImp dao = sqlSession.getMapper(LoginDaoImp.class);
		
		int result = dao.pwdChange(vo);
		
		return "login/temporaryPwdResult";
		
	}
	
	
		
		//int pwdResult = dao.pwdChange(vo);
		
		//비밀번호 변경 성공, 임시비밀번호 발송
//		ModelAndView mav = new ModelAndView();
//		if(pwdResult>0) {
			
			
			
		//실패
//		}else {	
		
//		mav.setViewName("login/loginResult");
//		}

	
	
	
	
	
	
}
