package com.dolbommon.dbmon.Teacher;

import java.io.File;
import java.util.Calendar;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Iterator;
import java.util.List;
import java.util.Map;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.dolbommon.dbmon.certification.CertificationDaoImp;
import com.dolbommon.dbmon.certification.CertificationVO;
import com.dolbommon.dbmon.deal.DealDaoImp;
import com.dolbommon.dbmon.member.RegularDateVO;
import com.dolbommon.dbmon.member.SpecificDateVO;
import com.dolbommon.dbmon.search.RecruitBoardDaoImp;
import com.dolbommon.dbmon.search.RecruitBoardVO;


@Controller
public class TeacherController {
	SqlSession sqlSession;

	public SqlSession getSqlSession() {
		return sqlSession;
	}

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@RequestMapping("/teacherList")
	public ModelAndView teacherList(HttpSession ses) {
		
		String userid = (String) ses.getAttribute("userid");
		TeacherDaoImp dao = sqlSession.getMapper(TeacherDaoImp.class);
		TeacherVO vo = dao.selectTeacher(userid);
		MemberVO mvo = dao.selectTMember(userid);
		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", vo);
		mav.addObject("mvo", mvo);
		mav.setViewName("/teacher/teacherList");
		return mav;
	}
	
	@RequestMapping("/teacherView")
	public ModelAndView teacherView(HttpSession ses, HttpServletRequest req) {
		
		String userid = (String) ses.getAttribute("userid");
		
		String paramid = req.getParameter("userid");
		DealDaoImp dao2 = sqlSession.getMapper(DealDaoImp.class);
		RecruitBoardVO checkVo = dao2.checkContract(userid, paramid);	
		if(req.getParameter("userid")!=null) {
			userid = req.getParameter("userid");
		};
		
		TeacherDaoImp dao = sqlSession.getMapper(TeacherDaoImp.class);
		TeacherVO vo = dao.selectTeacher(userid);
		MemberVO mvo = dao.selectTMember(userid);
		RegularDateVO rdVO = dao.selectSchedule(userid);
		
	
		
		
		dao.hitCount(vo);
		int timeInt = 0;
		String timeStr = "";
		if(Integer.parseInt(vo.getLast_edit())>525600) {
			timeInt = Integer.parseInt(vo.getLast_edit())/525600;
			timeStr = timeInt + "년 전";
		} else if(Integer.parseInt(vo.getLast_edit())>43200) {
			timeInt = Integer.parseInt(vo.getLast_edit())/43200;
			timeStr = timeInt + "달 전";
		} else if(Integer.parseInt(vo.getLast_edit())>1440) {
			timeInt = Integer.parseInt(vo.getLast_edit())/1440;
			timeStr = timeInt + "일 전";
		} else if(Integer.parseInt(vo.getLast_edit())>60) {
			timeInt = Integer.parseInt(vo.getLast_edit())/60;
			timeStr = timeInt + "시간 전";
		} else {
			timeInt = Integer.parseInt(vo.getLast_edit());
			timeStr = timeInt + "분 전";
		}
	
		
		String hideName = mvo.getUsername().substring(0,1) + "O" + mvo.getUsername().substring(2);
		mvo.setUsername(hideName);
		
		//후기, 경험, 인증
		List<ReviewVO> review = dao.selectReview(userid);
		List<ExperienceVO> list = dao.selectExp(userid);
		CertificationDaoImp cdao = sqlSession.getMapper(CertificationDaoImp.class);
		CertificationVO cvo = cdao.selectCert(userid);
		
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("rdVO", rdVO);
		mav.addObject("checkVo", checkVo);
		mav.addObject("paramid", paramid);
		mav.addObject("timeStr", timeStr);		
		mav.addObject("vo", vo);
		mav.addObject("mvo", mvo);
		mav.addObject("review", review);
		mav.addObject("cvo", cvo);
		mav.addObject("list", list);
		mav.addObject("userid", userid);
		mav.setViewName("teacher/teacherView");
		return mav;
	}
	
