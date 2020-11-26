package com.dolbommon.dbmon.chat;

import com.dolbommon.dbmon.chat.ChatRoomDTO;

public interface ChatDaoImp {

	public int insertRoom(Room room);//방만들기
	public List<Room> selectAllRoom();//방 목록
}
