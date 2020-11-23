package com.dolbommon.dbmon.message;

import java.util.List;

public interface MessageDaoImp {
	
	// 접속한 유저의 전체 레코드 선택 .. 모든 게시글 선택 
	public List<MessageVO> messageAllRecord(MessageVO vo);
	
	// 접속한 유저의 메시지 총 레코드 수 구하기
	public int getAllRecordCount(MessageVO vo);
	
	// 쪽지 보기 게시판 이동
	public MessageVO messageView(MessageVO vo);
	
	//쪽지쓰기
	public int messageWrite(MessageVO vo);
	
	//쪽지 삭제
	public int MessageDelete(int no);
}
