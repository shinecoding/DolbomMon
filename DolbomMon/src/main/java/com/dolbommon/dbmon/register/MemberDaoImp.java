package com.dolbommon.dbmon.register;


import org.apache.ibatis.annotations.Param;

public interface MemberDaoImp {
	// 회원가입
	public int memberReg1(@Param("mVo")MemberVO mVo);
	public int memberReg2(@Param("mVo")MemberVO mVo, @Param("tVo")TeacherVO tVo);
	public int memberReg3(@Param("mVo")MemberVO mVo, @Param("rdVo")RegularDateVO rdVo);
	
	//회원 삭제
	public int memberDelete(MemberVO mVo);
	
	
	
}
