package com.dolbommon.dbmon.message;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
			System.out.println("현재페이지 확인"+nowPageTxt);
			
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
			mav.addObject("nowPage", vo.getNowPage());
			mav.addObject("tabType", tabType);
			mav.addObject("list", list);
			mav.addObject("pVo", vo);
			mav.setViewName("message/messageMain");

		}else {
			System.out.println("=========================임시 로그인 체크========================");
		}
		System.out.println("vo tab = "+vo.getTabType());
		
		//안읽은 쪽지 내역 찍기
		int result =0; 
		try {
			result = dao.newMessage(vo);
		}catch(Exception e) {
			System.out.println("안읽은 쪽지 내역 확인 에러-->"+e.getMessage());
		}
		mav.addObject("newMessage", result);
		return mav;
	}
	
	//쪽지에서 글 클릭했을때
	@RequestMapping("/messageContent")
	public ModelAndView messageContent(MessageVO vo, HttpServletRequest req, HttpSession ses) {
		System.out.println("vo에 자동 들어가는지 테스트"+vo.getNo()+vo.getNowPage()+vo.getTabType());
		String loginCheck = (String)ses.getAttribute("userid");
		
		MessageDaoImp dao = sqlSession.getMapper(MessageDaoImp.class);
		MessageVO resultVo = dao.messageView(vo); 
		ModelAndView mav = new ModelAndView();
		String tabType = (String)req.getParameter("tabType");
		String nowPage = (String)req.getParameter("nowPage");
		
			if(loginCheck.equals(resultVo.getUserid_w()) || loginCheck.equals(resultVo.getUserid_r())) {
				//내가 보낸 메시지인지 확인하는부분
				if(tabType.equals("2")) {
					mav.addObject("tabType",tabType);
					mav.addObject("nowPage",nowPage);
					mav.addObject("vo", resultVo);
					mav.setViewName("message/messageView");
				}else {
					//읽은글 체크하는부분
					int result=0;
					try {
						result = dao.readMessage(vo.getNo());
					}catch(Exception e){
						System.out.println("읽은글 전환 에러 -->" + e.getMessage());
					}
					if(result>=1) {
						mav.addObject("tabType",tabType);
						mav.addObject("nowPage",nowPage);
						mav.addObject("vo", resultVo);
						mav.setViewName("message/messageView");
					}else {
						mav.addObject("msg", "읽은글 전환 에러가 발생하였습니다. 관리자에게 문의하세요.");
						mav.addObject("back", 2);
						mav.setViewName("redirect:back");
					}
				
				}
			}else{
				mav.addObject("msg", "로그인 상태를 확인하세요.");
				mav.setViewName("message/loginCheck");
			}
		
		//세션 로그인 아이디 받아서 R(읽은아이디) W(보낸아이디)와 비교. 둘중 일치하는게 있으면
		//검색은 no로

		return mav;
	}
	
	//뒤로가기 .. back=숫자 & msg=내용 .. back쓴 숫자만큼 뒤로가고 msg에 쓴 내용이 alert로 출력된다.
	@RequestMapping("/back")
	public ModelAndView historyBack(HttpServletRequest req) {
		String msg = (String)req.getParameter("msg");
		String back = (String)req.getParameter("back");
		ModelAndView mav = new ModelAndView();
		mav.addObject("back", back);
		mav.addObject("msg", msg);
		mav.setViewName("message/loginCheck");
		return mav;
	}
	
	//쪽지보내기폼으로 이동
	@RequestMapping("/messageWrite")
	public ModelAndView messageWrite(HttpServletRequest req, HttpSession ses) {
		String userid_w = (String)ses.getAttribute("userid");
		String userid_r = (String)req.getParameter("receiveId");
		
		System.out.println("보낸아이디"+userid_r);
		System.out.println("받는아이디"+userid_w);
		ModelAndView mav = new ModelAndView();
		mav.addObject("userid_r", userid_r);
		mav.addObject("userid_w", userid_w);
		mav.setViewName("message/messageWrite");
		return mav;
	}
	
	//쪽지보내기
	@RequestMapping(value="/messageWriteOk", method=RequestMethod.POST)
	public ModelAndView messageWriteOk(MessageVO vo, HttpSession ses) {
		String loginCheck = (String)ses.getAttribute("userid");
		ModelAndView mav = new ModelAndView();
		System.out.println("쪽지보내기 아이디"+loginCheck);
		System.out.println("쪽지보내기 아이디"+vo.getUserid_w());
		
		if(!vo.getUserid_w().equals(loginCheck)){
			mav.addObject("msg", "로그인 상태를 확인하세요.");
			mav.addObject("back", 2);
			mav.setViewName("redirect:back");
		}else {
			
			//여기서 스팸여부 확인해야함. userid_r
			MessageDaoImp dao = sqlSession.getMapper(MessageDaoImp.class);
			int result=0;
			try {
			result = dao.messageWrite(vo);
			}catch(Exception e) {
				System.out.println("쪽지보내기 에러" + e.getMessage());
			}
			if(result>=1) {
				mav.setViewName("redirect:message");
			}else {
				mav.addObject("msg", "쪽지 보내기를 실패하였습니다. 제목은 한글 100자, 내용은 한글 1500자까지 허용됩니다.");
				mav.addObject("back", 1);
				mav.setViewName("redirect:back");
			}
			
		}
		
		return mav;
	}
	//메시지 삭제
	@RequestMapping(value="/deleteMessage", method=RequestMethod.POST)
	public ModelAndView deleteMessage(HttpServletRequest req, HttpSession ses) {
		ModelAndView mav = new ModelAndView();
		System.out.println("접속아이디확인"+req.getParameter("userid"));;
		//로그인 체크
		if(!req.getParameter("userid").equals(ses.getAttribute("userid"))){
			mav.addObject("msg", "로그인 상태를 확인하세요.");
			mav.addObject("back", 2);
			mav.setViewName("redirect:back");
		}else {
			String[] checkBoxNo = req.getParameterValues("delCheck[]");
			MessageDaoImp dao = sqlSession.getMapper(MessageDaoImp.class);
			int result = 0;
			for(String i : checkBoxNo) {
				System.out.println("no값 출력 ==> "+i);
				int no = Integer.parseInt(i);
				try {
					result = dao.MessageDelete(no);
				}catch(Exception e) {
					System.out.println("메시지 삭제 실패-->"+e.getMessage());
				}
			}
			
			if(result>=1) {
				mav.setViewName("redirect:message");
			}else {
				mav.addObject("msg", "메시지 삭제에 실패하였습니다.");
				mav.addObject("back", 2);
				mav.setViewName("redirect:back");
			}
		}
		return mav;
	}
	
	
	@RequestMapping(value="/saveMessage", method=RequestMethod.POST)
	public ModelAndView saveMessage(HttpServletRequest req, HttpSession ses) {
		ModelAndView mav = new ModelAndView();
		System.out.println("접속아이디확인"+req.getParameter("userid"));;
		//로그인 체크
		if(!req.getParameter("userid").equals(ses.getAttribute("userid"))){
			mav.addObject("msg", "로그인 상태를 확인하세요.");
			mav.addObject("back", 2);
			mav.setViewName("redirect:back");
		}else {
			String[] checkBoxNo = req.getParameterValues("delCheck[]");
			MessageDaoImp dao = sqlSession.getMapper(MessageDaoImp.class);
			int result = 0;
			for(String i : checkBoxNo) {
				System.out.println("no값 출력 ==> "+i);
				int no = Integer.parseInt(i);
				try {
					result = dao.saveMessage(no);
				}catch(Exception e) {
					System.out.println("메시지 저장 실패-->"+e.getMessage());
				}
			}
			
			if(result>=1) {
				mav.setViewName("redirect:message");
			}else {
				mav.addObject("msg", "메시지 저장에 실패하였습니다.");
				mav.addObject("back", 2);
				mav.setViewName("redirect:back");
			}
		}
		return mav;
	}
}