	@RequestMapping("/teacherViewT") 
	public ModelAndView teacherViewT(HttpSession ses, HttpServletRequest req) {
		
		String userid = (String) ses.getAttribute("userid");
		
		String paramid = req.getParameter("userid");
		DealDaoImp dao2 = sqlSession.getMapper(DealDaoImp.class);
		if(req.getParameter("userid")!=null) {
			userid = req.getParameter("userid");
		};
		
		TeacherDaoImp dao = sqlSession.getMapper(TeacherDaoImp.class);
		TeacherVO vo = dao.selectTeacher(userid);
		MemberVO mvo = dao.selectTMember(userid);
		RegularDateVO rdVO = dao.selectSchedule(userid);
		
		
		
		
		dao.hitCount(vo);
		int timeInt = 0;
		String timeStr = "";
		if(Integer.parseInt(vo.getLast_edit())>525600) {
			timeInt = Integer.parseInt(vo.getLast_edit())/525600;
			timeStr = timeInt + "년 전";
		} else if(Integer.parseInt(vo.getLast_edit())>43200) {
			timeInt = Integer.parseInt(vo.getLast_edit())/43200;
			timeStr = timeInt + "달 전";
		} else if(Integer.parseInt(vo.getLast_edit())>1440) {
			timeInt = Integer.parseInt(vo.getLast_edit())/1440;
			timeStr = timeInt + "일 전";
		} else if(Integer.parseInt(vo.getLast_edit())>60) {
			timeInt = Integer.parseInt(vo.getLast_edit())/60;
			timeStr = timeInt + "시간 전";
		} else {
			timeInt = Integer.parseInt(vo.getLast_edit());
			timeStr = timeInt + "분 전";
		}
		
		
		String hideName = mvo.getUsername().substring(0,1) + "O" + mvo.getUsername().substring(2);
		mvo.setUsername(hideName);
		
		//후기, 경험, 인증
		List<ReviewVO> review = dao.selectReview(userid);
		List<ExperienceVO> list = dao.selectExp(userid);
		CertificationDaoImp cdao = sqlSession.getMapper(CertificationDaoImp.class);
		CertificationVO cvo = cdao.selectCert(userid);
		
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("rdVO", rdVO);
		mav.addObject("paramid", paramid);
		mav.addObject("timeStr", timeStr);		
		mav.addObject("vo", vo);
		mav.addObject("mvo", mvo);
		mav.addObject("review", review);
		mav.addObject("cvo", cvo);
		mav.addObject("list", list);
		mav.addObject("userid", userid);
		mav.setViewName("teacher/teacherView");
		return mav;
	}


	@RequestMapping("/teacherHeart")
	public String teacherHeart() {
		return "/teacher/teacherHeart";
	}

	
	///내구직현황 선생님 <용준버전>
	@RequestMapping("/teacherApplyHistory")
	public ModelAndView teacherApplyHistory(HttpSession ses) {
			DealDaoImp dao = sqlSession.getMapper(DealDaoImp.class);
			TeacherDaoImp dao2 = sqlSession.getMapper(TeacherDaoImp.class);
			String userid = (String)ses.getAttribute("userid");
			List<RecruitBoardVO> list3 = dao.selectTeacherHistory2(userid);
			
			List<ApplyToTeacher> list = dao2.applyToParent(userid);
			List<ApplyToTeacher> list2 = dao2.applyToMe(userid);
			
			//int totalRecords = dao.getTotalRecords();	//총 게시물 수
			//List<MemberVO> mvoList = dao.selectTMemNo();
			ModelAndView mav = new ModelAndView();
			
			//mav.addObject("mvoList", mvoList);
			mav.addObject("list", list);
			mav.addObject("list2", list2);
			mav.addObject("list3", list3);
			//mav.addObject("totalRecords", totalRecords);
			mav.setViewName("/teacher/teacherApplyHistory");

			return mav;
	}
	/*
	///내구직현황 선생님 승현버전
	@RequestMapping("/teacherApplyHistory")
	public ModelAndView teacherApplyHistory(HttpSession ses) {
			DealDaoImp dao = sqlSession.getMapper(DealDaoImp.class);
			String userid = (String)ses.getAttribute("userid");
			List<RecruitBoardVO> list2 = dao.selectTeacherHistory(userid);
			List<RecruitBoardVO> list3 = dao.selectTeacherHistory2(userid);
			//int totalRecords = dao.getTotalRecords();	//총 게시물 수
			//List<MemberVO> mvoList = dao.selectTMemNo();
			ModelAndView mav = new ModelAndView();
			
			//mav.addObject("mvoList", mvoList);
			mav.addObject("list2", list2);
			mav.addObject("list3", list3);
			//mav.addObject("totalRecords", totalRecords);
			mav.setViewName("/teacher/teacherApplyHistory");

			return mav;
	}
	*/
	///행동내역 작성
	@RequestMapping("/dealHistory")
	public ModelAndView dealHistory(HttpSession ses) {
			DealDaoImp dao = sqlSession.getMapper(DealDaoImp.class);
			String userid = (String)ses.getAttribute("userid");
			List<RecruitBoardVO> list2 = dao.teacherDealHistory(userid);
			ModelAndView mav = new ModelAndView();
			
			mav.addObject("list2", list2);
			mav.setViewName("/teacher/dealHistory");

			return mav;
	}
	

