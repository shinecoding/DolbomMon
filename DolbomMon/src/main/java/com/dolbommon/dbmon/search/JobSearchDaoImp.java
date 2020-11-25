package com.dolbommon.dbmon.search;

import java.util.List;

public interface JobSearchDaoImp {
	//구직게시판 리스트보기
	public List<JobSearchBoardVO> jobSearchBoardList();
	//총 게시물 수 구하기
	public int getTotalRecord();
	//레코드 한개 선택
	public JobSearchBoardVO jobSearchBoardSelect(int no);
	//조회수 증가
	public int hitCount(int no);
	//자유게시판 글쓰기
	public int jobSearchBoardInsert(JobSearchBoardVO vo);
	//자유게시판 글 삭제
	public int jobSearchBoardDel(int no, String userid);
	//자유게시판 글 수정
	public int jobSearchBoardEditOk(JobSearchBoardVO vo);
	//답글 쓰기 옵션 선택
	public JobSearchBoardVO optionSelect(int no);
	
	
	//답글 쓰기
	public int replyBoardInsert(JobSearchBoardVO vo);
	}

