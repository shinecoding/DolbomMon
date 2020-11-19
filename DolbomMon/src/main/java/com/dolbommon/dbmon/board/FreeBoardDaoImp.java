package com.dolbommon.dbmon.board;

import java.util.List;

public interface FreeBoardDaoImp {

	//자유게시판 리스트 보기
	public List<FreeBoardVO> freeBoardList();
	//레코드 한개 선택
	public FreeBoardVO freeBoardSelect(int no);
	//조회수 증가
	public int hitCount(int no);
	//자유게시판 글쓰기
	public int freeBoardInsert(FreeBoardVO vo);
	
	
}