	@RequestMapping("/teacherEdit")
	public ModelAndView teacherEdit(HttpSession ses) {
		String userid = (String) ses.getAttribute("userid");
		TeacherDaoImp dao = sqlSession.getMapper(TeacherDaoImp.class);
		TeacherVO vo = dao.selectTeacher(userid);
		RegularDateVO rdVO = dao.selectSchedule(userid);
		List<ExperienceVO> list = dao.selectExp(userid);

		ModelAndView mav = new ModelAndView();
		mav.addObject("rdVO", rdVO);
		mav.addObject("vo", vo);
		mav.addObject("hash", list);
		mav.setViewName("teacher/teacherEdit");
		return mav;
	}

	@RequestMapping("/teacherProof")
	public ModelAndView teacherProof(HttpSession ses) {
		CertificationDaoImp dao = sqlSession.getMapper(CertificationDaoImp.class);
		String userid = (String)ses.getAttribute("userid");
		CertificationVO cvo = dao.selectCert(userid);
		ModelAndView mav = new ModelAndView();
		mav.addObject("cvo", cvo);
		mav.setViewName("/teacher/teacherProof");
		return mav;
	}

	@RequestMapping("/teacherIntro")
	public ModelAndView teacherIntro(HttpSession ses) {
		TeacherDaoImp dao = sqlSession.getMapper(TeacherDaoImp.class);
		String userid = (String) ses.getAttribute("userid");
		TeacherVO vo = dao.selectTeacher(userid);

		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", vo);
		mav.setViewName("teacher/teacherIntro");
		return mav;

	}

	@RequestMapping(value = "/teacherIntroOk", method = RequestMethod.POST)
	public ModelAndView teacherIntroOk(TeacherVO vo, HttpSession ses) {

		TeacherDaoImp dao = sqlSession.getMapper(TeacherDaoImp.class);
		vo.setUserid((String) ses.getAttribute("userid"));
		
		int result = dao.updateIntro(vo);
		
		ModelAndView mav = new ModelAndView();
		if (result > 0) {
			mav.addObject("vo", vo);
			mav.setViewName("redirect:teacherEdit");
		} else {
			mav.setViewName("teacher/teacherResult");
		}
		return mav;
	}

	@RequestMapping("/teacherWage")
	public String teacherWage() {
		return "/teacher/teacherWage";
	}

	@RequestMapping(value = "/teacherWageOk", method = RequestMethod.POST)
	public ModelAndView teacherWageOk(TeacherVO vo, HttpSession ses) {
		TeacherDaoImp dao = sqlSession.getMapper(TeacherDaoImp.class);
		vo.setUserid((String) ses.getAttribute("userid"));
		int result = dao.updateWage(vo);

		ModelAndView mav = new ModelAndView();
		if (result > 0) {
			mav.addObject("vo", vo);
			mav.setViewName("redirect:teacherEdit");
		} else {
			mav.setViewName("teacher/teacherResult");
		}
		return mav;
	}

	@RequestMapping("/teacherPicture")
	public ModelAndView teacherPicture(HttpSession ses) {
		String userid = (String)ses.getAttribute("userid");
		TeacherDaoImp dao = sqlSession.getMapper(TeacherDaoImp.class);
		TeacherVO vo = dao.selectTeacher(userid);
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("vo", vo);
		mav.setViewName("/teacher/teacherPicture");
		return mav;
	}

