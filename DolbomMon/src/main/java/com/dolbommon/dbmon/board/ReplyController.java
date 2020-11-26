package com.dolbommon.dbmon.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReplyController {
	
	SqlSession sqlSession;

	public SqlSession getSqlSession() {
		return sqlSession;
	}
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//댓글 쓰기
	@RequestMapping(value="/replyWrite", method=RequestMethod.GET)
	@ResponseBody
	public ModelAndView replyInsert(FreeBoardReplyVO vo, HttpServletRequest req, HttpSession ses) {
		
		System.out.println(vo.getContent());
		
		vo.setUserid((String)ses.getAttribute("userid"));	
		
		FreeBoardReplyDaoImp dao = sqlSession.getMapper(FreeBoardReplyDaoImp.class);
		
		int result = dao.replyInsert(vo);
		
		ModelAndView mav = new ModelAndView();
		
		if(result>0) {
			mav.setViewName("redirect:freeBoardView");
		}else {
			mav.setViewName("freeBoard/result");	
		}
		return mav;
	}
	
	//댓글 보기
	@RequestMapping("/replyList")
	@ResponseBody
	public ModelAndView replyAllSelect(int no){
		FreeBoardReplyDaoImp dao = sqlSession.getMapper(FreeBoardReplyDaoImp.class);
		FreeBoardReplyVO rVo = dao.replyAllSelect(no);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("rVo", rVo);
		mav.setViewName("freeBoard/freeBoardView");

		return mav;
	}
	
	//댓글 수정
	@RequestMapping("/replyEdit")
	@ResponseBody
	public int replyEdit(FreeBoardReplyVO vo, HttpSession ses) {
		vo.setUserid((String)ses.getAttribute("logId"));
		FreeBoardReplyDaoImp dao = sqlSession.getMapper(FreeBoardReplyDaoImp.class);
		
		return dao.replyUpdate(vo);	
	}
	
	//댓글 삭제
	@RequestMapping("/replyDel")
	@ResponseBody
	public int replyDel(int re_no, String userid) {
		FreeBoardReplyDaoImp dao = sqlSession.getMapper(FreeBoardReplyDaoImp.class);
		
		return dao.replyDelete(re_no, userid);
	}
}
