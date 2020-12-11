package com.dolbommon.dbmon.QnA;

import java.util.List;

public interface QnADAO {
	//게시글 작성
	
	//게시물 목록 조회
	public List<QnAVO> QnaList() throws Exception;
		
}