	@RequestMapping(value = "/teacherPictureOk", method = RequestMethod.POST)
	@ResponseBody
	public String teacherPictureOk(TeacherVO vo, MultipartHttpServletRequest mtfRequest, HttpSession ses,
			HttpServletRequest req) {

		// folder where the pic will be saved
		String path = ses.getServletContext().getRealPath("/upload");
		System.out.println(path);
		
		// get the file from teacherPicture.jsp input name=
		MultipartFile mf = mtfRequest.getFile("filename");

		String pic = null;

		if (mf != null) { // renaming
			String fName = mf.getOriginalFilename();
			if (fName != null && !fName.equals("")) {
				String oriFileName = fName.substring(0, fName.lastIndexOf("."));
				String oriExt = fName.substring(fName.lastIndexOf(".") + 1);

				File f = new File(path, fName);
				if (f.exists()) {
					for (int renameNum = 1;; renameNum++) { // 1,2,3,4...
						String renameFile = oriFileName + renameNum + "." + oriExt;
						f = new File(path, renameFile);

						if (!f.exists()) {
							fName = renameFile;
							break;
						}
					} // for
				}

				try {
					mf.transferTo(f); // create file
				} catch (Exception e) {
				}
				pic = fName; // "hi.jpg"

			} // if fName

		} // if mf!=Null

		vo.setUserid((String) ses.getAttribute("userid")); // session id
		vo.setPic(pic); // putting the picture in

		TeacherDaoImp dao = sqlSession.getMapper(TeacherDaoImp.class);
		int result = dao.updatePic(vo); // query
		

		if (result <= 0) {
			// if the picture is not completely uploaded, then erase the picture from the
			// upload folder
			if (pic != null) {
				File ff = new File(path, pic);
				ff.delete();
			}
			
		}
		System.out.println("픽="+pic);	
		return pic;
	}


	@RequestMapping("/teacherExp")
	public ModelAndView teacherExp(HttpSession ses) {
		String userid = (String)ses.getAttribute("userid");
		TeacherDaoImp dao = sqlSession.getMapper(TeacherDaoImp.class);
		List<ExperienceVO> list = dao.selectExp(userid);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("teacher/teacherExp");
		
		return mav;
	}
	
	
	//경험추가
	@RequestMapping("/teacherAddExp")
	@ResponseBody
	public String teacherAddExp(HttpSession ses, HttpServletRequest req) {
		String result="fail";
		String userid = (String)ses.getAttribute("userid");
		TeacherDaoImp dao = sqlSession.getMapper(TeacherDaoImp.class);
		int cnt = 0;
		cnt = dao.insertExp(userid);
		if(userid!=null && !userid.equals("")) {
			if(cnt>=1) {
				result="pass";
			}
		}	
		return result;
	}
	
	//경험삭제
	@RequestMapping("/teacherDelExp")
	@ResponseBody
	public String teacherDelExp(ExperienceVO evo, HttpSession ses, HttpServletRequest req) {
		String result="fail";
		String userid = (String)ses.getAttribute("userid");
		evo.setUserid(userid);
		TeacherDaoImp dao = sqlSession.getMapper(TeacherDaoImp.class);
		int cnt = 0;
		cnt = dao.deleteExp(evo);
		if(userid!=null && !userid.equals("")) {
			if(cnt>=1) {
				result="pass";
			}
		}	
		return result;
	}
	
	//경험저장
	@RequestMapping(value="/teacherSaveExp", method=RequestMethod.POST, produces="application/text;charset=UTF-8")
	@ResponseBody
	public String teacherSaveExp(ExperienceVO evo, HttpSession ses, HttpServletRequest req) {
		String result="fail";
		String userid = (String)ses.getAttribute("userid");
		evo.setUserid(userid);
		String exp_no[] = evo.getExp_no().split(",");
		String exp_content[] = evo.getExp_content().split(",");
		String exp_start[] = evo.getExp_start().split(",");
		String exp_end[] = evo.getExp_end().split(",");
		ExperienceVO resultVO = new ExperienceVO();
		resultVO.setUserid(userid);
		TeacherDaoImp dao = sqlSession.getMapper(TeacherDaoImp.class);
		int cnt = 0;
		try {
			for(int i=0; i<exp_no.length; i++ ) {
				resultVO.setExp_no(exp_no[i]);
				resultVO.setExp_start(exp_start[i]);
				resultVO.setExp_end(exp_end[i]);
				resultVO.setExp_content(exp_content[i]);
				
				try {
					cnt = dao.updateExp(resultVO);
				}catch(Exception e) {
					System.out.println("경험저장 쿼리 에러"+e.getMessage());
				}
				
			}
			if(userid!=null && !userid.equals("")) {
				if(cnt>=1) {
					result="pass";
				}
			}	
		}catch(ArrayIndexOutOfBoundsException ai) {
			result="경험 내용을 입력하세요.";
		}

		return result;
	}
	
