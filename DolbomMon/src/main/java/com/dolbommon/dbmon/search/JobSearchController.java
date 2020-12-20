package com.dolbommon.dbmon.search;


import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dolbommon.dbmon.Teacher.TeacherDaoImp;

@Controller
public class JobSearchController {
	SqlSession sqlSession;
	
	public SqlSession getSqlSession() {
		return sqlSession;
	}
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	
	//구인페이지로 이동하기

	@RequestMapping("/sitter_list") 
	public ModelAndView sitter(HttpSession ses, HttpServletRequest req) {
		String userid = (String)ses.getAttribute("userid");
		
		JobSearchDaoImp dao = sqlSession.getMapper(JobSearchDaoImp.class);

		List<TeacherVO> list = new ArrayList<TeacherVO>();
		String activity_type = req.getParameter("activity_type");
		System.out.println("000000"+activity_type);
		if(req.getParameter("activity_type")==null) {
			list = dao.jobSearchBoardList(9999); //선생님 리스트
		}else {
			list = dao.jobSearchActType(activity_type, 12);
		}
		

		HashSet<TeacherVO> hash = dao.selectAllTeacher();//지도의 모든 선생/부모 위치
		TeacherVO mvo = null;
		if(ses.getAttribute("userid")==null) {
			//로그인 안 했을 때 지도 위치 지정 >test1계정의 위치 띄워줌
			mvo = dao.selectTTMap("sitter0");
		} else {
		mvo = dao.selectTTMap(userid); //내 위치
		}
		int totalRecord = dao.getTotalRecord();	//총 게시물 수
		
		
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("list", list);
		mav.addObject("hash", hash);
		mav.addObject("mvo", mvo);
		mav.addObject("activity_type", activity_type);
		mav.addObject("totalRecord", totalRecord);//총 게시물 수
		mav.setViewName("search/sitter");
		
		return mav;
	
	}
	//메인화면에 띄워줄 리스트
	@RequestMapping("/teacher_chart") 
	public ModelAndView teacher_chart() {
		JobSearchDaoImp dao = sqlSession.getMapper(JobSearchDaoImp.class);
		List<TeacherVO> list = dao.jobSearchBoardList(10);
		int totalRecord = dao.getTotalRecord();	//총 게시물 수
		//List<MemberVO> mvoList = dao.selectTMem();
		ModelAndView mav = new ModelAndView();
		
		//mav.addObject("mvoList", mvoList);
		mav.addObject("list", list);
		mav.addObject("totalRecord", totalRecord);
		mav.setViewName("search/sitter");
		
		return mav;
	
	}
	
	//=========================필터들===================================================
	
	@RequestMapping(value="/searchAct", method=RequestMethod.GET, produces="application/json; charset=UTF-8")
	@ResponseBody
	public List<TeacherVO> searchAct(String activity_type, int count) {
		System.out.println("액티비티 타입"+activity_type);
		JobSearchDaoImp dao = sqlSession.getMapper(JobSearchDaoImp.class);
		List<TeacherVO> list = dao.jobSearchActType(activity_type, count);
		
		return list;
	}
	
	@RequestMapping(value="/searchCare", method=RequestMethod.GET, produces="application/json; charset=UTF-8")
	@ResponseBody
	public List<TeacherVO> searchCare(String care_type, int count) {
		System.out.println("케어 타입"+care_type);
		JobSearchDaoImp dao = sqlSession.getMapper(JobSearchDaoImp.class);
		List<TeacherVO> list = new ArrayList<TeacherVO>();
		
		if(care_type.equals("all")) {
			list = dao.jobSearchBoardList(12);
		}else {
			list = dao.jobSearchCareType(care_type, count); 	
		}
		return list;
		
		
	}
	

	@RequestMapping(value="/filterOrder", method=RequestMethod.GET, produces="application/json; charset=UTF-8")
	@ResponseBody
	public List<TeacherVO> filterOrder(String order, int count){
		
		JobSearchDaoImp dao = sqlSession.getMapper(JobSearchDaoImp.class);
		
		List<TeacherVO> list = new ArrayList<TeacherVO>();
		
		if(order.equals("last_edit")){
			list = dao.filterLastEdit(count);
		} else if(order.equals("certi_cnt")){
			list = dao.filterCertiCnt(count);
		} else if(order.equals("wage_low")){
			list = dao.filterWageLow(count);
		} else if(order.equals("wage_high")){
			list = dao.filterWageHigh(count);
		} else if(order.equals("F")) {
			list = dao.filterGender("F", count);
		} else if(order.equals("M")) {
			list = dao.filterGender("M", count);
		} else if(order.equals("all")) {
			list = dao.jobSearchBoardList(count);
		}
		
		return list;
	}
	
	
	
