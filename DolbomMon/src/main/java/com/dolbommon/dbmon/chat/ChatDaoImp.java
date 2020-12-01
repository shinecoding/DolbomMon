package com.dolbommon.dbmon.chat;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface ChatDaoImp {

	//방만들기
	public int insertRoom(ChatRoomDTO room);
	
	//채팅 내용 가져오기
	public List<ChatDTO> selectRoom(int roomNo);
	
	//방 목록
	public List<ChatRoomDTO> selectAllRoom(String userid);
	
	//중복 방 확인하기
	public int roomCheck(@Param("userid")String userid, @Param("userid_t")String userid_t);

	//새로운 채팅 등록
	public int updateNewChat(@Param("roomseq")String roomseq, @Param("lastChat")String lastChat, @Param("userCheck")String userCheck);
	
	//채팅보내기
	public int insertChat(ChatDTO chat);

	//새로운 채팅확인(수정필요 newchat_t)
	public int updateChatCheck(@Param("roomseq")int roomseq, @Param("userCheck")String userCheck); 
	
	//접속자 아이디 구분하기
	public ChatRoomDTO selectNewchat(ChatRoomDTO room);
	
	//방시간 갱신
	public int roomTimeUpdate(@Param("userid")String userid, @Param("userid_t")String userid_t);
	
	//중복방 삭제
	public int roomDelete(@Param("userid")String userid, @Param("userid_t")String userid_t);
}
