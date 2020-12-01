package com.dolbommon.dbmon.search;

import java.util.List;

public interface JobSearchDaoImp {
	//구직게시판 리스트보기
	public List<TeacherVO> jobSearchBoardList();
	//총 게시물 수 구하기
	public int getTotalRecord();
	//레코드 한개 선택
	public TeacherVO jobSearchBoardSelect(int no);
	
	//글번호 구하기
	public List<TeacherVO> selectTMem(); 
	
	public List<TeacherVO> selectTAct1();
	
}

