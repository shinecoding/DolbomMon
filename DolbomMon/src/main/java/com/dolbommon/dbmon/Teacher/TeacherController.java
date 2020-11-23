package com.dolbommon.dbmon.Teacher;

import java.io.File;
import java.io.IOException;

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

	//=======================================================
	
	@RequestMapping("/teacherList")
	public String teacherList() {
		return "/teacher/teacherList";
	}
	
	@RequestMapping("/teacherView")
	public ModelAndView teacherView(HttpSession ses) {//
		
		String userid = (String) ses.getAttribute("userid");
		
		TeacherDaoImp dao = sqlSession.getMapper(TeacherDaoImp.class);
		TeacherVO vo = dao.selectTeacher(userid);
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("vo", vo);
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
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", vo);
		mav.setViewName("teacher/teacherEdit");
		return mav;
	}
	
	@RequestMapping("/teacherProof")
	public String teacherProof() {
		return "/teacher/teacherProof";
	}

	
	  @RequestMapping("/teacherIntro")
	  public ModelAndView teacherIntro(HttpSession ses) { 
		  TeacherDaoImp dao = sqlSession.getMapper(TeacherDaoImp.class);
		  String userid= (String)ses.getAttribute("userid"); 
		  TeacherVO vo = dao.selectTeacher(userid);
		  
		  ModelAndView mav = new ModelAndView(); 
		  mav.addObject("vo", vo);
		  mav.setViewName("teacher/teacherIntro"); 
		  return mav; 
		  
	  }
	 
	
	
	 @RequestMapping(value="/teacherIntroOk", method=RequestMethod.POST) 
	 public ModelAndView teacherIntroOk(TeacherVO vo, HttpSession ses) {

	 TeacherDaoImp dao = sqlSession.getMapper(TeacherDaoImp.class);
	vo.setUserid((String)ses.getAttribute("userid"));
	 int result = dao.updateIntro(vo);
	 
	 ModelAndView mav = new ModelAndView(); 
	 if(result>0) {	 
		 mav.addObject("vo", vo);
		 mav.setViewName("redirect:teacherEdit"); 
	}else { 
	 mav.setViewName("teacher/teacherResult"); 
	}
	 return mav; 
	 }
	 
	
	@RequestMapping("/teacherWage")
	public String teacherWage() {
		return "/teacher/teacherWage";
	}
	
	@RequestMapping(value="/teacherWageOk", method=RequestMethod.POST)
	public ModelAndView teacherWageOk(TeacherVO vo, HttpSession ses) {
		TeacherDaoImp dao = sqlSession.getMapper(TeacherDaoImp.class);
		vo.setUserid((String)ses.getAttribute("userid"));
		int result = dao.updateWage(vo);
		
		ModelAndView mav = new ModelAndView();
		if(result>0) {
			mav.addObject("vo", vo);
			mav.setViewName("redirect:teacherEdit");
		}else {
			mav.setViewName("teacher/teacherResult");
		}
		return mav;	
	}
	
	@RequestMapping("/teacherPicture")
	public String teacherPicture() {
		return "/teacher/teacherPicture";
	}
	
	@RequestMapping(value="/teacherPictureOk", method=RequestMethod.POST)
	public ModelAndView teacherPictureOk(TeacherVO vo, MultipartHttpServletRequest mtfRequest, HttpSession ses, HttpServletRequest req) {
		
		//folder where the pic will be saved
		String path = ses.getServletContext().getRealPath("/upload");
		
		
		//get the file from teacherPicture.jsp input name=
		MultipartFile mf = mtfRequest.getFile("filename");
			
		String pic = null;
		
		if(mf!=null) { //renaming
			String fName = mf.getOriginalFilename(); 
			if(fName!=null && !fName.equals("")) { 
				String oriFileName = fName.substring(0, fName.lastIndexOf("."));
				String oriExt = fName.substring(fName.lastIndexOf(".")+1); 
				
				File f = new File(path, fName);
				if(f.exists()) { 
					for(int renameNum=1;; renameNum++) { //1,2,3,4...
						String renameFile = oriFileName + renameNum + "." + oriExt; 
						f = new File(path, renameFile);
						
						if(!f.exists()) { 
							fName = renameFile;
							break;
						}
					}//for
				}
			
	
				try {
					mf.transferTo(f); //create file
				}catch(Exception e) {}
				pic = fName;  //"hi.jpg"
				
			}//if fName
			
			
		}//if mf!=Null
		
		
	
		
		vo.setUserid((String)ses.getAttribute("userid")); //session id
		vo.setPic(pic); //putting the picture in
		
		TeacherDaoImp dao = sqlSession.getMapper(TeacherDaoImp.class);
		int result = dao.updatePic(vo); //query
		ModelAndView mav = new ModelAndView();
		
		
		if(result<=0) { 
			//if the picture is not completely uploaded, then erase the picture from the upload folder
			if(pic!=null) {
			File ff = new File(path, pic);
			ff.delete();
			}
		//fail
		mav.addObject("msg", "자료실 글 등록 실패하였습니다.");
		mav.setViewName("/teacher/teacherResult");
	} else { //success
		mav.setViewName("redirect:teacherPicture");	
		}
		return mav;
	}
	
	@RequestMapping("/teacherExp")
	public String teacherExp() {
		return "/teacher/teacherExp";
	}
	
	/*
	 * @RequestMapping("/teacherAge") public ModelAndView
	 * teacherAge(HttpServletResponse req) { ////, HttpSession ses
	 * 
	 * //String[] age_list = req.getParameterValues("child_age"); TeacherDaoImp dao
	 * = sqlSession.getMapper(TeacherDaoImp.class);
	 * 
	 * 
	 * ModelAndView mav = new ModelAndView();
	 * mav.setViewName("/teacher/teacherAge"); return mav; }
	 */
	@RequestMapping("/teacherAgeOk")
	public ModelAndView teacherAgeOk() {
		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/teacher/teacherAgeOk");
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
}
