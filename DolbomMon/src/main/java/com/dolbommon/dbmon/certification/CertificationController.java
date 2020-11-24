package com.dolbommon.dbmon.certification;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.dolbommon.dbmon.Teacher.TeacherDaoImp;
import com.dolbommon.dbmon.Teacher.TeacherVO;

@Controller
public class CertificationController {
	
	SqlSession sqlSession;

	public SqlSession getSqlSession() {
		return sqlSession;
	}
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	

	@RequestMapping("/proofIdenti")
	public String teacherProofIdenti() {
		return "/certification/proofIdenti";
	}
	
	@RequestMapping(value="/proofIdentiOk", method=RequestMethod.POST)
	public ModelAndView teacherProofIdentiOk(CertificationVO vo, MultipartHttpServletRequest mtfRequest, HttpSession ses,
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
		vo.setIdenti(pic); // putting the picture in
		String identi_addr = (String)req.getParameter("identi_addr");
		String identi_year = (String)req.getParameter("identi_year");
		String identi_month = (String)req.getParameter("identi_month");
		String identi_day = (String)req.getParameter("identi_day");
		if(identi_day.length()==1) {
			identi_day = "0"+identi_day;
		}
		if(identi_month.length()==1) {
			identi_month = "0"+identi_month;
		}
		String identi_date = identi_year+"-"+identi_month+"-"+identi_day;
		vo.setIdenti_addr(identi_addr);
		vo.setIdenti_date(identi_date);
		CertificationDaoImp dao = sqlSession.getMapper(CertificationDaoImp.class);
		int result = dao.insertIdenti(vo); // query
		
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
			mav.setViewName("/certification/proofResult");
		} else { // success
			mav.setViewName("redirect:teacherProof");
		}
		return mav;
	}
	
	
	@RequestMapping("/proofSchool")
	public String teacherProofSchool() {
		return "/certification/proofSchool";
	}
	
	@RequestMapping(value="/proofSchoolOk", method=RequestMethod.POST)
	public ModelAndView teacherSchoolOk(CertificationVO vo, MultipartHttpServletRequest mtfRequest, HttpSession ses,
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
		vo.setSchool_proof(pic); // putting the picture in
		vo.setSchool((String)req.getParameter("school"));
		vo.setDepartment((String)req.getParameter("department"));
		vo.setDegree((String)req.getParameter("degree"));
		vo.setStatus((String)req.getParameter("status"));
		vo.setGrade((String)req.getParameter("grade"));
		
		
		String school_year = (String)req.getParameter("school_year");
		String school_month = (String)req.getParameter("school_month");
		String school_day = (String)req.getParameter("school_day");
		if(school_day.length()==1) {
			school_day = "0"+school_day;
		}
		if(school_month.length()==1) {
			school_month = "0"+ school_month;
		}
		String school_date = school_year+"-"+school_month+"-"+school_day;
		vo.setSchool_date(school_date);
		CertificationDaoImp dao = sqlSession.getMapper(CertificationDaoImp.class);
		int result = dao.insertSchool(vo); // query
		
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
			mav.setViewName("/certification/proofResult");
		} else { // success
			mav.setViewName("redirect:teacherProof");
		}
		return mav;
	}
	

	
	
	
	@RequestMapping("/proofTeacher")
	public String teacherProofTeacher() {
		return "/certification/proofTeacher";
	}
	
	@RequestMapping(value="/proofTeacherOk", method=RequestMethod.POST)
	public ModelAndView teacherProofTeacherOk(CertificationVO vo, MultipartHttpServletRequest mtfRequest, HttpSession ses,
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
		vo.setLicense_proof(pic); // putting the picture in
		vo.setLicense((String)req.getParameter("license"));
		
		String license_year = (String)req.getParameter("license_year");
		String license_month = (String)req.getParameter("license_month");
		String license_day = (String)req.getParameter("license_day");
		if(license_day.length()==1) {
			license_day = "0"+license_day;
		}
		if(license_month.length()==1) {
			license_month = "0"+ license_month;
		}
		String license_date = license_year+"-"+ license_month+"-"+ license_day;
		vo.setLicense_date(license_date);
		CertificationDaoImp dao = sqlSession.getMapper(CertificationDaoImp.class);
		int result = dao.insertLicense(vo); // query
		
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
			mav.setViewName("/certification/proofResult");
		} else { // success
			mav.setViewName("redirect:teacherProof");
		}
		return mav;
	}
	
	
	
	
	@RequestMapping("/proofCrime")
	public String teacherProofSexCrime() {
		return "/certification/proofCrime";
	}
	
	
	
	@RequestMapping(value="/proofCrimeOk", method=RequestMethod.POST)
	public ModelAndView teacherProofCrimeOk(CertificationVO vo, MultipartHttpServletRequest mtfRequest, HttpSession ses,
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
		vo.setCrime(pic); // putting the picture in
		
		
		String crime_year = (String)req.getParameter("crime_year");
		String crime_month = (String)req.getParameter("crime_month");
		String crime_day = (String)req.getParameter("crime_day");
		if(crime_day.length()==1) {
			crime_day = "0"+crime_day;
		}
		if(crime_month.length()==1) {
			crime_month = "0"+ crime_month;
		}
		String crime_date = crime_year+"-"+ crime_month+"-"+ crime_day;
		vo.setCrime_date(crime_date);
		CertificationDaoImp dao = sqlSession.getMapper(CertificationDaoImp.class);
		int result = dao.insertCrime(vo); // query
		
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
			mav.setViewName("/certification/proofResult");
		} else { // success
			mav.setViewName("redirect:teacherProof");
		}
		return mav;
	}
	
	
	@RequestMapping("/proofPrivacy")
	public String teacherProofPrivacy() {
		return "/certification/proofPrivacy";
	}
	
	
	
}
