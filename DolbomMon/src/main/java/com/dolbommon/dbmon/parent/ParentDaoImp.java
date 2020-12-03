package com.dolbommon.dbmon.parent;

import org.apache.ibatis.annotations.Param;

import com.dolbommon.dbmon.member.RegularDateVO;
import com.dolbommon.dbmon.member.SpecificDateVO;

public interface ParentDaoImp {
	
	public int insertDbmSearch(DbmSearchVO dsVO);// 선생님 구하기 - 글 등록
	public int insertDsChildInfo(@Param("dsVO")DbmSearchVO dsVO, @Param("cVO")ChildrenVO cVO); // 선생님 구하기 - 자녀 정보
	public int insertDsSpecificDate(@Param("dsVO")DbmSearchVO dsVO, @Param("sdVO")SpecificDateVO sdVO); // 선생님 구하기 - 선택한 날짜
	public int insertDsRegularDate(@Param("dsVO")DbmSearchVO dsVO, @Param("rdVO")RegularDateVO rdVO); // 선생님 구하기 - 정기적으로
}
