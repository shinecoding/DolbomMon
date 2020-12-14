package com.dolbommon.dbmon.QnA;

import java.util.List;

public interface QnADAO {
	//게시글 작성
	
	//게시물 목록 조회
	public List<QnAVO> QnaList(QnAVO qna_vo);
	//글번호에 해당하는 데이터를 가져오는 메소드 

	public QnAVO qnaBoardView(int seq);
}
