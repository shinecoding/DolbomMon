package com.dolbommon.dbmon.chat;

import java.util.List;

public interface ChatDaoImp {

	public int insertRoom(ChatRoomDTO room);//방만들기
	
	public List<ChatRoomDTO> selectAllRoom();//방 목록
	
	public int insertChat(ChatDTO chat); //채팅목록
	
	public List<ChatDTO> selectChat(String roomseq); //채팅하기
	
}
