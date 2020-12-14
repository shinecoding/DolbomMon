	
package com.dolbommon.dbmon.search;
	 
import java.util.HashSet;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.dolbommon.dbmon.member.RegularDateVO;
import com.dolbommon.dbmon.member.SpecificDateVO;
import com.dolbommon.dbmon.parent.ApplyToParentInfoVO;
import com.dolbommon.dbmon.parent.ApplyToParentVO;
import com.dolbommon.dbmon.parent.ChildrenVO;

	public interface RecruitBoardDaoImp { 
	//구인게시판 리스트보기 
	public List<RecruitBoardVO> recruitBoardList();
	//총 게시물 수 구하기 
	public int getTotalRecords(); 
	//필터
	public List<RecruitBoardVO> recruitActType(String activity_type);
	//셀렉트 필터
	public List<RecruitBoardVO> recruitCareSelect(String care_type);
	//정렬 필터
	//최신순
	public List<RecruitBoardVO> filterNewArray();
	//높은 시급순
	public List<RecruitBoardVO> filterHighWage();
	//낮은 시급순
	public List<RecruitBoardVO> filterLowWage();
	//지도 위치
	public RecruitBoardVO selectMyMap(String userid);
	//모든 학부모 지도 위치
	public HashSet<RecruitBoardVO> selectAllParents();
	
	
	//레코드 한 개 선택 
	public RecruitBoardVO recruitBoardSelect(int no);
	//레코드 한 개 선택 - 자녀
	public ChildrenVO recruitChildSelect(int no);
	//레코드 한 개 선택 - 정기적 선택(S)
	public RegularDateVO recruitRegularDateSelect(int no);
	//레코드 한 개 선택 - 특정날 선택(R)
	public SpecificDateVO recruitSpecificDateSelect(int no);
	
	//선생님이 학부모의 글을 보고 신청했을 때
	public int applyToParent(int no, String t_userid, String p_userid);
	
	//해당 글번호의 학부모아이디 가져오기
	public ApplyToParentVO getParentId(int no);
	
	//신청한 선생님의 정보를 담은 리스트 출력
	public List<ApplyToParentInfoVO> applyDbmSelect(int no); 
	
	//신청한 선생님 거절하기 - 리스트에서 삭제
	public int refusalDbm(String t_userid, int no);
	
	//선생님이 신청 취소하기
	public int applyCancel(String t_userid, int no);
	
	
	// 구인글 수정
	public int updateDbmSearch(int no, @Param("rbVO")RecruitBoardVO rbVO);// 선생님 구하기 - 글 등록
	public int updateDsChildInfo(int no, @Param("rbVO")RecruitBoardVO rbVO, @Param("cVO")ChildrenVO cVO); // 선생님 구하기 - 자녀 정보
	public int updateDsRegularDate(int no, @Param("rbVO")RecruitBoardVO rbVO, @Param("rdVO")RegularDateVO rdVO); // 선생님 구하기 - 정기적으로
	public int updateDsSpecificDate(int no, @Param("rbVO")RecruitBoardVO rbVO, @Param("sdVO")SpecificDateVO sdVO); // 선생님 구하기 - 선택한 날짜
	
	
	//이미 신청한 선생님인지 확인하기
	public int applyChk(int no, String userid);
	
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
	
	
