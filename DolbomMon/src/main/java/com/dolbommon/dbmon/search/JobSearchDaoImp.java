package com.dolbommon.dbmon.search;

import java.util.HashSet;
import java.util.List;

public interface JobSearchDaoImp {
	//구직게시판 리스트보기
	public List<TeacherVO> jobSearchBoardList();
	//구직게시판 activity_type필터
	public List<TeacherVO> jobSearchActType(String activity_type);
	//구직게시판 care_type필터
	public List<TeacherVO> jobSearchCareType(String care_type);
	
	//구직게시판 정렬
	public List<TeacherVO> filterLastEdit();
	public List<TeacherVO> filterCertiCnt();
	public List<TeacherVO> filterWageLow();
	public List<TeacherVO> filterWageHigh();
	
	public List<TeacherVO> filterGender(String gender);
	
	//총 게시물 수 구하기
	public int getTotalRecord();
	//레코드 한개 선택
	public TeacherVO jobSearchBoardSelect(int no);
	//찜기능
	public List<TeacherVO> selectHeart(String userid);
	public int insertHeart(LiketVO vo);
	public int deleteHeart(LiketVO vo);
	
	//찜게시판 기능
	public List<TeacherVO> selectHeartActive(String userid);
	
	//찜게시판 정렬
	public List<TeacherVO> likeOrder(String userid);
	public List<TeacherVO> likeCertiCnt(String userid);
	public List<TeacherVO> likeWageLow(String userid);
	public List<TeacherVO> likeWageHigh(String userid);
	
	//글번호 구하기
	public List<TeacherVO> selectTMem(); 
	
	public List<TeacherVO> selectTAct1();
	//모든 선생 위치
	public HashSet<TeacherVO> selectAllTeacher();
	//내 위치
	public TeacherVO selectTTMap(String userid);
}

