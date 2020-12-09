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
	
	// 학부모 - 구인글 목록
	public List<ParentHistoryVO> selectMyRdBoard(String userid);
	
	// 내게(학부모) 신청한 - 선생님 정보
	public List<ApplyToParentInfoVO> applyDbmSelect(String userid);
	
	// 구인글에 신청한 선생님 수
	public int applyDbmCnt(int no);
}
