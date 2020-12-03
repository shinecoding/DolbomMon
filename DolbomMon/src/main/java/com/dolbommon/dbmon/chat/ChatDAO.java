package com.dolbommon.dbmon.chat;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChatDAO {
	@Autowired
	SqlSession sqlSession;
	
	
	//채팅방(번호) 생성
	public int insertRoom(ChatRoomDTO room) {
		int result = 0;
		ChatDaoImp dao = sqlSession.getMapper(ChatDaoImp.class);
		
		try {
			result = dao.insertRoom(room);
		}catch(Exception e) {
			//System.out.println("룸 생성 에러"+e.getMessage());
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
			//System.out.println("룸 체크 에러"+e.getMessage());
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
			//System.out.println("방 목록 전체 가져오기 에러"+e.getMessage());
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
			//System.out.println("메시지 가져오기 에러"+e.getMessage());
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
			//System.out.println("채팅입력 에러"+e.getMessage());
			return result;
		}		
		return result;
	}
	
	//새로운 채팅 등록
	public int updateNewChat(String roomseq, String lastChat, String userCheck) {
		int result =0;
		ChatDaoImp dao = sqlSession.getMapper(ChatDaoImp.class);
		try {
			result = dao.updateNewChat(roomseq, lastChat, userCheck);
		}catch(Exception e) {
			//System.out.println("새로운 채팅 등록 에러"+e.getMessage());
			return result;
		}
		return result;
	}
	
	//채팅 확인
	public int updateChatCheck(int roomseq, String userCheck) {
		int result =0;
		ChatDaoImp dao = sqlSession.getMapper(ChatDaoImp.class);
		try {
			result = dao.updateChatCheck(roomseq,userCheck);
		}catch(Exception e) {
			//System.out.println("채팅 확인 등록 에러"+e.getMessage());
			return result;
		}
		return result;
	}
	
	//접속자 확인
	public ChatRoomDTO selectNewchat(ChatRoomDTO room) {
		ChatRoomDTO resultDTO = new ChatRoomDTO();
		ChatDaoImp dao = sqlSession.getMapper(ChatDaoImp.class);
		try {
			resultDTO = dao.selectNewchat(room);
		}catch(Exception e) {
			//System.out.println("접속자 확인 에러"+e.getMessage());
			return resultDTO;
		}
		
		return resultDTO;
	}
	
	//방시간 갱신
	public int roomTimeUpdate(String userid, String userid_t) {
		int result =0;
		ChatDaoImp dao = sqlSession.getMapper(ChatDaoImp.class);
		try {
			result = dao.roomTimeUpdate(userid, userid_t);
		}catch(Exception e) {
			//System.out.println("채팅룸 시간 갱신 에러"+e.getMessage());
			return result;
		}
		return result;
	}
	
	//중복방 삭제
	public int roomDelete(String userid, String userid_t) {
		int result =0;
		ChatDaoImp dao = sqlSession.getMapper(ChatDaoImp.class);
		try {
			result = dao.roomDelete(userid, userid_t);
		}catch(Exception e) {
			//System.out.println("채팅룸 시간 갱신 에러"+e.getMessage());
			return result;
		}
		return result;
	}
	
}
