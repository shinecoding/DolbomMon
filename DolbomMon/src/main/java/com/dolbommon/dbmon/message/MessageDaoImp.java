package com.dolbommon.dbmon.message;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface MessageDaoImp {
	
	// 접속한 유저의 전체 레코드 선택 .. 모든 게시글 선택  .. 검색포함
	public List<MessageVO> messageAllRecord(MessageVO vo);
	
	// 접속한 유저의 메시지 총 레코드 수 구하기 .. 검색포함
	public int getAllRecordCount(MessageVO vo);
	
	// 쪽지 보기 게시판 이동
	public MessageVO messageView(MessageVO vo);
	
	//쪽지쓰기
	public int messageWrite(MessageVO vo);
	
	//스팸유저가 쪽지쓸때
	public int spamWrite(MessageVO vo);
	
	//읽은 글 읽음 상태 전환
	public int readMessage(MessageVO vo);
	
	//안읽은 글 숫자 확인
	public int newMessage(MessageVO vo);
	
	//쪽지 저장하기
	public int saveMessage(@Param("no")int no, @Param("tabType")String tabType);
	
	//쪽지 삭제시 로그인 상태 확인
	public MessageVO loginCheck(int no);
	
	//쪽지 삭제(보기상태변환)
	public int messageDel(@Param("no")int no, @Param("viewType")String viewType);
	
	//스팸유저인지 확인
	public int checkSpamId(@Param("recieveId")String recieveId, @Param("spamId")String spamId);
	
	//스팸유저 등록
	public int registerSpamId(@Param("recieveId")String recieveId, @Param("spamId")String spamId);
	
	//스팸유저가 등록한 유저에게 보낸 모든 쪽지 스팸처리
	public int changSpam(@Param("recieveId")String recieveId, @Param("spamId")String spamId);
	
	//스팸유저 등록 취소
	public int spamCancel(@Param("recieveId")String recieveId, @Param("spamId")String spamId);
	
	//스팸등록 해제된 유저가 보낸 쪽지 스팸해제
	public int changMessage(@Param("recieveId")String recieveId, @Param("spamId")String spamId);
	
}