	/*
	@RequestMapping(value="/teacherExpOk", method=RequestMethod.POST)
	public ModelAndView teacherExpOk(ExperienceVO evo, HttpSession ses, HttpServletRequest req) {
		HashSet<ExperienceVO> hash = new HashSet<ExperienceVO>();
		String userid = (String)ses.getAttribute("userid");
		evo.setUserid(userid);
		TeacherDaoImp dao = sqlSession.getMapper(TeacherDaoImp.class);
		ModelAndView mav = new ModelAndView();
		
		String[] exp_content = req.getParameterValues("exp_content");
		String[] exp_start = req.getParameterValues("exp_start");
		String[] exp_end = req.getParameterValues("exp_end");
		
		int lenP = exp_content.length; //파라미터로 가져온 값
		int cntDB = dao.findIdT(evo); //데이터에비스에 들어있는 값
		int result = 0;
		if (cntDB<=0) {	//first insert
			for(int i=0; i<lenP; i++) {
				evo.setExp_content(exp_content[i]);
				evo.setExp_start(exp_start[i]);
				evo.setExp_end(exp_end[i]);
				if(exp_content[i]!= null || exp_start[i]!=null || exp_end[i]!=null) {
					result = dao.insertExp(evo);
					hash.add(evo);
				}
				}//for			
			
		}else {	//update
			
			if(lenP==cntDB) { //beforeDB = afterP  good to update
			
				for(int i=0; i<lenP; i++) {
					evo.setExp_content(exp_content[i]);
					evo.setExp_start(exp_start[i]);
					evo.setExp_end(exp_end[i]);
					if(exp_content[i]!= null || exp_start[i]!=null || exp_end[i]!=null) {
						result = dao.updateExp(evo);
						hash.add(evo);
					}
					}//for
				
				
		}else if(lenP>cntDB) { //added some records
								//5-3
				for(int i=0; i<lenP-cntDB; i++) {
					evo.setExp_content(exp_content[i]);
					evo.setExp_start(exp_start[i]);
					evo.setExp_end(exp_end[i]);
					if(exp_content[i]!= null || exp_start[i]!=null || exp_end[i]!=null) {
						result = dao.updateExp(evo);
						hash.add(evo);
						}
					}//for
				
		
						//3		  5	
				for(int i=cntDB; i<lenP; i++) {
					evo.setExp_content(exp_content[i]);
					evo.setExp_start(exp_start[i]);
					evo.setExp_end(exp_end[i]);
					if(exp_content[i]!= null || exp_start[i]!=null || exp_end[i]!=null) {
						result = dao.insertExp(evo);
						hash.add(evo);
						}
					}//for
				
				
			}else { //deleted new records len(new)<cnt(old)
				for(int i=0; i<cntDB-lenP; i++) { //삭제
					evo.setExp_content(exp_content[i]);
					evo.setExp_start(exp_start[i]);
					evo.setExp_end(exp_end[i]);
					if(exp_content[i]!= null || exp_start[i]!=null || exp_end[i]!=null) {
						result = dao.deleteExp(evo);
										}
					}//for
				
				for(int i=0; i<lenP; i++) {
					evo.setExp_content(exp_content[i]);
					evo.setExp_start(exp_start[i]);
					evo.setExp_end(exp_end[i]);
					if(exp_content[i]!= null || exp_start[i]!=null || exp_end[i]!=null) {
						result = dao.insertExp(evo);
						hash.add(evo);
					}
					}//for
				
			}
		}
		
		
		if(result>0) {
			mav.addObject("hash", hash);
			mav.setViewName("redirect:teacherEdit");
		}else {
			mav.setViewName("teacher/teacherResult");
		}
		
		return mav;
	}
	
	*/
	/*

	@RequestMapping("/teacherDelExp")
	public ModelAndView teacherDelExp(HttpSession ses) {
		TeacherDaoImp dao = sqlSession.getMapper(TeacherDaoImp.class);
		String userid = (String) ses.getAttribute("userid");
		int result = dao.deleteExp();
		
		ModelAndView mav = new ModelAndView();
		
		return mav;
	}
	*/
	@RequestMapping("/teacherAge") 
	public ModelAndView teacherAge(HttpSession ses) { ////
		TeacherDaoImp dao = sqlSession.getMapper(TeacherDaoImp.class);
		String userid = (String)ses.getAttribute("userid");
		TeacherVO vo = dao.selectTeacher(userid);
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("vo", vo);
		mav.setViewName("/teacher/teacherAge");
		return mav;
	
	}
	
