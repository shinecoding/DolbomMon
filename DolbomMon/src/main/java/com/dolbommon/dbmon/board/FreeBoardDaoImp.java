package com.dolbommon.dbmon.board;

import java.util.List;

public interface FreeBoardDaoImp {

	//자유게시판 리스트 보기
	public List<FreeBoardVO> freeBoardList();
	//총 게시물 수 구하기
	public int getTotalRecord();
	//레코드 한개 선택
	public FreeBoardVO freeBoardSelect(int no);
	//조회수 증가
	public int hitCount(int no);
	//자유게시판 글쓰기
	public int freeBoardInsert(FreeBoardVO vo);
	//자유게시판 글 삭제
	public int freeBoardDel(int no, String userid);
	//자유게시판 글 수정
	public int freeBoardEditOk(FreeBoardVO vo);
	//답글 쓰기 옵션 선택
	public FreeBoardVO optionSelect(int no);
	
	public int levelUpdate(FreeBoardVO vo);
	//답글 쓰기
	public int replyBoardInsert(FreeBoardVO vo);
}
