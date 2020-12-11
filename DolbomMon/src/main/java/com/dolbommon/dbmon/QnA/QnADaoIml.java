package com.dolbommon.dbmon.QnA;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
@Repository
public class QnADaoIml implements QnADAO{
	@Inject
	private SqlSession sqlSession;
	//게시글 작성
	
	
	//게시글 목록 조회
	@Override
	public List<QnAVO> QnaList() throws Exception{
		return sqlSession.selectList("qnaMapper.QnaList");
		
	
	}

	/*
	 * public QnAVO qnaBoardSelect(int seq) throws Exception{ return
	 * sqlSession.selectList("qnaMapper.qnaBoardSelect"); }
	 */
}
