package com.dolbommon.dbmon;

import java.util.List;

import com.dolbommon.dbmon.report.ReportVO;

public interface ManageDaoImp {
	
	//신고 리스트 불러오기
	public List<ReportVO> selectReport(ReportVO data);
}
