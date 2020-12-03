package com.dolbommon.dbmon.report;

import com.dolbommon.dbmon.member.MemberVO;

public interface ReportDaoImp {
	
	//회원정보 조회
	public MemberVO memberInfo(String userid);
	
}
