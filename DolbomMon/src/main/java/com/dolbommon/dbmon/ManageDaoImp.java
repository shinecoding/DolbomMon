package com.dolbommon.dbmon;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.dolbommon.dbmon.certification.CertificationVO;
import com.dolbommon.dbmon.member.MemberVO;
import com.dolbommon.dbmon.report.ReportVO;

public interface ManageDaoImp {
	
	//신고 리스트 불러오기
	public List<ReportVO> selectReport(ReportVO data);

	//인증 리스트 불러오기
	public List<CertificationVO> selectCerti(CertificationVO data);
	
	//회원 리스트 불러오기
	public List<MemberVO> selectMember(MemberVO data);
	
	//마이페이지 분류
	public int countTeacher(String userid);
	
	//메모창 오픈
	public String selectMemo(String no);
	
	//인증 업데이트
	public int editCerti(@Param("certi")String certi, @Param("no")String no, @Param("type")String type);
	
	//메모 등록
	public int insertMemo(@Param("no")String no, @Param("memo")String memo);
}