	@RequestMapping(value="/teacherAgeOk", method= RequestMethod.POST)
	public ModelAndView teacherAgeOk(TeacherVO vo, HttpServletRequest req, HttpSession ses) {
		
		vo.setUserid((String)ses.getAttribute("userid"));
		
		String[] age_list = req.getParameterValues("child_age"); 
		String child_age="";
		for(String age: age_list) {
			child_age += age+"/";
		}
		vo.setChild_age(child_age);
		TeacherDaoImp dao = sqlSession.getMapper(TeacherDaoImp.class);
			int result = dao.updateAge(vo);
			ModelAndView mav = new ModelAndView();
		if(result>0) {
			mav.addObject("vo", vo);
			mav.setViewName("redirect:teacherEdit");
		}else {
			mav.setViewName("teacher/teacherResult");
		}
			
			return mav;
	}

	@RequestMapping("/teacherActivity") 
	public ModelAndView teacherActivity(HttpSession ses) { ////
		TeacherDaoImp dao = sqlSession.getMapper(TeacherDaoImp.class);
		String userid = (String)ses.getAttribute("userid");
		TeacherVO vo = dao.selectTeacher(userid);
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("vo", vo);
		mav.setViewName("/teacher/teacherActivity");
		return mav;
	
	}
	
	@RequestMapping(value="/teacherActivityOk", method= RequestMethod.POST)
	public ModelAndView teacherActivityOk(TeacherVO vo, HttpServletRequest req, HttpSession ses) {
		
		vo.setUserid((String)ses.getAttribute("userid"));
		
		String[] activity_list = req.getParameterValues("activity_type"); 
		String activity_type="";
		for(String act: activity_list) {
			activity_type += act+"/";
		}
		vo.setActivity_type(activity_type);
		TeacherDaoImp dao = sqlSession.getMapper(TeacherDaoImp.class);
			int result = dao.updateActivity(vo);
			ModelAndView mav = new ModelAndView();
		if(result>0) {
			mav.addObject("vo", vo);
			mav.setViewName("redirect:teacherEdit");
		}else {
			mav.setViewName("teacher/teacherResult");
		}

		return mav;
	}
	
	@RequestMapping("/teacherType")
	public String teacherType() {
		return "/teacher/teacherType";
	}




	
	@RequestMapping("/teacherTypeOk")
	public ModelAndView teacherTypeOk(TeacherVO vo, HttpSession ses, HttpServletRequest req) {
		vo.setUserid((String)ses.getAttribute("userid"));
		
		vo.setCare_type((String)req.getParameter("care_type"));
		TeacherDaoImp dao = sqlSession.getMapper(TeacherDaoImp.class);
		int result = dao.updateType(vo);
		ModelAndView mav = new ModelAndView();
		if(result>0) {
			mav.addObject("vo", vo);
			mav.setViewName("redirect:teacherEdit");
		}else {
			mav.setViewName("teacher/teacherResult");
		}
		return mav;
	}
	
