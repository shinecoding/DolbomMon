	
package com.dolbommon.dbmon.search;
	 
import java.util.List;
		 
	public interface RecruitBoardDaoImp { 
	//구인게시판 리스트보기 
	public List<RecruitBoardVO> recruitBoardList();	  
	//총 게시물 수 구하기 
	public int getTotalRecords(); 
	//레코드 한개 선택 
	public RecruitBoardVO recruitBoardSelect(int job_board_no);
	//조회수 증가
	public int hitCount(int job_board_no);
	//조회수 증가
	public int hitCount(RecruitBoardVO vo);
	//구인게시판 글쓰기
	public int recruitBoardInsert(RecruitBoardVO vo); 
	//구인게시판 글 삭제 
	public int recruitBoardDel(int job_board_no, String userid); 
	//구인게시판 글 수정
	public int recruitBoardEditOk(RecruitBoardVO vo); 
	//답글 쓰기 옵션 선택  
	public RecruitBoardVO optionSelect(int job_board_no);
		  
	//public int levelUpdate(RecruitBoardVO vo); 
	//답글 쓰기 
	public int replyBoardInsert(RecruitBoardVO vo); 

	//글번호 구하기
	public List<MemberVO> selectTMemNo(); 
	}