	@RequestMapping(value="/likeOrder", method=RequestMethod.GET, produces="application/json; charset=UTF-8")
	@ResponseBody
	public List<TeacherVO> likeOrder(String order, HttpSession ses, HttpServletRequest req, TeacherVO vo){
		
		JobSearchDaoImp dao = sqlSession.getMapper(JobSearchDaoImp.class);
		String userid = (String)ses.getAttribute("userid");
		vo.setUserid(userid);
		
		
		//페이징
		String nowPageTxt = req.getParameter("nowPage");
		if(nowPageTxt!=null) { //페이지 번호를 request한 경우
			vo.setNowPage(Integer.parseInt(nowPageTxt));
			}
				
		vo.setTotalRecord(dao.getHeartRecord(userid)); //총 레코드 수
				
		
		List<TeacherVO> list = new ArrayList<TeacherVO>();
		String sql = sqlSession.getConfiguration().getMappedStatement("likeOrder").getBoundSql(vo).getSql();
		System.out.println("sql="+sql);
		
		if(order.equals("last_edit")){
			list = dao.likeOrder(vo);
		} else if(order.equals("certi_cnt")){
			list = dao.likeCertiCnt(vo);
		} else if(order.equals("wage_low")){
			list = dao.likeWageLow(vo);
		} else if(order.equals("wage_high")){
			list = dao.likeWageHigh(vo);
		}
		
		return list;
	}


	@RequestMapping("/parentHeart") //부모 찜리스트에 보여지는 선생님 정보
	public ModelAndView parentHeart(HttpSession ses, HttpServletRequest req, TeacherVO vo) {
		JobSearchDaoImp dao = sqlSession.getMapper(JobSearchDaoImp.class);
		
		//리스트보여주기
		String userid = (String)ses.getAttribute("userid");
		System.out.println("세션 아이디"+userid);
		vo.setUserid(userid);
		
		//String sql = sqlSession.getConfiguration().getMappedStatement("selectHeart").getBoundSql("userid").getSql();
		//System.out.println("sql="+sql);
		
		//페이징
		String nowPageTxt = req.getParameter("nowPage");
		if(nowPageTxt!=null) { //페이지 번호를 request한 경우
			vo.setNowPage(Integer.parseInt(nowPageTxt));
		}
		
		vo.setTotalRecord(dao.getHeartRecord(userid)); //총 레코드 수
		
		List<TeacherVO> list = dao.likeOrder(vo);
		System.out.println("리스트"+list);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("nowPage", vo.getNowPage());
		mav.addObject("vo", vo);
		mav.addObject("list", list);
		mav.setViewName("/parents/parentHeart");
		return mav;
	}
	@RequestMapping("/selectActive") //찜리스트 전체&구인중
	@ResponseBody
	public List<TeacherVO> selectActive(HttpSession ses, String active,  HttpServletRequest req, TeacherVO vo) {
		
		String userid = (String)ses.getAttribute("userid");
		JobSearchDaoImp dao = sqlSession.getMapper(JobSearchDaoImp.class);
		vo.setUserid(userid);
		
		//페이징
		String nowPageTxt = req.getParameter("nowPage");
		if(nowPageTxt!=null) { //페이지 번호를 request한 경우
			vo.setNowPage(Integer.parseInt(nowPageTxt));
			}
		vo.setTotalRecord(dao.getHeartRecord(userid)); //총 레코드 수
						
		List<TeacherVO> list = new ArrayList<TeacherVO>();
			
		
		
		if(active.equals("allActive")) {
			list = dao.selectHeart(vo);
		}else if(active.equals("onlyActive")) {
			list = dao.selectHeartActive(vo);
		}
		
		return list;
	}
	
	@RequestMapping(value="/insertHeartT", method=RequestMethod.GET, produces="application/text; charset=UTF-8")
	@ResponseBody
	public String insertHeartT(HttpSession ses, String cardid) {
		String userid = (String)ses.getAttribute("userid");
		LiketVO vo = new LiketVO();
		vo.setUserid(userid);
		vo.setCardid(cardid);
		JobSearchDaoImp dao = sqlSession.getMapper(JobSearchDaoImp.class);
		String result = dao.insertHeart(vo) +"";
		
		return result;
	}
	
	@RequestMapping(value="/deleteHeartT", method=RequestMethod.GET, produces="application/text; charset=UTF-8")
	@ResponseBody
	public String deleteHeartT(HttpSession ses, String cardid) {
		String userid = (String)ses.getAttribute("userid");
		LiketVO vo = new LiketVO();
		vo.setUserid(userid);
		vo.setCardid(cardid);
		JobSearchDaoImp dao = sqlSession.getMapper(JobSearchDaoImp.class);
		String result = dao.deleteHeart(vo) +"";
		
		return result;
	}
	
	
	@RequestMapping("/parentHistory")
	public ModelAndView parentHistory(HttpSession ses) {
		String userid = (String)ses.getAttribute("userid");
		
		JobSearchDaoImp dao = sqlSession.getMapper(JobSearchDaoImp.class);
		List<TeacherVO> list = dao.selectHistory(userid);
		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("/parents/parentHistory");
		return mav; 
	}
	
	
}
