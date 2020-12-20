package com.dolbommon.dbmon.parent;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.dolbommon.dbmon.member.RegularDateVO;
import com.dolbommon.dbmon.member.SpecificDateVO;
import com.dolbommon.dbmon.search.RecruitBoardVO;

public interface ParentDaoImp {
	
	public int insertDbmSearch(RecruitBoardVO rbVO);// 선생님 구하기 - 글 등록
	public int insertDsChildInfo(@Param("rbVO")RecruitBoardVO rbVO, @Param("cVO")ChildrenVO cVO); // 선생님 구하기 - 자녀 정보
	public int insertDsSpecificDate(@Param("rbVO")RecruitBoardVO rbVO, @Param("sdVO")SpecificDateVO sdVO); // 선생님 구하기 - 선택한 날짜
	public int insertDsRegularDate(@Param("rbVO")RecruitBoardVO rbVO, @Param("rdVO")RegularDateVO rdVO); // 선생님 구하기 - 정기적으로
	public int insertNullSpecificDate(); // 선생님 구하기 - 선택한 날짜
	public int insertNullRegularDate(); // 선생님 구하기 - 정기적으로
	
	// 내게(학부모) 신청한 - 내가올린 글 정보
	public List<ParentHistoryVO> selectMyRdBoard(String userid);
	
	// 내가(학부모) 신청한 - 내가 선생님한테 보낸 계약서 정보
	public List<ParentHistoryVO> selelctApplyToTeacher(String userid);
	
	public List<RecruitBoardVO> parentDealHistory(String userid);
	
	public int updatereview_status(String no);
	
	public List<ApplyToParentInfoVO> applyDbmSelect(String userid);
	
	public RecruitBoardVO getParentProfile(String userid);
	
	
	// 구인글에 신청한 선생님 수
	public int applyDbmCnt(int no);
	//후기 쓰기
	public int insertComment(CommentVO vo);
	//홈페이지 후기
	public List<CommentVO> CommentBoard();
}
