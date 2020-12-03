package com.dolbommon.dbmon.report;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	@RequestMapping(value="/reportInsert", method=RequestMethod.POST)
	public ModelAndView reportInsert(ReportVO vo, HttpServletRequest req, HttpSession ses) {
		ModelAndView mav = new ModelAndView();
		vo.setUserid((String)ses.getAttribute("userid"));//신고자아이디
		ReportDaoImp dao = sqlSession.getMapper(ReportDaoImp.class);
		if(vo.getUserid()!=null && !vo.getUserid().equals("")) {
			try {
				vo.setShingo_name(dao.selectName(vo.getShingo_id()));
				dao.insertReport(vo);
			}catch(Exception e) {
				System.out.println("신고테이블 등록에러 ==>"+e.getMessage());
				mav.addObject("msg", "신고접수를 완료하지 못했습니다. 고객센터에 문의하세요.");
				mav.addObject("back", 2);
				mav.setViewName("message/loginCheck");
				return mav;
			}
		}else {
			mav.addObject("msg", "로그인 상태를 확인하세요.");
			mav.addObject("back", 2);
			mav.setViewName("message/loginCheck");
			return mav;
		}
		
		mav.setViewName("redirect:myReport");
		return mav;
	}
	
	
	//내 신고리스트
	@RequestMapping("/myReport")
	public ModelAndView myReportList(HttpSession ses) {
		ModelAndView mav = new ModelAndView();
		String userid = (String)ses.getAttribute("userid");
		List<ReportVO> list = null;
		ReportDaoImp dao = sqlSession.getMapper(ReportDaoImp.class);
		if(userid!=null && !userid.equals("")) {
			//이름앞뒤
			list = dao.reportInfo(userid);
		}else{
			mav.addObject("msg", "로그인 상태를 확인하세요.");
			mav.addObject("back", 2);
			mav.setViewName("message/loginCheck");
			return mav;
		}
		mav.addObject("list", list);
		mav.setViewName("management/myReportList");
		return mav;
	}
}
