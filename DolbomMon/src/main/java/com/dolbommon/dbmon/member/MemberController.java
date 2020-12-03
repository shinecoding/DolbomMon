package com.dolbommon.dbmon.member;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.dolbommon.dbmon.Teacher.TeacherVO;

@Controller
public class MemberController {
		SqlSession sqlSession;
		public SqlSession getSqlSession() {
			return sqlSession;
		}
		@Autowired
		public void setSqlSession(SqlSession sqlSession) {
			this.sqlSession = sqlSession;
		}
		
		@Autowired
		DataSourceTransactionManager transactionManager;
		
		
		////////////////공통//////////////	
		// 선생님, 부모님 회원가입 선택
		@RequestMapping("/join")
		public String join(HttpSession ses) {
			return "register/join";
		}
		
		@RequestMapping(value="parentJoin", method=RequestMethod.POST)
		public String parentJoin(@RequestParam("who") String who, HttpSession ses) {
			
			ses.setAttribute("who", who);
			return "register/regForm";
		}
		
		@RequestMapping(value="dbmJoin", method=RequestMethod.POST)
		public String dbmJoin(@RequestParam("who") String who, HttpSession ses) {
			ses.setAttribute("who", who);
			return "register/dbm/dbmType";
		}
		
		// 선생님, 부모님 회원가입 폼
		@RequestMapping(value="/regForm", method=RequestMethod.POST)
		public ModelAndView regForm(
				@RequestParam("intro") String intro,
				HttpSession ses
				) {
			ses.setAttribute("intro", intro);
			ModelAndView mav = new ModelAndView();
			
			mav.setViewName("register/regForm");
			return mav;
		}
				
		@RequestMapping(value="/regFormOk", method=RequestMethod.POST)
		public ModelAndView regOk(
			HttpServletRequest req,HttpSession ses, MemberVO mVo, TeacherVO tVo, RegularDateVO rdVo) {
			
			DefaultTransactionDefinition def = new DefaultTransactionDefinition();
			def.setPropagationBehavior(DefaultTransactionDefinition.PROPAGATION_REQUIRED);
			
			TransactionStatus status = transactionManager.getTransaction(def);
			
			MemberDaoImp dao = sqlSession.getMapper(MemberDaoImp.class);
			ModelAndView mav = new ModelAndView();
			
			String who = (String)ses.getAttribute("who");
			int result = 0;
			
			try {
				if(who=="T") {
					dao.memberReg(mVo);
					
					dao.memberRegTeacher(mVo, tVo);
					
					result = dao.memberRegRegular(mVo, rdVo);
				}else {
					result = dao.memberReg(mVo);
				}
				transactionManager.commit(status);
			}catch(Exception e) {
				transactionManager.rollback(status);
			}
			
			mav.addObject("result", result);
			mav.setViewName("register/regResult");
			
			return mav;
		}
		
		// 아이디 중복검사 
		@RequestMapping(value = "/idCheckAjax", method = RequestMethod.POST)
		@ResponseBody
		public int useridChk(@RequestParam("userid") String userid) {
			
			MemberDaoImp dao = sqlSession.getMapper(MemberDaoImp.class);
			int result = dao.memberUseridChk(userid);
			return result;
		}
		
		// 연락처 중복검사
		@RequestMapping(value = "/telCheckAjax", method = RequestMethod.POST)
		@ResponseBody
		public int usertelChk(@RequestParam("tel1") String tel1) {
			System.out.println("ㅠㅠ");
			MemberDaoImp dao = sqlSession.getMapper(MemberDaoImp.class);
			int result = dao.memberUsertelChk(tel1);
			return result;
		}
		
		@RequestMapping(value = "/sendSms", method = RequestMethod.POST)
		@ResponseBody
		public String sendSms(HttpServletRequest request) throws Exception {

			String api_key = "NCSQ0VURJQQSSIOA";
			String api_secret = "JXF7YGYDKKIHGNGMCRJY5ABSZX5S8GII";

		    com.dolbommon.dbmon.member.Coolsms coolsms = new com.dolbommon.dbmon.member.Coolsms(api_key, api_secret);
		       
		    HashMap<String, String> set = new HashMap<String, String>();

		    set.put("to", (String)request.getParameter("tel1")); // 받는 사람
		    set.put("from", "01096801682"); // 발신번호
		    set.put("text", "돌봄몬 본인인증 \n 인증번호는 ["+(String)request.getParameter("text")+"]입니다"); // 문자내용
		    set.put("type", "sms"); // 문자 타입
		   
		    coolsms.send(set); // 보내기
		    
		    return "suc";
		}

