package com.dolbommon.dbmon.login;


public interface LoginDaoImp {
	//로그인
	public LoginVO loginOk(LoginVO vo);
	//아이디 찾기
	public LoginVO findUserid(LoginVO vo);
	//비밀번호 변경
	public int pwdChange(LoginVO vo);
	
	
}
