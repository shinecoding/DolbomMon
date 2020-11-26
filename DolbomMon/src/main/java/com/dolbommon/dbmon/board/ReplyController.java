package com.dolbommon.dbmon.board;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public int replyInsert(FreeBoardReplyVO vo, HttpSession ses) {
		
		System.out.println("111111111222222222");
		System.out.println(vo.getContent());
		
		vo.setUserid((String)ses.getAttribute("userid"));	
		FreeBoardReplyDaoImp dao = sqlSession.getMapper(FreeBoardReplyDaoImp.class);
		
		System.out.println(vo.getNo()+vo.getContent());
		return dao.replyInsert(vo);
	}
	
	//댓글 보기
	@RequestMapping("/replyList")
	@ResponseBody
	public List<FreeBoardReplyVO> replyAllSelect(int no){
		FreeBoardReplyDaoImp dao = sqlSession.getMapper(FreeBoardReplyDaoImp.class);
		
		System.out.println("111111111");
		dao.replyAllSelect(no);
		
		return null;
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