		//////////////공통//////////////
		
		//////////////////////////// 학부모 회원가입 시작 /////////////////////////////////
		
		// 원하는 돌봄선택, 선생님 나이선택
		@RequestMapping("/parent/activityAndAge")
		public String parentActivityAndAge() {
			return "register/parent/activityAndAge";
		}
		
		// 자녀 정보 입력
		@RequestMapping(value="/parent/children", method=RequestMethod.POST)
		public String children(HttpSession ses,
							  @RequestParam("pw_activity") String pw_activity,
							  @RequestParam("wish_age") String wish_age
				) {
			ses.setAttribute("pw_activity", pw_activity);
			ses.setAttribute("wish_age", wish_age);
			return "register/parent/children";
		}
		
		// 학부모 - 지역(시,군,구,동) 설정 
		@RequestMapping(value="/parent/location", method=RequestMethod.POST)
		public String parentLoaction(HttpSession ses,
									@RequestParam("child_name") String child_name,
									@RequestParam("child_birth") String child_birth,
									@RequestParam("wish_wage") String wish_wage
			) {
			ses.setAttribute("child_name", child_name);
			ses.setAttribute("child_birth", child_birth);
			ses.setAttribute("wish_wage", wish_wage);
			return "register/parent/location";
		}
		
		// 학부모 - 스케줄 선택
		@RequestMapping("/parent/schedule")
		public String parentSchedule() {
			return "register/parent/schedule/schedule";
		}
		
		// 학부모 - 정기적으로 시간 설정
		@RequestMapping("/parent/scheduleType/regular")
		public String parentScheduleRegular() {
			return "register/parent/schedule/regular";
		}
		
		// 학부모 - 특정날에만 시간 설정 
		@RequestMapping("/parent/scheduleType/shortTerm")
		public String parentScheduleShortTerm() {
			return "register/parent/schedule/shortTerm";
		}
		
		// 학부모 - 아직 정확한 계획은 없어요 설정
		@RequestMapping("/parent/scheduleType/noPlan")
		public String parentScheduleNoPlan() {
			return "register/parent/schedule/noPlan";
		}
		
		// 학부모 - 특이사항 입력
		@RequestMapping(value="/parent/description", method=RequestMethod.POST)
		public String parentDescription(HttpSession ses,
				@RequestParam("yoil") String yoil,
				@RequestParam("start_date") String start_date,
				@RequestParam("end_date") String end_date,
				@RequestParam("start_time") String start_time,
				@RequestParam("end_time") String end_time
				) {
			ses.setAttribute("yoil", yoil);
			ses.setAttribute("start_date", start_date);
			ses.setAttribute("end_date", end_date);
			ses.setAttribute("start_time", start_time);
			ses.setAttribute("end_time", end_time);
			
			return "register/parent/description";
		}
		
		////////////////////////////// 돌봄몬 회원가입 시작 //////////////////////////////////
		
		// 돌봄몬 - 유형 선택(선생님, 대학생, 엄마, 일반) >>
		@RequestMapping(value="/dbm/dbmType", method = RequestMethod.POST)
		public String selectDbmType() {
			return "register/dbm/dbmType";
		}
		
		// 돌볼 수 있는 아이의 연령대와 가능한 활동  >>
		@RequestMapping(value = "/dbm/activityAndAge", method = RequestMethod.POST)
		public String dbmActivityAndAge(@RequestParam("care_type") String care_type, HttpSession ses) {
			
			ses.setAttribute("care_type", care_type);
			
			return "register/dbm/activityAndAge";
		}
		
		// 돌봄몬 - 지역(시,군,구,동) 설정  >>
		@RequestMapping(value="/dbm/location", method = RequestMethod.POST)
		public String dbmLoaction(@RequestParam("child_age") String child_age,
										@RequestParam("activity_type") String activity_type,
										HttpSession ses
		) {	
			child_age = child_age.replace(",", "/");
			activity_type = activity_type.replace(",", "/");
			ses.setAttribute("child_age", child_age);
			ses.setAttribute("activity_type", activity_type);
			
			return "register/dbm/location";
		}
		
		// 돌봄몬 - 원하는 시간 입력 >>
		@RequestMapping(value="/dbm/schedule", method = RequestMethod.POST)
		public String dbmSchedule(
							      ) {
			// 지역(시,군,구,동) 값 넘겨줘야 함 (미구현)
			return "register/dbm/schedule/schedule";
		}
		
