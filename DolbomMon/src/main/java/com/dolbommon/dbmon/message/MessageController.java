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
	public ModelAndView message(HttpSession session, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		MessageDaoImp dao = sqlSession.getMapper(MessageDaoImp.class);
		
		MessageVO vo = new MessageVO();
		//==탭번호 확인==
		String tabType = req.getParameter("tabType");
		System.out.println(tabType);

		// "=========================임시 로그인 체크========================"		
		String loginCheck = (String)session.getAttribute("userid");
		if(loginCheck != null) {
			vo.setUserid(loginCheck);
			
			//현재페이지 구하기
			String nowPageTxt = req.getParameter("nowPage");
			if(nowPageTxt!=null) {
				vo.setNowPage(Integer.parseInt(nowPageTxt));
			}
			
			//접속한 아이디의 전체 레코드 숫자.
			vo.setTotalRecord(dao.getAllRecordCount(vo));
			
			List<MessageVO> list = new ArrayList<MessageVO>();
			
	
			// 검색어 vo로 넘기기
			String searchKey = (String)req.getParameter("searchKey");
			//유저아이디 검색시 유사한 아이디 검색 안되게 막기
			if(searchKey!="userid") {
				vo.setSearchWord("%"+req.getParameter("searchWord")+"%");
			}else {
				vo.setSearchWord(req.getParameter("searchWord"));
			}
			vo.setSearchKey(req.getParameter("searchKey"));
			
			//검색어 있을때
			try {
				if(!(vo.getSearchKey()==null || vo.getSearchWord()==null)) {
					list = 	dao.searchWordRecord(vo);
				}else {
					list = 	dao.messageAllRecord(vo);
				}
			}catch(Exception e) {
				System.out.println("쪽지 리스트 검색에러 --->");
				e.printStackTrace(); 
			}
			
			mav.addObject("tabType", tabType);
			mav.addObject("list", list);
			mav.setViewName("message/messageMain");

		}else {
			System.out.println("=========================임시 로그인 체크========================");
		}
		
		return mav;
	} 
}
