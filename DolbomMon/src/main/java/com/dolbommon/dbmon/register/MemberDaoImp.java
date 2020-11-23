package com.dolbommon.dbmon.register;


import org.apache.ibatis.annotations.Param;

public interface MemberDaoImp {
	// 회원가입
	public int memberReg(@Param("mVo")MemberVO mVo, @Param("tVo")TeacherVO tVo, @Param("rdVo")RegularDateVO rdVo);
	
}
