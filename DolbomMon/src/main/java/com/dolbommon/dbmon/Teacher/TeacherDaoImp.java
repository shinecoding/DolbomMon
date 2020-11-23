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
	public int updateExp(HashSet<ExperienceVO> list);
	public int hitCount(TeacherVO vo);
}