	@RequestMapping(value="/cctvOk", method=RequestMethod.GET, produces="application/text; charset=UTF-8")
	@ResponseBody
	public String cctvOk(TeacherVO vo, HttpSession ses, String cctv) {
		vo.setUserid((String)ses.getAttribute("userid"));
		
		/*여기 변형*/
		if(cctv.equals("cctvAgree")) {
			vo.setCctv("Y");
		} else if (cctv.equals("cctvDisagree")) {
			vo.setCctv("N");
		}
		
		TeacherDaoImp dao = sqlSession.getMapper(TeacherDaoImp.class);
		String result = dao.updateCCTV(vo) + "";
		
		return result;		
	}
/*
	//학부모가 선생 찾을 때 보는 지도
	@RequestMapping("/teacherSearchMap")
	public ModelAndView teacherSearchMap(HttpSession ses) {
		String userid = (String)ses.getAttribute("userid");
		TeacherDaoImp dao = sqlSession.getMapper(TeacherDaoImp.class);
		HashSet<MemberVO> hash = dao.selectAllTeacher();
		MemberVO mvo = dao.selectTMap(userid);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("hash", hash);
		mav.addObject("mvo", mvo);
		mav.setViewName("/teacher/teacherSearchMap");
		return mav;
	}
	*/
	//선생 개인 위치 수정용 지도
	@RequestMapping("/teacherMap")
	public ModelAndView teacherMap(HttpSession ses) {
		String userid = (String)ses.getAttribute("userid");
		TeacherDaoImp dao = sqlSession.getMapper(TeacherDaoImp.class);
		MemberVO mvo = dao.selectTMap(userid);
		TeacherVO vo = dao.selectTeacher(userid);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("mvo", mvo);
		mav.addObject("vo", vo);
		mav.setViewName("/teacher/teacherMap");
		
		return mav;
		
	}
	
@RequestMapping(value="/teacherMapOk", method=RequestMethod.POST)
	public ModelAndView teacherMapOk(MemberVO mvo, TeacherVO tvo, HttpSession ses, HttpServletRequest req) {
		
		String userid = (String) ses.getAttribute("userid");
		mvo.setUserid(userid);
		tvo.setUserid(userid);
		
		TeacherDaoImp dao = sqlSession.getMapper(TeacherDaoImp.class);
		String lat = req.getParameter("lat");
		String lng = req.getParameter("lng");
		mvo.setLat(lat);
		mvo.setLng(lng);
		
		String area1 = req.getParameter("area1");
		if(area1 != null || !area1.equals("")) {
			tvo.setArea1(area1);
			int cnt = dao.updateArea(tvo);//칸이 채워져있을 경우만 업데이트 실행update only if the input box isn't blank
			} 
		int result = dao.updateTMap(mvo);
		
		TeacherVO vo = dao.selectTeacher(tvo.getUserid());
		
		ModelAndView mav = new ModelAndView();

		if(result>0) {
		mav.addObject("mvo", mvo);
		mav.addObject("vo", vo);
		mav.setViewName("/teacher/teacherEdit");
		}else {
			mav.setViewName("teacher/teacherResult");
		}
		return mav;
	}
	
	@RequestMapping(value="/teacherSchedule")
	public ModelAndView teacherSchedule(HttpSession ses) {
		
		String userid = (String)ses.getAttribute("userid");
		
		TeacherDaoImp dao = sqlSession.getMapper(TeacherDaoImp.class);
		RegularDateVO rdVO = dao.selectSchedule(userid);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("rdVO", rdVO);
		mav.setViewName("teacher/teacherSchedule");
		return mav;
	}
	
	@RequestMapping(value="/teacherScheduleEdit", method=RequestMethod.POST)
	public ModelAndView teacherSchedule(HttpSession ses, RegularDateVO rdVO) {
		
		String userid = (String)ses.getAttribute("userid");
		TeacherDaoImp dao = sqlSession.getMapper(TeacherDaoImp.class);
		try {
			dao.updateTeacherSchedule(userid, rdVO);
		}catch(Exception e) {
			System.out.println("에러 메세지 => " + e.getMessage());
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:teacherEdit");
		return mav;
	}
	
	@RequestMapping(value="/updateActive", method=RequestMethod.GET, produces="application/text; charset=UTF-8")
	@ResponseBody
	public String updateActive(HttpSession ses, String active) {
		String userid = (String)ses.getAttribute("userid");
		TeacherVO vo = new TeacherVO();
		vo.setUserid(userid);
		vo.setActive(active);
		TeacherDaoImp dao = sqlSession.getMapper(TeacherDaoImp.class);
		String result = dao.updateActive(vo) + "";
		return result;
	}
	
	
}




















