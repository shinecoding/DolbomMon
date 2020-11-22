package com.dolbommon.dbmon.message;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MessageController {
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping("/message")
	public ModelAndView message(MessageVO vo, HttpSession session, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		MessageDaoImp dao = sqlSession.getMapper(MessageDaoImp.class);
		
		//==탭번호 확인==
		String tabType = req.getParameter("tabType");
		System.out.println("탭페이지"+tabType);
		if(tabType==null) {
			tabType="1";
		}
		vo.setTabType(tabType);
		

		// "=========================임시 로그인 체크========================"		
		String loginCheck = (String)session.getAttribute("userid");
		if(loginCheck != null) {
			

			//현재페이지 구하기
			String nowPageTxt = req.getParameter("nowPage");
			if(nowPageTxt!=null) {
				vo.setNowPage(Integer.parseInt(nowPageTxt));
			}
			//스팸 메시지 등록된 전체 레코드 숫자. 보관메시지 등록된 전체 레코드 숫자
			if(tabType.equals("4")) {
				vo.setSpam("Y");
			}else if(tabType.equals("3")) {
				vo.setMessage_save("Y");
			}
			//안읽은쪽지 구하기. 쿼리문 생성
			
			vo.setUserid(loginCheck);
			//접속한 아이디의 전체 레코드 숫자
			vo.setTotalRecord(dao.getAllRecordCount(vo));
			System.out.println("접속자아이디 = "+loginCheck);
			System.out.println("토탈레코드수"+vo.getTotalRecord());
			List<MessageVO> list = new ArrayList<MessageVO>();
			
			// 검색어 vo로 넘기기
			String searchKey = (String)req.getParameter("searchKey");
			System.out.println("검색키1"+searchKey);
			System.out.println("검색어2"+req.getParameter("searchWord"));
			//유저아이디 검색시 유사한 아이디 검색 안되게 막기
			if(searchKey!=null) {
				if(!searchKey.equals("userid")) {
					vo.setSearchWord("%"+req.getParameter("searchWord")+"%");
					System.out.println("유저아이디 없음");
				}else {
					vo.setSearchWord(req.getParameter("searchWord"));
					System.out.println("유저아이디 있음");
				}
				vo.setSearchKey(req.getParameter("searchKey"));
			}
			
			System.out.println("검색어"+vo.getSearchWord());
			System.out.println("검색키"+searchKey);
			//검색어 있을때.. 없을때도 상관없이 하나로 되게 바꿈
			try {
			//	if(!(vo.getSearchKey()==null || vo.getSearchWord()==null)) {
			//		list = 	dao.searchWordRecord(vo);
			//	}else {
					list = 	dao.messageAllRecord(vo);
			//	}
			}catch(Exception e) {
				System.out.println("쪽지 리스트 검색에러 --->");
				e.printStackTrace(); 
			}
			
			mav.addObject("tabType", tabType);
			mav.addObject("list", list);
			mav.addObject("pVo", vo);
			mav.setViewName("message/messageMain");

		}else {
			System.out.println("=========================임시 로그인 체크========================");
		}
		System.out.println("vo tab = "+vo.getTabType());
		return mav;
	}
	
	//쪽지에서 글 클릭했을때
	@RequestMapping("/messageContent")
	public ModelAndView messageContent(MessageVO vo, HttpServletRequest req, HttpSession ses) {
		vo.setNo(Integer.parseInt((String)req.getAttribute("no")));
		vo.setNowPage(Integer.parseInt((String)req.getAttribute("nowPage")));
		vo.setTabType((String)req.getAttribute("tabType"));
		
		
		
		ModelAndView mav = new ModelAndView();
		return mav;
		
	}
}
