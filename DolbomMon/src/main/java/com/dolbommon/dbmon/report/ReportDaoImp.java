package com.dolbommon.dbmon.report;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.dolbommon.dbmon.member.MemberVO;

public interface ReportDaoImp {
	
	//회원정보 조회
	public MemberVO memberInfo(String userid);
	
	//신고테이블 등록
	public int insertReport(ReportVO vo);
	
	//내 신고내역 조회
	public List<ReportVO> reportInfo(String userid);
	
	//신고회원 이름조회
	public String selectName(String userid);
	
	//신고정보 업데이트
	public int editResponse(@Param("shingo_response")String shingo_response, @Param("no")String no);
}
