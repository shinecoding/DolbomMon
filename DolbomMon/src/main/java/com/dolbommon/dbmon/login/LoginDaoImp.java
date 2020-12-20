package com.dolbommon.dbmon.login;

import com.dolbommon.dbmon.member.MemberVO;

public interface LoginDaoImp {
	//로그인
	public LoginVO loginOk(LoginVO vo);
	//쿠키 저장
	public int keepLogin(LoginVO vo);
	//쿠키 삭제
	public int cookieReset(String userid);
	//자동 로그인
	public LoginVO checkLoginBefore(String value);
	//아이디 찾기
	public LoginVO findUserid(LoginVO vo);
	//비밀번호 변경
	public int pwdChange(LoginVO vo);
	//암호화 된 비빌번호로 변경
	public int changePwd(LoginVO vo);
	//로그인 유형 (선생님, 학부모)
	public MemberVO getMemberType(String userid);
}
