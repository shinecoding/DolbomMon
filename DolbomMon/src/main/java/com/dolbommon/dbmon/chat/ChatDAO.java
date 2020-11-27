package com.dolbommon.dbmon.chat;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChatDAO {
	@Autowired
	SqlSession sqlSession;
	
	
	//룸 생성
	public int insertRoom(ChatRoomDTO room) {
		int result = 0;
		
		ChatDaoImp dao = sqlSession.getMapper(ChatDaoImp.class);
		
		try {
			System.out.println("룸네임확인"+room.getRoomname());
			result = dao.insertRoom(room);
		}catch(Exception e) {
			System.out.println("룸 생성 에러"+e.getMessage());
			return result;
		}
		return result;
	}
	
	//방 목록 전체 가져오기
	public List<ChatRoomDTO> selectAllRoom(){
		List<ChatRoomDTO> result = null;
		
		ChatDaoImp dao = sqlSession.getMapper(ChatDaoImp.class);
		try {
			result = dao.selectAllRoom();
		}catch(Exception e) {
			System.out.println("방 목록 전체 가져오기 에러"+e.getMessage());
			return result;
		}
		return result;
	}
	
	
	public int insertChat(ChatDTO chat) {
		int result =0;
		ChatDaoImp dao = sqlSession.getMapper(ChatDaoImp.class);
		try {
			result = dao.insertChat(chat);
		}catch(Exception e) {
			System.out.println("채팅입력 에러"+e.getMessage());
			return result;
		}		
		return result;
	}
	
	public List<ChatDTO> selectChat(String roomseq){
		List<ChatDTO> result = null;
		
		ChatDaoImp dao = sqlSession.getMapper(ChatDaoImp.class);
		try {
			result=dao.selectChat(roomseq);
		}catch(Exception e) {
			System.out.println("채팅 가져오기 에러"+e.getMessage());
			return result;
		}
		return result;
	}
	
	
}
