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
	
	//매니저 리스트 불러오기
	public List<MemberVO> selectManager(ManagerVO data);
	
	//마이페이지 분류
	public int countTeacher(String userid);
	
	//매니저 수정 선택
	public ManagerVO choiceManager(String userid);
	
	//메모창 오픈
	public String selectMemo(String no);
	
	//사유등록창 오픈
	public String selectReason(String no);
	
	//회원탈퇴사유 오픈
	public String selectleaveReason(String no);
	
	//인증 업데이트
	public int editCerti(@Param("certi")String certi, @Param("no")String no, @Param("type")String type);
	
	//메모 등록
	public int insertMemo(@Param("no")String no, @Param("memo")String memo);
	
	//사유 등록
	public int reasonInsert(@Param("no")String no, @Param("reason")String reason);
	
	//회원 활동정지 
	public int updateActivity(@Param("certi")String certi, @Param("no")String no, @Param("type")String type);
	
	//매니저 등록
	public int insertManager(ManagerVO vo);
	
	//매니저 아이디 중복확인
	public int selectManagerId(String userid);
	
	//매니저 수정하기
	public int updateManaer(ManagerVO vo);
	
	//매니저 로그인
	public int mangerLogin(ManagerVO vo);
	
	//부서구하기
	public ManagerVO getDepartment(String userid);
}
