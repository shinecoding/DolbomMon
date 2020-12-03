package com.dolbommon.dbmon.identity;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IdentityController {

	SqlSession sqlSession;

	public SqlSession getSqlSession() {
		return sqlSession;
	}
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//계정관리 페이지로 이동
	@RequestMapping("/identityForm")
	public ModelAndView identityForm(IdentityVO vo, HttpSession ses) {
		
		vo.setUserid((String)ses.getAttribute("userid"));	//id 구하기
		IdentityDaoImp dao = sqlSession.getMapper(IdentityDaoImp.class);
		List<IdentityVO> list = dao.getIdentity(vo.getUserid());
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("identity/identityForm");
		
		return mav;	
	}

	
	//회원정보 수정
	
	
	
	//회원탈퇴
	
	
	
	
}
