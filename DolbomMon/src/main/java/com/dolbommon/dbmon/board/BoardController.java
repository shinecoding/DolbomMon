package com.dolbommon.dbmon.board;

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
public class BoardController {

	SqlSession sqlSession;

	public SqlSession getSqlSession() {
		return sqlSession;
	}
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//게시판 리스트로 이동ok
	@RequestMapping("/freeBoard")
	public ModelAndView freeBoard() {
		
		FreeBoardDaoImp dao = sqlSession.getMapper(FreeBoardDaoImp.class);
		List<FreeBoardVO> list = dao.freeBoardList();
		int totalRecord = dao.getTotalRecord();	//총 게시물 수
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("totalRecord", totalRecord);
		mav.setViewName("freeBoard/freeBoard");
		
		return mav;
	}

	//총 게시물 수 구하기
//	public int getTotalRecord() {
		
//		FreeBoardDaoImp dao = sqlSession.getMapper(FreeBoardDaoImp.class);
//		int totalRecord = dao.getTotalRecord();
//		
//		ModelAndView mav = new ModelAndView();
		
		
//		return totalRecord;
//	}
	
	//게시판 글쓰기 폼으로 이동ok
	@RequestMapping("/freeBoardWrite")
	public String freeBoardWrite() {
		
		return "freeBoard/freeBoardWrite";
	}
	
	//게시판 글쓰기ok
	@RequestMapping(value="/freeBoardWriteOk", method=RequestMethod.POST)
	public ModelAndView freeBoardWriteOk(FreeBoardVO vo, HttpServletRequest hsr, HttpSession hs) {
		
		vo.setIp(hsr.getRemoteAddr());	//ip 구하기
		vo.setUserid((String)hs.getAttribute("userid"));	
		
		FreeBoardDaoImp dao = sqlSession.getMapper(FreeBoardDaoImp.class);
		int result = dao.freeBoardInsert(vo);
		
		ModelAndView mav = new ModelAndView();
		
		if(result>0) {
			mav.setViewName("redirect:freeBoard");
		}else {
			mav.setViewName("freeBoard/result");	
		}
		return mav;
	}
	
	//게시글 보기ok
	@RequestMapping("/freeBoardView")
	public ModelAndView freeBoardView(int no) {
		
		FreeBoardDaoImp dao = sqlSession.getMapper(FreeBoardDaoImp.class);
		dao.hitCount(no);
		FreeBoardVO vo = dao.freeBoardSelect(no);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", vo);
		mav.setViewName("freeBoard/freeBoardView");
	
		return mav;
	}
	
	//자유게시판 글 수정폼으로 이동ok
	@RequestMapping("/freeBoardEdit")
	public ModelAndView freeBoardEdit(int no) {
		FreeBoardDaoImp dao = sqlSession.getMapper(FreeBoardDaoImp.class);
		
		FreeBoardVO vo = dao.freeBoardSelect(no);
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", vo);
		mav.setViewName("freeBoard/freeBoardEdit");
		
		return mav;
	}
	
	//자유게시판 글 수정ok
	@RequestMapping(value="/freeBoardEditOk", method=RequestMethod.POST)
	public ModelAndView freeBoardEditOk(FreeBoardVO vo, HttpSession ses) {
		vo.setUserid((String)ses.getAttribute("userid"));
		FreeBoardDaoImp dao = sqlSession.getMapper(FreeBoardDaoImp.class);
		int result = dao.freeBoardEditOk(vo);
		
		ModelAndView mav = new ModelAndView();
		if(result>0) {
			mav.addObject("no", vo.getNo());
			mav.setViewName("redirect:freeBoard");
		}else {
			mav.setViewName("board/result");
		}
		return mav;
	}
	
	//자유게시판 글 삭제ok
	@RequestMapping("/freeBoardDel")
	public ModelAndView freeBoardDel(int no, HttpSession ses) {
		FreeBoardDaoImp dao = sqlSession.getMapper(FreeBoardDaoImp.class);
		int result = dao.freeBoardDel(no, (String)ses.getAttribute("userid"));
		
		ModelAndView mav = new ModelAndView();
		if(result>0) {
			mav.setViewName("redirect:freeBoard");
		}else {
			mav.setViewName("freeBoard/result");
		}
		return mav;
	}
	
	//공지사항 게시판으로 이동ok
	@RequestMapping("/noticeBoard")
	public String noticeBoard() {
		
		return "freeBoard/noticeBoard";
	}
	
	//공지사항 글쓰기 폼으로 이동ok
	@RequestMapping("/noticeBoardWrite")
	public String noticeBoardWrite() {
		
		return "freeBoard/noticeBoardWrite";
	}
	
//	//공지사항 게시글 보기
//	@RequestMapping(value="/noticeBoardView", method=RequestMethod.POST)
//	public ModelAndView noticeBoardView() {
		
//		return null;
//	}
	
	@RequestMapping("/noticeBoardView")
	public String noticeBoardView() {
		
		return "freeBoard/noticeBoardView";
	}
	
	//신고게시판으로 이동
	@RequestMapping("/bulletinBoard")
	public String bulletinBoard() {
		
		return "freeBoard/bulletinBoard";
	}
	
	//신고게시글 보기
	@RequestMapping("/bulletinBoardView")
	public String bulletinBoardView() {
		
		return "freeBoard/bulletinBoardView";
	}
	
	//인증게시판으로 이동
	@RequestMapping("/confirmBoard")
	public String confirmBoard() {
		
		return "freeBoard/confirmBoard";
	}
	
	//인증글 보기
	@RequestMapping("/confirmBoardView")
	public String confirmBoardView() {
		
		return "freeBoard/confirmBoardView";
	}
}
