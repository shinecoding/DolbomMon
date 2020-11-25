package com.dolbommon.dbmon.Teacher;

public interface TeacherDaoImp {
	
	public TeacherVO selectTeacher(String userid);
	public int updateIntro(TeacherVO vo);
	public int updateType(TeacherVO vo);
	public int updateWage(TeacherVO vo);
	public int updatePic(TeacherVO vo);
	public int updateAge(TeacherVO vo);
	public int updateActivity(TeacherVO vo);
	
	
	
}

