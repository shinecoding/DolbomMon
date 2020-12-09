package com.dolbommon.dbmon;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.dolbommon.dbmon.certification.CertificationVO;
import com.dolbommon.dbmon.report.ReportVO;

public interface ManageDaoImp {
	
	//신고 리스트 불러오기
	public List<ReportVO> selectReport(ReportVO data);

	//인증 리스트 불러오기
	public List<ReportVO> selectCerti(CertificationVO data);
	
	//인증 업데이트
	public int editCerti(@Param("certi")String certi, @Param("no")String no, @Param("type")String type);
	
}