		// 돌봄몬 - 원하는 시간 직접 입력하기 >>
		@RequestMapping("/dbm/schedule/detail")
		public String dbmScheduleDetail() {
			return "register/dbm/schedule/detail";
		}
		
		// 돌봄몬 - 희망시급과 CCTV동의여부 >>
		@RequestMapping(value="/dbm/wantedPaymentAndCCTV", method = RequestMethod.POST)
		public String dbmWantedPaymentAndCCTV(HttpSession ses,
			      @RequestParam("yoil") String yoil,
			      @RequestParam("start_time") String start_time,
			      @RequestParam("end_time") String end_time,
			      @RequestParam("start_date") String start_date,
			      @RequestParam("end_date") String end_date
		) {
			ses.setAttribute("yoil", yoil);
			ses.setAttribute("start_time", start_time);
			ses.setAttribute("end_time", end_time);
			ses.setAttribute("start_date", start_date);
			ses.setAttribute("end_date", end_date);
			return "register/dbm/wantedPaymentAndCCTV";
		}
		
		@RequestMapping(value="/dbm/profileImage", method = RequestMethod.POST)
		public String dbmProfileImage(HttpSession ses, 
			      @RequestParam("desired_wage") String desired_wage,
			      @RequestParam("cctv") String cctv
		){
			ses.setAttribute("desired_wage" ,desired_wage);
			ses.setAttribute("cctv" ,cctv);
			return "register/dbm/profileImage";
		}
		
		@RequestMapping(value="/dbm/profileImageOk")
		public String dbmProfileImageOk(HttpServletRequest req, HttpSession ses
				) {
			String path = ses.getServletContext().getRealPath("/upload");
			// 파일 업로드를 하기위해서 req에서 MultipartHttpServletRequest 를 생성한다.
			MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
			
			// mr에서 MultipartFile객체를 얻어온다.	-> List
			List<MultipartFile> files = mr.getFiles("pic");
			
			//파일명을 저장할 변수
			String fileNames[] = new String[files.size()]; 
			int idx = 0;
			
			if(files!=null) { //첨부파일이 있을 때
				for(int i=0;i<files.size();i++) { //for 111
					MultipartFile mf = files.get(i);
					System.out.println("files.get==>" + files.get(i));
					String fName = mf.getOriginalFilename();// 폼의 파일명 얻어오기
					if(fName!=null && !fName.equals("")) {
						String oriFileName = fName.substring(0, fName.lastIndexOf("."));// 원파일의 앞부분
						String oriExt = fName.substring(fName.lastIndexOf(".")+1);//확장자
						// 이름을 바꿔야 한다.
						File f = new File(path, fName); // 
						if(f.exists()) { // 원래 파일객체가 서버에 있으면 실행
							for(int renameNum=1;;renameNum++) { //1,2,3,4,5,6...
								// 변경된 파일명
								String renameFile = oriFileName+renameNum+"."+oriExt;
								f = new File(path, renameFile);
								if(!f.exists()) { // 파일이 있으면 true 없으면 false
									fName = renameFile; 
									break;
								}
							}
						}
						try {
							mf.transferTo(f);
						}catch(Exception e) {}
						fileNames[idx++] = fName;
					}
				}//for 111
			}
			for(int i=0; i<fileNames.length; i++) {
				ses.setAttribute("pic", fileNames[i]);
			}
			
			return "register/dbm/introduce";
		}
		
		// 돌봄몬 - 간단 자기소개입력 폼 >>
		@RequestMapping(value="/dbm/introduce", method = RequestMethod.POST)
		public String dbmIntroduce(
			      @RequestParam("pic") MultipartFile pic,
			      HttpServletRequest req
				) {
			HttpSession ses = req.getSession();
			
			String path = ses.getServletContext().getRealPath("/upload");
			System.out.println("path = " + path);
			String fileParamName1 = pic.getName();//폼의 파일첨부 객체 변수
			String oriFileName1 = pic.getOriginalFilename();// 원래 파일명
			System.out.println("getName() == > " + fileParamName1 + ", " + "getOriginaleFilename() == >"+oriFileName1);
			
			try {
				if(oriFileName1!=null) {
					pic.transferTo(new File(path, oriFileName1));//실제 파일업로드 발생 
				}
			}catch(IOException ie) {
				ie.printStackTrace();
			}
			ses.setAttribute("pic", oriFileName1);
			
			return "register/dbm/introduce";
		}

}





















