package com.dolbommon.dbmon.Teacher;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.dolbommon.dbmon.certification.CertificationDaoImp;
import com.dolbommon.dbmon.certification.CertificationVO;
import com.dolbommon.dbmon.member.MemberDaoImp;
import com.dolbommon.dbmon.member.MemberVO;

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

	// =======================================================

	@RequestMapping("/teacherList")
	public String teacherList() {
		return "/teacher/teacherList";
	}

	@RequestMapping("/teacherView")
	public ModelAndView teacherView(HttpSession ses) {//

		String userid = (String) ses.getAttribute("userid");

		TeacherDaoImp dao = sqlSession.getMapper(TeacherDaoImp.class);
		TeacherVO vo = dao.selectTeacher(userid);
		dao.hitCount(vo);
		HashSet<ExperienceVO> hash = dao.selectExp(userid);
		
		ModelAndView mav = new ModelAndView();

		mav.addObject("vo", vo);
		mav.addObject("hash", hash);
		mav.setViewName("teacher/teacherView");
		return mav;
	}

	@RequestMapping("/teacherHeart")
	public String teacherHeart() {
		return "/teacher/teacherHeart";
	}

	@RequestMapping("/teacherApplyHistory")
	public String teacherApplyHistory() {
		return "/teacher/teacherApplyHistory";
	}

	@RequestMapping("/teacherEdit")
	public ModelAndView teacherEdit(HttpSession ses) {
		String userid = (String) ses.getAttribute("userid");
		TeacherDaoImp dao = sqlSession.getMapper(TeacherDaoImp.class);
		TeacherVO vo = dao.selectTeacher(userid);
		HashSet<ExperienceVO> hash = dao.selectExp(userid);

		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", vo);
		mav.addObject("hash", hash);
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
	public ModelAndView teacherPictureOk(TeacherVO vo, MultipartHttpServletRequest mtfRequest, HttpSession ses,
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
		ModelAndView mav = new ModelAndView();

		if (result <= 0) {
			// if the picture is not completely uploaded, then erase the picture from the
			// upload folder
			if (pic != null) {
				File ff = new File(path, pic);
				ff.delete();
			}
			// fail
			//mav.addObject("msg", "자료실 글 등록 실패하였습니다.");
			mav.setViewName("/teacher/teacherResult");
		} else { // success
			mav.setViewName("redirect:teacherEdit");
		}
		return mav;
	}

	@RequestMapping("/teacherExp")
	public ModelAndView teacherExp(HttpSession ses) {
		String userid = (String)ses.getAttribute("userid");
		TeacherDaoImp dao = sqlSession.getMapper(TeacherDaoImp.class);
		HashSet<ExperienceVO> hash = dao.selectExp(userid);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("hash", hash);
		mav.setViewName("teacher/teacherExp");
		
		return mav;
	}
	
	@RequestMapping(value="/teacherExpOk", method=RequestMethod.POST)
	public ModelAndView teacherExpOk(ExperienceVO evo, HttpSession ses, HttpServletRequest req) {
		HashSet<ExperienceVO> hash = new HashSet<ExperienceVO>();
		
		evo.setUserid((String)ses.getAttribute("userid"));
		TeacherDaoImp dao = sqlSession.getMapper(TeacherDaoImp.class);
		ModelAndView mav = new ModelAndView();
		
		String[] exp_content = req.getParameterValues("exp_content");
		String[] exp_start = req.getParameterValues("exp_start");
		String[] exp_end = req.getParameterValues("exp_end");
		
		
		
		if(exp_content!=null && exp_start!=null && exp_end!= null) {
				for(int i=0; i<exp_content.length; i++) {
					if(exp_content[i]!= null && exp_start[i]!=null && exp_end[i]!=null) {
						evo.setExp_content(exp_content[i]);
						evo.setExp_start(exp_start[i]);
						evo.setExp_end(exp_end[i]);
						hash.add(evo);
					}else {
						evo.setExp_content(exp_content[i]);
						evo.setExp_start(exp_start[i]);
						evo.setExp_end(exp_end[i]);
						hash.remove(evo);
						}
					
				}//for
		}
		
	
		
		
		int result = dao.updateExp(hash);
		if(result>0) {
			mav.addObject("hash", hash);
			mav.setViewName("redirect:teacherEdit");
		}else {
			mav.setViewName("teacher/teacherResult");
		}
		
		return mav;
	}
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
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/teacher/teacherAge");
		return mav;
	
	}
	
	@RequestMapping(value="/teacherAgeOk", method= RequestMethod.POST)
	public ModelAndView teacherAgeOk(TeacherVO vo, HttpServletRequest req, HttpSession ses) {
		
		vo.setUserid((String)ses.getAttribute("userid"));
		
		String[] age_list = req.getParameterValues("child_age"); 
		vo.setAge_list(age_list);
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
	public String teacherActivity() {
		return "/teacher/teacherActivity";
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
	
	@RequestMapping("/cctvOk")
	public ModelAndView cctvOk(TeacherVO vo, HttpSession ses, HttpServletRequest req) {
		vo.setUserid((String)ses.getAttribute("userid"));
		
		vo.setCctv((String)req.getParameter("cctv"));
		
		TeacherDaoImp dao = sqlSession.getMapper(TeacherDaoImp.class);
		int result = dao.updateCCTV(vo);
		
		ModelAndView mav = new ModelAndView();
		
		if(result>0) {
			mav.addObject("vo", vo);
			mav.setViewName("redirect:teacherEdit");
		}else {
			mav.setViewName("teacher/teacherResult");
		}
		return mav;		
	}
	

	
}
