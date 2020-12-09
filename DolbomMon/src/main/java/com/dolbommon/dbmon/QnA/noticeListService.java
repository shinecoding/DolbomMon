package com.dolbommon.dbmon.QnA;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

public class noticeListService {
	private NoticeDao noticeDao;

	@Autowired

	public void setNoticeDao(NoticeDao noticeDao) {

	this.noticeDao = noticeDao;

	}//setNotcieDao

	 

	public List<QnAVO> service(){

	//페이지 처리 생략

	return noticeDao.list();

	}//service()

	 

	}//class

