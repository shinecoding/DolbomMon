package com.dolbommon.dbmon.message;

import java.util.List;

import org.apache.ibatis.annotations.Param;

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
	
	//읽은 글 읽음 상태 전환
	public int readMessage(int no);
	
	//안읽은 글 숫자 확인
	public int newMessage(MessageVO vo);
	
	//쪽지 저장하기
	public int saveMessage(@Param("no")int no, @Param("tabType")String tabType);
	
	//쪽지 삭제시 로그인 상태 확인
	public MessageVO loginCheck(int no);
	
	//쪽지 삭제(보기상태변환)
	public int messageDel(@Param("no")int no, @Param("viewType")String viewType);
}
