package com.dolbommon.dbmon.Teacher;

import java.util.HashSet;

public interface TeacherDaoImp {
	
	public TeacherVO selectTeacher(String userid);
	public int updateIntro(TeacherVO vo);
	public int updateType(TeacherVO vo);
	public int updateWage(TeacherVO vo);
	public int updatePic(TeacherVO vo);
	public int updateAge(TeacherVO vo);
	public int updateActivity(TeacherVO vo);
	public int updateCCTV(TeacherVO vo);
	public HashSet<ExperienceVO> selectExp(String userid);
	public int hitCount(TeacherVO vo);
	public int findIdT(ExperienceVO vo);
	public int updateExp(HashSet<ExperienceVO> hash);
	public int insertExp(HashSet<ExperienceVO> hash);
	public int deleteExp(HashSet<ExperienceVO> hash);
	public int selectLastEdit(String userid);
}

