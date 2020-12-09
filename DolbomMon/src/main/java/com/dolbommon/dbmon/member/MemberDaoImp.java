package com.dolbommon.dbmon.member;


import org.apache.ibatis.annotations.Param;

import com.dolbommon.dbmon.Teacher.TeacherVO;

public interface MemberDaoImp {
	// 회원가입
	public int memberReg(@Param("mVo")MemberVO mVo);
	public int memberRegTeacher(@Param("mVo")MemberVO mVo, @Param("tVo")TeacherVO tVo);
	public int memberRegRegular(@Param("mVo")MemberVO mVo, @Param("rdVo")RegularDateVO rdVo);
	
	//회원 삭제
	public int memberDelete(MemberVO mVo);
	
	//아이디 중복검사 (아이디 존재여부)
	public int memberUseridChk(String userid);
	
	//연락처 중복검사
	public int memberUsertelChk(String tel1);
}
