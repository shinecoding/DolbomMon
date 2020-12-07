package com.dolbommon.dbmon.identity;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.dolbommon.dbmon.board.FreeBoardVO;
import com.dolbommon.dbmon.login.LoginVO;

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
	
	//회원정보 수정폼으로 이동
	@RequestMapping("/identityEdit")
	public ModelAndView identityEdit(IdentityVO vo, HttpSession ses) {
		
		vo.setUserid((String)ses.getAttribute("userid"));
		IdentityDaoImp dao = sqlSession.getMapper(IdentityDaoImp.class);
		List<IdentityVO> list = dao.getIdentity(vo.getUserid());
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("identity/identityEditForm");
		
		return mav;
	}
	
	//회원정보 수정
	@RequestMapping(value="/identityEditOk", method=RequestMethod.POST)
	public ModelAndView identityEditOk(IdentityVO vo, HttpSession ses) {
		
		vo.setUserid((String)ses.getAttribute("userid"));
		IdentityDaoImp dao = sqlSession.getMapper(IdentityDaoImp.class);
		int result = dao.indentityEdit(vo);
		ModelAndView mav = new ModelAndView();
		
		if(result>0) {	//회원정보 수정 성공
			mav.setViewName("identity/resultSuccess");
		}else {	//실패
			mav.setViewName("identity/resultFail");
		}
		return mav;
	}
	//회원탈퇴 폼으로 이동
	@RequestMapping("/withdrawForm")
	public String withdrawform() {

		return "identity/withdraw";	
	}

	//회원탈퇴 신청
	@RequestMapping("/withdraw")
	public ModelAndView withdraw(LoginVO vo, HttpSession ses) {
		
		vo.setUserid((String)ses.getAttribute("userid"));
		IdentityDaoImp dao = sqlSession.getMapper(IdentityDaoImp.class);
		dao.withdraw(vo.getUserid());
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("identity/withdrawResult");
		
		return mav;
	}
	
	
	
	
}
