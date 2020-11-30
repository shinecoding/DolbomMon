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

	
	
	
	
	
	public int insertChat(ChatDTO chat); //채팅목록
	
	public List<ChatDTO> selectChat(String roomseq); //채팅하기
	
}
