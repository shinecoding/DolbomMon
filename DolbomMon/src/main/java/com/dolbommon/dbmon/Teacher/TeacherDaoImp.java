package com.dolbommon.dbmon.Teacher;

import java.util.HashSet;
import java.util.List;

public interface TeacherDaoImp {
	
	public TeacherVO selectTeacher(String userid);
	public MemberVO selectTMember(String userid);
	public List<ReviewVO> selectReview(String userid);
	
	public int updateIntro(TeacherVO vo);
	public int updateType(TeacherVO vo);
	public int updateWage(TeacherVO vo);
	public int updatePic(TeacherVO vo);
	public int updateAge(TeacherVO vo);
	public int updateActivity(TeacherVO vo);
	public int updateCCTV(TeacherVO vo);
	public List<ExperienceVO> selectExp(String userid);
	public int hitCount(TeacherVO vo);
	public int findIdT(ExperienceVO vo);
	public int updateExp(ExperienceVO evo);
	public int insertExp(String userid);
	public int deleteExp(ExperienceVO evo);
	public int selectLastEdit(String userid);
	//선생 지도 받기
	public MemberVO selectTMap(String userid);
	public int updateTMap(MemberVO mvo);
	public int updateArea(TeacherVO vo);
	//활성화 비활성화 버튼
	public int updateActive(TeacherVO vo);
	//후기 적기/수정
	public int insertReview(ReviewVO vo);
	public int updateReview(ReviewVO vo);
	
}

