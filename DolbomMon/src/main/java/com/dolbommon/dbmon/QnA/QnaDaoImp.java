package com.dolbommon.dbmon.QnA;

import java.util.List;

public interface QnaDaoImp {
	public List<QnAVO> QnaList(QnAVO qna_vo);
	//자주묻는질문 뷰페이지 보이기
	public QnAVO qnaBoardView(int seq);
	
}
