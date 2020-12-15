package com.dolbommon.dbmon.identity;

import java.util.List;

public interface IdentityDaoImp {

	//회원정보 구하기
	public List<IdentityVO> getIdentity(String userid);
	//회원정보 수정
	public int indentityEdit(IdentityVO vo);
	//회원탈퇴
	public int withdraw(IdentityVO vo);
	
}
