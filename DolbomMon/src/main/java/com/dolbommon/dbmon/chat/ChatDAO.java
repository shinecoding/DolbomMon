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
			result = dao.insertRoom(room);
		}catch(Exception e) {
			System.out.println("룸 생성 에러"+e.getMessage());
			return result;
		}
		return result;
		
		
	}
	//방 있는지 확인
	public int roomCheck(String userid, String userid_t) {
		int result=0;
		ChatDaoImp dao = sqlSession.getMapper(ChatDaoImp.class);
		try {
			result = dao.roomCheck(userid, userid_t);
			
		}catch(Exception e) {
			System.out.println("룸 체크 에러"+e.getMessage());
			return result;
		}
		return result;
	}
	
	//방 목록 전체 가져오기
	public List<ChatRoomDTO> selectAllRoom(String userid){
		List<ChatRoomDTO> result = null;
		
		ChatDaoImp dao = sqlSession.getMapper(ChatDaoImp.class);
		try {
			result = dao.selectAllRoom(userid);
		}catch(Exception e) {
			System.out.println("방 목록 전체 가져오기 에러"+e.getMessage());
			return result;
		}
		return result;
	}
	
	//방 클릭시 메시지 가져오기
	public List<ChatDTO> selectRoom(int roomNo){
		List<ChatDTO> result = null;
		
		ChatDaoImp dao = sqlSession.getMapper(ChatDaoImp.class);
		try {
			result = dao.selectRoom(roomNo);
		}catch(Exception e) {
			System.out.println("메시지 가져오기 에러"+e.getMessage());
			return result;
		}
		
		return result;
	}
	//채팅보내기
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
