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
			//읽는 순간 해당번호 글의 message_save를 Y로 등록
			//리스트에서 Y로 등록된 글의 색은 회색으로 변하게 세팅.
			//N일경우 파란색으로 보이게 세팅
			
			//공지사항 여부 구하기.
			//테이블에 공지사항여부 체크 테이블 추가
			//공지사항일경우 위쪽에 추가. (최대 2~3개?)
			
			
			//스팸등록하기 방법
			//userid가 받는이. 차단할 아이디가 보낸이.
			//userid일때 차단할 아이디 테이블 생성.
			//차단할 아이디가 메시지 보낼때 이 테이블 검색해서 userid와 보낼대상이 일치할경우 spam을 Y로 등록
			//스팸 등록 버튼 누르는 순간 userid대상으로 보낸 차단할 아이디의 모든 글의 spam을 Y로바꿈
			//차단 해제는 위 테이블에서 두 아이디 비교해서 레코드 삭제. 글의 spam을 모두 N으로바꿈
			
			
			
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
		vo.setNo(Integer.parseInt((String)req.getParameter("no")));
		vo.setNowPage(Integer.parseInt((String)req.getParameter("nowPage")));
		vo.setTabType((String)req.getParameter("tabType"));
		vo.setUserid((String)ses.getAttribute("userid"));
		
		MessageDaoImp dao = sqlSession.getMapper(MessageDaoImp.class);
		MessageVO resultVO = dao.messageView(vo); 
		
		//세션 로그인 아이디 받아서 R(읽은아이디) W(보낸아이디)와 비교. 둘중 일치하는게 있으면
		//검색은 no로
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", resultVO);
		mav.setViewName("message/messageView");
		return mav;
		
	}
	
	
}
