package com.dolbommon.dbmon.board;

import java.util.List;

public interface FreeBoardReplyDaoImp {

	//댓글 쓰기
	public int replyInsert(FreeBoardReplyVO vo);
	//댓글 보기
	public List<FreeBoardReplyVO> replyAllSelect(int no);
	//댓글 수정
	public int replyUpdate(FreeBoardReplyVO vo);
	//댓글 삭제
	public int replyDelete(int re_no);
}
