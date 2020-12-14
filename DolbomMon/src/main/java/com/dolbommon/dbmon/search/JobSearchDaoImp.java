package com.dolbommon.dbmon.search;

import java.util.HashSet;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface JobSearchDaoImp {
	//구직게시판 리스트보기
	public List<TeacherVO> jobSearchBoardList(int count);
	//구직게시판 activity_type필터
	public List<TeacherVO> jobSearchActType(@Param("activity_type")String activity_type, @Param("count")int count);
	//구직게시판 care_type필터
	public List<TeacherVO> jobSearchCareType(@Param("care_type")String care_type, @Param("count")int count);
	
	//구직게시판 정렬
	public List<TeacherVO> filterLastEdit(int count);
	public List<TeacherVO> filterCertiCnt(int count);
	public List<TeacherVO> filterWageLow(int count);
	public List<TeacherVO> filterWageHigh(int count);
	
	public List<TeacherVO> filterGender(@Param("gender")String gender, @Param("count")int count);
	
	//총 게시물 수 구하기
	public int getTotalRecord();
	public int getHeartRecord(String userid);
	//레코드 한개 선택
	public TeacherVO jobSearchBoardSelect(int no);
	//찜기능
	public List<TeacherVO> selectHeart(TeacherVO vo);
	public int insertHeart(LiketVO vo);
	public int deleteHeart(LiketVO vo);
	
	//찜게시판 기능
	public List<TeacherVO> selectHeartActive(TeacherVO vo);
	
	//찜게시판 정렬
	public List<TeacherVO> likeOrder(TeacherVO vo);
	public List<TeacherVO> likeCertiCnt(TeacherVO vo);
	public List<TeacherVO> likeWageLow(TeacherVO vo);
	public List<TeacherVO> likeWageHigh(TeacherVO vo);
	
	
	//글번호 구하기
	public List<TeacherVO> selectTMem(); 
	
	public List<TeacherVO> selectTAct1();
	//모든 선생 위치
	public HashSet<TeacherVO> selectAllTeacher();
	//내 위치
	public TeacherVO selectTTMap(String userid);
}

