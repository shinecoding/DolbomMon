package com.dolbommon.dbmon.deal;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.dolbommon.dbmon.deal.MemberVO;
import com.dolbommon.dbmon.member.RegularDateVO;
import com.dolbommon.dbmon.member.SpecificDateVO;
import com.dolbommon.dbmon.parent.ApplyToParentInfoVO;
import com.dolbommon.dbmon.parent.ChildrenVO;
import com.dolbommon.dbmon.search.RecruitBoardVO;

public interface DealDaoImp {
		
	// 계약서 - 선생님이 부모님에게
	public int insertContract(RecruitBoardVO rbVO);
	// 계약서 - 부모님이 선생님에게
	public int insertContractT(RecruitBoardVO rbVO);
	// 내가 신청한 글 목록 보기	
	public List<RecruitBoardVO> selectTeacherHistory(String userid);
	// 내게지원한 글 목록 보기	
	public List<RecruitBoardVO> selectTeacherHistory2(String userid);
	// 내가 활동중인 글목록(선생님)	
	public List<RecruitBoardVO> teacherDealHistory(String userid);
	// 계약서 찾기
	public int searchContract(int no);
	
	//계약서 중복작성시 앞의 계약서 모두 거절처리
	public int rejectContract(@Param("userid")String userid, @Param("teacherid")String teacherid);
	//계약서의 글번호 찾기
	public String selectOrigin(@Param("no")int no, @Param("teacherid")String teacherid);
	
	//신청한 선생님의 정보를 담은 리스트 출력
	public List<ApplyToParentInfoVO> applyDbmSelect2(int no); 
	
	//레코드 한 개 선택 
	public RecruitBoardVO recruitBoardSelect2(int no);
	
	//레코드 한 개 선택 - 자녀
	public ChildrenVO recruitChildSelect2(int no);
	
	//레코드 한 개 선택 - 특정날 선택(R)
	public SpecificDateVO recruitSpecificDateSelect2(int no);
	
	//레코드 한 개 선택 - 정기적 선택(S)
	public RegularDateVO recruitRegularDateSelect2(int no);
	
	//계약서 수락/거절
	public int setAgree(@Param("agree")String agree,@Param("no") int no);
	
	//계약서 작성중인지 아닌지 확인 
	public RecruitBoardVO ContractStatus(int no);

	//계약서의 존재유무 확인 - 돌봄몬찾기 계약서신청
	public RecruitBoardVO checkContract(@Param("userid")String userid, @Param("teacherid")String teacherid);
	
	public com.dolbommon.dbmon.deal.MemberVO selectMemberDeal(String parent_id);
	public int insertPayment(PaymentVO vo);
	public int updatePayment(String pay_no);
}

