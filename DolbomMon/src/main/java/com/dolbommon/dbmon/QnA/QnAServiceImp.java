package com.dolbommon.dbmon.QnA;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
@Service
public class QnAServiceImp implements QnAService{
	//게시물 목록 조회
	@Inject
	private QnADAO dao;
	
	@Override
	public List<QnAVO> QnaList() throws Exception {
		// TODO Auto-generated method stub
		return dao.QnaList();
	}
}
