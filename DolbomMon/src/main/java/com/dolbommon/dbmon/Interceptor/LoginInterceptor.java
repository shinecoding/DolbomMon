package com.dolbommon.dbmon.Interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import com.dolbommon.dbmon.login.LoginDaoImp;
import com.dolbommon.dbmon.login.LoginVO;

public class LoginInterceptor implements HandlerInterceptor {

	SqlSession sqlSession;

	public SqlSession getSqlSession() {
		return sqlSession;
	}
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		//자동로그인 인터셉터
		HttpSession ses = request.getSession();
		Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
		LoginDaoImp dao = sqlSession.getMapper(LoginDaoImp.class);
			if (loginCookie != null) {		
				LoginVO vo = dao.checkLoginBefore(loginCookie.getValue());
				
				if (vo!=null)
					ses.setAttribute("userid", vo.getUserid());
					ses.setAttribute("username", vo.getUsername());
					ses.setAttribute("logStatus", "Y");
			}
		return true;
	}
	
	//컨트롤러가 실행된 후 view 페이지로 이동하기 전에 호출된다.
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, @Nullable ModelAndView modelAndView) throws Exception {
		
	}
	
	//컨트롤러가 실행된 후 호출된다.
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, @Nullable Exception ex) throws Exception {
		
	}
}
