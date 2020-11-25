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
	
	@RequestMapping(value="/message", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView message(MessageVO vo, HttpSession session, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		MessageDaoImp dao = sqlSession.getMapper(MessageDaoImp.class);
		String prevWord = req.getParameter("searchWord"); //검색어 넘길값. 이거없으면 다음페이지값 안나옴.
		//==탭번호 확인==
		String tabType = req.getParameter("tabType");
		System.out.println("=====================탭페이지"+tabType+"=====================");
		System.out.println("검색어2"+req.getParameter("searchWord"));
		System.out.println("검색어3"+vo.getSearchWord());
		System.out.println("테스트갑 받아보기 ===="+req.getParameter("test"));
		System.out.println("테스트갑 현재페이지 받아보기 ===="+req.getParameter("nowPage"));
		
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
			System.out.println("현재페이지 확인==> "+nowPageTxt);
			System.out.println("현재페이지 확인vo==> "+vo.getNowPage());
			
			//스팸 메시지 등록된 전체 레코드 숫자. 보관메시지 등록된 전체 레코드 숫자
			if(tabType.equals("4")) {
				vo.setSpam("Y");
			}else if(tabType.equals("3")) {
				vo.setMessage_save_r("Y");
			}
			
			//공지사항 여부 구하기.(공지사항 게시판)
			//공지사항일경우 위쪽에 추가. (최대 2~3개? 1개만?)
			
			vo.setUserid(loginCheck);
			
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
						
			//접속한 아이디의 전체 레코드 숫자. 검색어 있을때와 없을때
			System.out.println("현재페이지값 확인"+vo.getNowPage());
			vo.setTotalRecord(dao.getAllRecordCount(vo));
			System.out.println("접속자아이디 = "+loginCheck);
			System.out.println("토탈레코드수"+vo.getTotalRecord());
			List<MessageVO> list = new ArrayList<MessageVO>();
			

			System.out.println("검색어"+vo.getSearchWord());
			System.out.println("검색키"+searchKey);
			//검색어 있을때.. 없을때도 상관없이 하나로 되게 바꿈
			try {
				list = 	dao.messageAllRecord(vo);
			}catch(Exception e) {
				System.out.println("쪽지 리스트 검색에러 --->");
				e.printStackTrace(); 
			}
			mav.addObject("nowPage", vo.getNowPage());
			mav.addObject("prevWord", prevWord);
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
		
		System.out.println("마지막 검색어 확인==="+prevWord);
		return mav;
	}
	
	//쪽지 회원검색탭 눌렀을때
	@RequestMapping(value="/messageMemberSearch", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView messageMemberSearch(MessageVO vo, HttpSession session, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();		
		MessageDaoImp dao = sqlSession.getMapper(MessageDaoImp.class);
		String prevWord = req.getParameter("searchWord");
		//레코드 다 출력하기.
		
		//레코드 수 구하기
		
		//페이징
		
		
		
		mav.setViewName("message/messageMember");
		return mav;
	}
	
	//쪽지 클릭했을때
	@RequestMapping("/messageContent")
	public ModelAndView messageContent(MessageVO vo, HttpServletRequest req, HttpSession ses) {
		System.out.println("vo에 자동 들어가는지 테스트"+vo.getNo()+vo.getNowPage()+vo.getTabType());
		String loginCheck = (String)ses.getAttribute("userid");
		
		MessageDaoImp dao = sqlSession.getMapper(MessageDaoImp.class);
		MessageVO resultVo = dao.messageView(vo); 
		ModelAndView mav = new ModelAndView();
		String tabType = (String)req.getParameter("tabType");
		String nowPage = (String)req.getParameter("nowPage");
		System.out.println("받는이-"+resultVo.getUserid_r());
		System.out.println("보낸이-"+resultVo.getUserid_w());
		resultVo.setUserid(loginCheck);
		
			if(loginCheck.equals(resultVo.getUserid_w()) || loginCheck.equals(resultVo.getUserid_r())) {
					int result=0;
					try {
						
						result = dao.readMessage(resultVo);
						if(!tabType.equals("1")) {
							result+=1;
						}
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
				
//				}
			}else{
				mav.addObject("msg", "로그인 상태를 확인하세요.");
				mav.setViewName("message/loginCheck");
			}
		
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
		System.out.println("쪽지보내기 아이디"+vo.getUserid_r());
		System.out.println(vo.getSubject());
		System.out.println(vo.getContent());
		
		if(!vo.getUserid_w().equals(loginCheck)){
			mav.addObject("msg", "로그인 상태를 확인하세요.");
			mav.addObject("back", 2);
			mav.setViewName("redirect:back");
		}else {
			//vo.getUserid_w이 스팸유저일때. userid_r= userid로 보내는 모든 쪽지는 spam이 Y 
			System.out.println("받는이 차단한이 받는이"+vo.getUserid_r());
			System.out.println("보내는이 스팸 보내는이"+vo.getUserid_w());
			MessageDaoImp dao = sqlSession.getMapper(MessageDaoImp.class);
			
			int cnt=0;
			cnt = dao.checkSpamId(vo.getUserid_r(), vo.getUserid_w());
			if(cnt>=1) {
				//스팸유저인것
				int result=0;
				try {
				result = dao.spamWrite(vo);
				}catch(Exception e) {
					System.out.println("쪽지보내기 에러" + e.getMessage());
				}
				if(result>=1) {
					mav.setViewName("redirect:message");
				}else {
					mav.addObject("msg", "errorcode-1");
					mav.addObject("back", 1);
					mav.setViewName("redirect:back");
				}
				
			}else { //스팸유저 아닌것.
				int result=0;
				try {
				result = dao.messageWrite(vo);
				}catch(Exception e) {
					System.out.println("쪽지보내기 에러" + e.getMessage());
				}
				if(result>=1) {
					mav.setViewName("redirect:message");
				}else {
					mav.addObject("msg", "errorcode-1");
					mav.addObject("back", 1);
					mav.setViewName("redirect:back");
				}
			}
		}
		
		return mav;
	}
	//쪽지창에서 체크박스로 쪽지 삭제(상태변환. 테이블에서 삭제되지는 않는다.)
	@RequestMapping(value="/deleteMessage", method=RequestMethod.POST)
	public ModelAndView deleteMessage(HttpServletRequest req, HttpSession ses) {
		ModelAndView mav = new ModelAndView();
		MessageDaoImp dao = sqlSession.getMapper(MessageDaoImp.class);
		
		String loginCheck = (String)ses.getAttribute("userid");
		System.out.println("접속아이디확인"+req.getParameter("userid"));
		//로그인 체크
		if(!req.getParameter("userid").equals(loginCheck)){
			mav.addObject("msg", "로그인 상태를 확인하세요.");
			mav.addObject("back", 100);
			mav.setViewName("redirect:back");
		}else {
			String[] checkBoxNo = req.getParameterValues("delCheck[]");
			
			int result = 0;
			for(String i : checkBoxNo) {
				System.out.println("no값 출력 ==> "+i);
				int no = Integer.parseInt(i);
				String viewType="";
				
				MessageVO resultVo = dao.loginCheck(no);
				
				if(resultVo.getUserid_r().equals(loginCheck)) {
					viewType="recieve";
				}else {
					viewType="send";
				}
				try {
					result = dao.messageDel(no, viewType); 
				
				}catch(Exception e) {
					System.out.println("메시지 삭제 실패-->"+e.getMessage());
				}
				
				if(result>=1) {
					mav.setViewName("redirect:message");
				}else {
					mav.addObject("msg", "삭제에 실패하였습니다.");
					mav.addObject("back", 2);
					mav.setViewName("redirect:back");
				}
			}
		}
		return mav;
	}
	
	//쪽지 내용 보기에서 삭제
	@RequestMapping("/deleteMessage2")
	public ModelAndView deleteMessage2(MessageVO vo, HttpServletRequest req, HttpSession ses) {
		int no = Integer.parseInt(req.getParameter("no"));
		ModelAndView mav = new ModelAndView();
		String loginCheck = (String)ses.getAttribute("userid");
		MessageDaoImp dao = sqlSession.getMapper(MessageDaoImp.class);
		MessageVO resultVo = dao.loginCheck(no);
		if(resultVo.getUserid_r().equals(loginCheck) || resultVo.getUserid_w().equals(loginCheck)) {
			String viewType="";
			if(resultVo.getUserid_r().equals(loginCheck)) {
				viewType="recieve";
			}else {
				viewType="send";
			}
			//쪽지 보기상태 변환시키기(삭제된것처럼)
			int result=0;
			try {
			result = dao.messageDel(no, viewType); 
			}catch(Exception e) {
				System.out.println("쪽지 보기상태 변환 에러 ->"+e.getMessage());
			}
			
			if(result>=1) {
				mav.setViewName("redirect:message");
			}else {
				mav.addObject("msg", "삭제에 실패하였습니다.");
				mav.addObject("back", 2);
				mav.setViewName("redirect:back");
			}
		}else {
			mav.addObject("msg", "로그인 상태를 확인하세요.");
			mav.addObject("back", 100);
			mav.setViewName("redirect:back");
		}
		return mav;
	}
	
	
	//쪽지 목록에서 쪽지 저장 
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
				String tabType = req.getParameter("tabType");
				System.out.println("tabType 확인하기."+tabType);
				try {
					result = dao.saveMessage(no, tabType);
				}catch(Exception e) {
					System.out.println("쪽지 저장 실패-->"+e.getMessage());
				}
			}
			
			if(result>=1) {
				mav.setViewName("redirect:message");
			}else {
				mav.addObject("msg", "쪽지 저장에 실패하였습니다.");
				mav.addObject("back", 2);
				mav.setViewName("redirect:back");
			}
		}
		return mav;
	}
	
	//쪽지 내용 보기에서 쪽지 저장
	@RequestMapping("/saveMessage2")
	public ModelAndView saveMessage2(MessageVO vo, HttpServletRequest req, HttpSession ses) {
		int no = Integer.parseInt(req.getParameter("no"));
		ModelAndView mav = new ModelAndView();
		String loginCheck = (String)ses.getAttribute("userid");
		String tabType = (String)req.getParameter("tabType");
		MessageDaoImp dao = sqlSession.getMapper(MessageDaoImp.class);
		MessageVO resultVo = dao.loginCheck(no);
		if(resultVo.getUserid_r().equals(loginCheck) || resultVo.getUserid_w().equals(loginCheck)) {
			String viewType="";
			if(resultVo.getUserid_r().equals(loginCheck)) {
				viewType="recieve";
			}else {
				viewType="send";
			}
		
			int result=0;
			try {
			result = dao.saveMessage(no, tabType); 
			}catch(Exception e) {
				System.out.println("쪽지 저장 실패-->"+e.getMessage());
			}
			
			if(result>=1) {
				mav.setViewName("redirect:message");
			}else {
				mav.addObject("msg", "쪽지 저장에 실패하였습니다.");
				mav.addObject("back", 2);
				mav.setViewName("redirect:back");
			}
			
		}else {
			mav.addObject("msg", "로그인 상태를 확인하세요.");
			mav.addObject("back", 100);
			mav.setViewName("redirect:back");
		}
		return mav;
	}
	
	//스팸 등록하기.
	@RequestMapping("/spamUser")
	public ModelAndView spamUserRegistration(HttpServletRequest req, HttpSession ses) {
		ModelAndView mav = new ModelAndView();
		
		MessageDaoImp dao = sqlSession.getMapper(MessageDaoImp.class);
		String spamId = (String)req.getParameter("spamId");
		String recieveId = (String)req.getParameter("recieveId");
		String sessionID = (String)ses.getAttribute("userid");
		System.out.println(spamId);
		System.out.println(recieveId);
		System.out.println(sessionID);
		if(recieveId.equals(sessionID) && !recieveId.equals(spamId)) {
			//테이블에 스팸유저 등록.
			int cnt=0; //등록유저인지확인
			int result=0; //유저등록결과
			int result2=0; //스팸유저에게 받은 모든 쪽지 스팸전환결과
			
			try {
				//스팸등록한 유저인지 확인.	
				cnt = dao.checkSpamId(recieveId, spamId);
				
				if(cnt==0) {
					 //스팸유저 등록
					result = dao.registerSpamId(recieveId, spamId);
					if(result>=1) {
						result2 = dao.changSpam(recieveId, spamId);
						if(result2>=1) {
							mav.setViewName("redirect:message");
						}else {
							mav.addObject("msg", "스팸유저가 보낸 쪽지를 스팸게시판으로 이동하는데 실패하였습니다. 고객센터에 문의하세요.");
							mav.addObject("back", 2);
							mav.setViewName("redirect:back");
						}
					}else {
						mav.addObject("msg", "스팸유저 등록에 실패하였습니다. 고객센터에 문의하세요.");
						mav.addObject("back", 2);
						mav.setViewName("redirect:back");
					}
				}else{
					mav.addObject("msg", "이미 스팸유저로 등록된 아이디입니다.");
					mav.addObject("back", 2);
					mav.setViewName("redirect:back");
				}
				
			}catch(Exception e) {
				System.out.println("스팸유저 등록 에러 ==>"+e.getMessage());
			}
			
		}else {
			mav.addObject("msg", "로그인 상태를 확인하세요. 자신이 받은 메시지만 스팸 등록할 수 있습니다.");
			mav.addObject("back", 2);
			mav.setViewName("redirect:back");
		}
		return mav;
	}
	
	
	//스팸등록 취소기능
	@RequestMapping(value="/spamCancel", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView spamCancel(HttpServletRequest req, HttpSession ses) {
		MessageDaoImp dao = sqlSession.getMapper(MessageDaoImp.class);
		ModelAndView mav = new ModelAndView();
		String recieveId = (String)req.getParameter("userid");
		String spamId = (String)req.getParameter("messageUserid");
		
		spamId = spamId.trim(); //공백제거
		int cnt=0;
		int result=0;
		int result2=0;
		
		try {
			//스팸테이블에 있는지 값 확인
			cnt = dao.checkSpamId(recieveId, spamId);
			if(cnt>=1) {
				//스팸테이블에서 제거
				result = dao.spamCancel(recieveId, spamId);
				if(result>=1) {
					//스팸게시글 정상화
					result2 = dao.changMessage(recieveId, spamId);
					if(result2>=1) {
						mav.setViewName("redirect:message");
					}else {
						mav.addObject("msg", "스팸 해제된 유저의 게시글을 정상화하는데 실패하였습니다. 고객센터에 문의하세요.");
						mav.addObject("back", 2);
						mav.setViewName("redirect:back");
					}
				}else {
					mav.addObject("msg", "스팸 등록 해제에 실패하였습니다. 고객센터에 문의하세요.");
					mav.addObject("back", 2);
					mav.setViewName("redirect:back");
				}
				
			}else {
				mav.addObject("msg", "이미 스팸 등록 해제된 아이디입니다.");
				mav.addObject("back", 2);
				mav.setViewName("redirect:back");
			}
			
		}catch(Exception e) {
			System.out.println("스팸유저 등록 취소 에러-->"+e.getMessage());
		}
		
		return mav;
	}
	
	//신고게시판 글쓰기로 이동하기. 신고기능 추가되면.
	
	
}
