package com.dolbommon.dbmon.board;

import java.util.List;

public interface NoticeBoardDaoImp {

	//공지사항 게시판 리스트 보기
	public List<NoticeBoardVO> noticeBoardList(NoticeBoardVO vo);
	//총 게시물 수 구하기
	public int getTotalNoticeRecord(NoticeBoardVO vo);
	//레코드 한개 선택
	public NoticeBoardVO noticeBoardSelect(int no);
	//이전글 선택
	public NoticeBoardVO preNoticeSelect(int no);
	//다음글 선택
	public NoticeBoardVO nextNoticeSelect(int no);
	//조회수 증가
	public int noticeHitCount(int no);
	//공지사항 게시판 글쓰기
	public int noticeBoardInsert(NoticeBoardVO vo);
	//공지사항 게시판 글 삭제
	public int noticeBoardDel(int no, String userid);
	//오픈글 보여주기
	public List<NoticeBoardVO> exposeNotice();
	//공지사항 게시글 수정
	public int noticeBoardEditOk(NoticeBoardVO vo);
	//파일명 얻어오기
	public NoticeBoardVO getNoticeFileName(int no);
	
}
