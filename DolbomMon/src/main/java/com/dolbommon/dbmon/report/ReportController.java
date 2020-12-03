package com.dolbommon.dbmon.report;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dolbommon.dbmon.member.MemberVO;

@Controller
public class ReportController {
	@Autowired
	SqlSession sqlSession;
	
	
	//신고하기 뷰페이지 이동
	@RequestMapping("/report")
	public ModelAndView reportView(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		//이미지 가져오기 추가. 이미지링크받기. teacher테이블 검색해서 아이디 없으면 맴버테이블에서 조회하기.
		//이미지 파일 이름과 리얼패스만 가지고 경로 넘기기.
		String reportUserid = (String)req.getParameter("userid");
		ReportDaoImp dao = sqlSession.getMapper(ReportDaoImp.class);
		MemberVO vo = dao.memberInfo(reportUserid);
		String name = vo.getUsername();
		String firstName = name.substring(0, 1);
		String lastName = name.substring(name.length()-1);
		//셀렉트로 정보가져와서 뿌리기. 회원번호, 이름
		mav.addObject("vo", vo);
		mav.addObject("firstName", firstName);
		mav.addObject("lastName", lastName);
		mav.setViewName("management/reportView");
		return mav;
	}
	//신고 등록
	
	public ModelAndView reportInsert(HttpServletRequest req, HttpSession ses) {
		ModelAndView mav = new ModelAndView();
		
		return mav;
	}
	
	
	//내 신고리스트
	@RequestMapping("/myReport")
	public ModelAndView myReportList() {
		ModelAndView mav = new ModelAndView();
		
		
		mav.setViewName("management/myReportList");
		return mav;
	}
}
