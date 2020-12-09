package com.dolbommon.dbmon.login;

import java.util.Properties;
import java.util.UUID;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import com.dolbommon.dbmon.member.MemberVO;

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
	public ModelAndView loginOk(LoginVO vo, HttpSession ses, HttpServletRequest req, HttpServletResponse res) {
		//기존 세션값 제거
		if(ses.getAttribute("logStatus")!=null) {
			ses.removeAttribute("logStatus");	
		}

		LoginDaoImp dao = sqlSession.getMapper(LoginDaoImp.class);
		
		LoginVO resultVO = dao.loginOk(vo);
		ModelAndView mav = new ModelAndView();
		
		if(resultVO==null) {	//실패
			mav.setViewName("login/loginResult");			
		}else {
			MemberVO mVo = dao.getMemberType(vo.getUserid());
			//로그인 성공시 세션 만들기
			ses.setAttribute("who", mVo.getWho());
			ses.setAttribute("userid", resultVO.getUserid());
			ses.setAttribute("username", resultVO.getUsername());
			ses.setAttribute("logStatus", "Y");
			System.out.println(mVo.getWho());
			System.out.println(resultVO.getUsername());
			
			//자동로그인 선택시 쿠키 생성
			if(req.getParameter("loginCookie")!=null) {
				Cookie loginCookie = new Cookie("loginCookie", ses.getId());
				vo.setSessionKey(ses.getId());
				loginCookie.setPath("/dbmon");
				loginCookie.setMaxAge(60*60*24*7);
				res.addCookie(loginCookie);
				dao.keepLogin(vo);	//세션아이디와 유효기간을 vo에 저장
			}
			mav.setViewName("redirect:/");
		}
		return mav;
	}
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(LoginVO vo, HttpSession ses, HttpServletRequest req, HttpServletResponse res){
		/*
		Cookie[] cookies = req.getCookies(); // 모든 쿠키의 정보를 cookies에 저장
	
			if(cookies != null){ 
	
			for(int i=0; i< cookies.length; i++){ 
	
			cookies[i].setMaxAge(0); 
	
			res.addCookie(cookies[i]); 
	
			}
		}
		*/
		Cookie cookie = new Cookie("loginCookie", null);
		cookie.setMaxAge(0);
		res.addCookie(cookie);
		ses.invalidate();
		return "home";
	}
	
	/*
	//로그아웃
	@RequestMapping("/logout")
	public String logout(LoginVO vo, HttpSession ses, HttpServletRequest req, HttpServletResponse res) {	
		
		
		if(ses.getAttribute("userid")!=null) {
			
			vo.setUserid((String)ses.getAttribute("userid"));
			System.out.println(vo.getUserid());
			LoginDaoImp dao = sqlSession.getMapper(LoginDaoImp.class);
			
			Cookie loginCookie = WebUtils.getCookie(req, "loginCookie");
			if (loginCookie != null) {
				
				loginCookie = new Cookie("loginCookie", null);
				loginCookie.setMaxAge(0);
				loginCookie.setPath("/");
			    res.addCookie(loginCookie);
				dao.cookieReset(vo.getUserid());
				//ses.invalidate();
			}
		return "home";
	}
	*/
	
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
		
		StringBuffer sb1 = new StringBuffer(vo.getTel1());
		StringBuffer sbTel = sb1.insert(3, "-");
		sbTel = sb1.insert(8, "-");
		String strTel = sbTel.toString();	//010-1111-2222
		vo.setTel1(strTel);
		
		StringBuffer sb2 = new StringBuffer(vo.getBirth());
		StringBuffer sbBirth = sb2.insert(4, "-");
		sbBirth = sb2.insert(7, "-");
		String strBirth = sbBirth.toString();	//1999-12-12
		vo.setBirth(strBirth);
		
		LoginDaoImp dao = sqlSession.getMapper(LoginDaoImp.class);
		LoginVO logVO = dao.findUserid(vo);
		
		ModelAndView mav = new ModelAndView();
		
		if(logVO==null) {	//아이디 조회 실패시
			mav.setViewName("login/loginResult");
		}else {
			mav.addObject("logVO", logVO);
			mav.setViewName("login/idInfo");
		}
		return mav;	
	}
	
	//임시비밀번호 발급 및 변경
	@RequestMapping(value="/temporaryPwd", method=RequestMethod.POST)
	public ModelAndView temporaryPwd(LoginVO vo, HttpServletRequest req) throws AddressException, MessagingException {
		
		vo.setUserpwd(UUID.randomUUID().toString().replaceAll("-", "").substring(0, 10));
		vo.setUsername((String)req.getParameter("username"));
		vo.setBirth((String)req.getParameter("birth"));
		vo.setTel1((String)req.getParameter("tel1"));
		vo.setEmail((String)req.getParameter("email"));	
		
		StringBuffer sbBirth = new StringBuffer(vo.getBirth());
		sbBirth.delete(10, 22);	
		String strBirth = sbBirth.toString();
		vo.setBirth(strBirth);
		
		LoginDaoImp dao = sqlSession.getMapper(LoginDaoImp.class);		
		int result = dao.pwdChange(vo);		
		ModelAndView mav = new ModelAndView();

		//메일 보내기
		String host = "smtp.gmail.com";  
		final String username = "dolbommon00"; //도메인을 제외한 발신자 아이디
		final String password = "dolbommon1234"; //발신자 네이버 이메일 비밀번호
		int port = 465; //포트번호
		
		//메일 내용  
		String recipient = "seulgi4229@naver.com"; //받는 사람의 이메일 주소
		String subject = "맘시터가 보내드리는 임시 비밀번호입니다."; //메일 제목  
		String body = "임시 비밀번호는 "+ vo.getUserpwd() + "입니다.\n임시 비밀번호로 로그인 해주세요."; //메일 내용  
	
		Properties props = System.getProperties();  
	
		//정보를 담기 위한 객체 생성  
		//SMTP 서버 정보 설정  
		props.put("mail.smtp.host", host);  
		props.put("mail.smtp.port", port);  
		props.put("mail.smtp.auth", "true");  
		props.put("mail.smtp.ssl.enable", "true");  
		props.put("mail.smtp.ssl.trust", host);  
	
		//Session 생성  
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {  
			String un=username;  
			String pw=password;  
			protected javax.mail.PasswordAuthentication getPasswordAuthentication() {  
				return new javax.mail.PasswordAuthentication(un, pw);  
			}  
		});
	
		session.setDebug(true); //for debug  
		Message mimeMessage = new MimeMessage(session); //MimeMessage 생성 
		mimeMessage.setFrom(new InternetAddress("seulgi4229@naver.com")); //보내는 사람의 이메일주소를 한번 더 입력 도메인 포함한 전체 주소  
		mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); //수신자 셋팅
		mimeMessage.setSubject(subject); //제목 셋팅
		mimeMessage.setText(body); //내용 셋팅
		Transport.send(mimeMessage); //javax.mail.Transport.send() 이용	
		
		//////////////////////////////////////////////////////
		
		if(result>0) {	//성공
			mav.setViewName("login/temporaryPwdResult");	
		}else {	//실패
			mav.setViewName("login");	
		}
		return mav;	
	}
	
	
	//임시로그인버튼 작동.. 추후 삭제 요망
	@RequestMapping("/temporaryLogin")
	public ModelAndView temporaryLogin(LoginVO vo, HttpSession ses) {
		LoginDaoImp dao = sqlSession.getMapper(LoginDaoImp.class);
		vo.setUserid("test1");
		vo.setUserpwd("03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4");
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
	
}
