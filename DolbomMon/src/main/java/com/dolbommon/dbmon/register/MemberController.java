package com.dolbommon.dbmon.register;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;

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
import org.springframework.web.servlet.ModelAndView;

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
		public String join() {
			return "register/join";
		}
		
		// 선생님, 부모님 회원가입 폼
		@RequestMapping(value="/regForm", method=RequestMethod.POST)
		public ModelAndView regForm(@RequestParam("dbm_type") String dbm_type,
			      @RequestParam("child_age") String child_age,
			      @RequestParam("care_type") String care_type,
			      @RequestParam("yoil") String yoil,
			      @RequestParam("start_time") String start_time,
			      @RequestParam("end_time") String end_time,
			      @RequestParam("start_date") String start_date,
			      @RequestParam("end_date") String end_date,
			      @RequestParam("desired_wage") String desired_wage,
			      @RequestParam("cctv") String cctv,
			      @RequestParam("pic") String pic,
			      @RequestParam("intro") String intro
				) {
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("dbm_type" ,dbm_type);
			mav.addObject("child_age" ,child_age);
			mav.addObject("care_type" ,care_type);
			mav.addObject("yoil" ,yoil);
			mav.addObject("start_time" ,start_time);
			mav.addObject("end_time" ,end_time);
			mav.addObject("start_date" ,start_date);
			mav.addObject("end_date" ,end_date);
			mav.addObject("desired_wage" ,desired_wage);
			mav.addObject("cctv" ,cctv);
			mav.addObject("pic" ,pic);
			mav.addObject("intro" ,intro);
			
			mav.setViewName("register/regForm");
			return mav;
		}
				
		//회원가입 완료
		@RequestMapping(value="/regOk", method=RequestMethod.POST)
		public ModelAndView regOk(
				@RequestParam("userid") String userid,
				@RequestParam("userpwd") String userpwd,
				@RequestParam("email1") String email1,
				@RequestParam("email2") String email2,
				@RequestParam("tel1") String tel1,
				@RequestParam("zipcode") String zipcode,
				@RequestParam("addr") String addr,
				@RequestParam("addrdetail") String addrdetail,
			      
			    @RequestParam("dbm_type") String dbm_type,
			    @RequestParam("child_age") String child_age,
			    @RequestParam("care_type") String care_type,
			    @RequestParam("desired_wage") String desired_wage,
			    @RequestParam("cctv") String cctv,
			    @RequestParam("pic") String pic,
			    @RequestParam("intro") String intro,
			    
			    @RequestParam("yoil") String yoil,
			    @RequestParam("start_time") String start_time,
			    @RequestParam("end_time") String end_time,
			    @RequestParam("start_date") String start_date,
			    @RequestParam("end_date") String end_date,
			      
			HttpServletRequest req, MemberVO mVo, TeacherVO tVo, RegularDateVO rdVo) {
			mVo.setUserid(userid); mVo.setUserpwd(userpwd); mVo.setEmail1(email1); mVo.setEmail2(email2); mVo.setTel1(tel1); mVo.setZipcode(zipcode); mVo.setAddr(addr); mVo.setAddrdetail(addrdetail);
			tVo.setDbm_type(dbm_type);tVo.setChild_age(child_age);tVo.setCare_type(care_type);tVo.setDesired_wage(desired_wage);tVo.setCctv(cctv);tVo.setPic(pic);tVo.setIntro(intro);
			rdVo.setYoil(yoil);rdVo.setStart_time(start_time);rdVo.setEnd_time(end_time);rdVo.setStart_date(start_date);rdVo.setEnd_date(end_date);
			
			MemberDaoImp dao = sqlSession.getMapper(MemberDaoImp.class);
			ModelAndView mav = new ModelAndView();
			
			int result1 = dao.memberReg1(mVo);
			if(result1<0) { 
				System.out.println("member 테이블 삽입 실패");
				mav.setViewName("register/regForm");
				return mav;
			}else { // member 테이블 성공
				int result2 = dao.memberReg2(mVo, tVo);
				if(result2<0) {
					System.out.println("teacher 테이블 삽입 실패");
					dao.memberDelete(mVo);
					mav.setViewName("register/regForm");
					return mav;
				}else { // teacher 테이블 성공
					int result3 = dao.memberReg3(mVo, rdVo);
					if(result3<0) {
						System.out.println("regulardate 테이블 삽입 실패");
						dao.memberDelete(mVo);
						mav.setViewName("register/regForm");
						return mav;
					} else { // 다 성공
						mav.addObject("result", result3);
						mav.setViewName("login/loginForm");
						
						return mav;
					}
				}
			}
		}
		
		// SMS 인증창 
		@RequestMapping("/smsIdentity")
		public String smsIdentity() {
			return "register/sendSMS";
		}
		
		@RequestMapping(value = "/sendSms", method = RequestMethod.POST)
		@ResponseBody
		public String sendSms(HttpServletRequest request) throws Exception {

			String api_key = "NCSQ0VURJQQSSIOA";
			String api_secret = "JXF7YGYDKKIHGNGMCRJY5ABSZX5S8GII";

		    com.dolbommon.dbmon.register.Coolsms coolsms = new com.dolbommon.dbmon.register.Coolsms(api_key, api_secret);
		       
		    HashMap<String, String> set = new HashMap<String, String>();

		    set.put("to", (String)request.getParameter("to")); // 받는 사람
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
		@RequestMapping("/parent/children")
		public String children() {
			return "register/parent/children";
		}
		
		// 학부모 - 지역(시,군,구,동) 설정 
		@RequestMapping("/parent/location")
		public String parentLoaction() {
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
		@RequestMapping("/parent/description")
		public String parentDescription() {
			return "register/parent/description";
		}
		
		////////////////////////////// 돌봄몬 회원가입 시작 //////////////////////////////////
		
		// 돌봄몬 - 유형 선택(선생님, 대학생, 엄마, 일반)
		@RequestMapping("/dbm/dbmType")
		public String selectDbmType() {
			return "register/dbm/dbmType";
		}
		
		// 돌볼 수 있는 아이의 연령대와 가능한 활동
		@RequestMapping(value = "/dbm/activityAndAge", method = RequestMethod.POST)
		public ModelAndView dbmActivityAndAge(@RequestParam("dbm_type") String dbm_type) {
			
			ModelAndView mav = new ModelAndView();
			
			mav.addObject("dbm_type", dbm_type);
			mav.setViewName("register/dbm/activityAndAge");
			
			return mav;
		}
		
		// 돌봄몬 - 지역(시,군,구,동) 설정 
		@RequestMapping(value="/dbm/location", method = RequestMethod.POST)
		public ModelAndView dbmLoaction(@RequestParam("dbm_type") String dbm_type,
										@RequestParam("child_age") String child_age,
										@RequestParam("care_type") String care_type
		) {
			ModelAndView mav = new ModelAndView();
			mav.addObject("dbm_type" ,dbm_type);
			mav.addObject("child_age" ,child_age);
			mav.addObject("care_type" ,care_type);
			mav.setViewName("register/dbm/location");
			return mav;
		}
		
		// 돌봄몬 - 원하는 시간 입력
		@RequestMapping(value="/dbm/schedule", method = RequestMethod.POST)
		public ModelAndView dbmSchedule(@RequestParam("dbm_type") String dbm_type,
							      @RequestParam("child_age") String child_age,
							      @RequestParam("care_type") String care_type) {
			ModelAndView mav = new ModelAndView();
			mav.addObject("dbm_type" ,dbm_type);
			mav.addObject("child_age" ,child_age);
			mav.addObject("care_type" ,care_type);
			// 지역(시,군,구,동) 값 넘겨줘야 함 (미구현)
			mav.setViewName("register/dbm/schedule/schedule");
			return mav;
		}
		
		// 돌봄몬 - 원하는 시간 직접 입력하기
		@RequestMapping("/dbm/schedule/detail")
		public String dbmScheduleDetail() {
			return "register/dbm/schedule/detail";
		}
		
		// 돌봄몬 - 희망시급과 CCTV동의여부 
		@RequestMapping(value="/dbm/wantedPaymentAndCCTV", method = RequestMethod.POST)
		public ModelAndView dbmWantedPaymentAndCCTV(@RequestParam("dbm_type") String dbm_type,
			      @RequestParam("child_age") String child_age,
			      @RequestParam("care_type") String care_type,
			      @RequestParam("yoil") String yoil,
			      @RequestParam("start_time") String start_time,
			      @RequestParam("end_time") String end_time,
			      @RequestParam("start_date") String start_date,
			      @RequestParam("end_date") String end_date
		) {
			ModelAndView mav = new ModelAndView();
			mav.addObject("dbm_type" ,dbm_type);
			mav.addObject("child_age" ,child_age);
			mav.addObject("care_type" ,care_type);
			mav.addObject("yoil" ,yoil);
			mav.addObject("start_time" ,start_time);
			mav.addObject("end_time" ,end_time);
			mav.addObject("start_date" ,start_date);
			mav.addObject("end_date" ,end_date);
			mav.setViewName("register/dbm/wantedPaymentAndCCTV");
			return mav;
		}
		
		// 돌봄몬 - 프로필 사진 등록 폼
		@RequestMapping(value="/dbm/profileImage", method = RequestMethod.POST)
		public ModelAndView dbmProfileImage(@RequestParam("dbm_type") String dbm_type,
			      @RequestParam("child_age") String child_age,
			      @RequestParam("care_type") String care_type,
			      @RequestParam("yoil") String yoil,
			      @RequestParam("start_time") String start_time,
			      @RequestParam("end_time") String end_time,
			      @RequestParam("start_date") String start_date,
			      @RequestParam("end_date") String end_date,
			      @RequestParam("desired_wage") String desired_wage,
			      @RequestParam("cctv") String cctv
		){
			ModelAndView mav = new ModelAndView();
			mav.addObject("dbm_type" ,dbm_type);
			mav.addObject("child_age" ,child_age);
			mav.addObject("care_type" ,care_type);
			mav.addObject("yoil" ,yoil);
			mav.addObject("start_time" ,start_time);
			mav.addObject("end_time" ,end_time);
			mav.addObject("start_date" ,start_date);
			mav.addObject("end_date" ,end_date);
			mav.addObject("desired_wage" ,desired_wage);
			mav.addObject("cctv" ,cctv);
			mav.setViewName("register/dbm/profileImage");
			return mav;
		}
		
		// 돌봄몬 - 간단 자기소개입력 폼
		@RequestMapping(value="/dbm/introduce", method = RequestMethod.POST)
		public ModelAndView dbmIntroduce(@RequestParam("dbm_type") String dbm_type,
			      @RequestParam("child_age") String child_age,
			      @RequestParam("care_type") String care_type,
			      @RequestParam("yoil") String yoil,
			      @RequestParam("start_time") String start_time,
			      @RequestParam("end_time") String end_time,
			      @RequestParam("start_date") String start_date,
			      @RequestParam("end_date") String end_date,
			      @RequestParam("desired_wage") String desired_wage,
			      @RequestParam("cctv") String cctv,
			      @RequestParam("pic") MultipartFile pic,
			      HttpServletRequest req
				) {
			HttpSession ses = req.getSession();
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("dbm_type" ,dbm_type);
			mav.addObject("child_age" ,child_age);
			mav.addObject("care_type" ,care_type);
			mav.addObject("yoil" ,yoil);
			mav.addObject("start_time" ,start_time);
			mav.addObject("end_time" ,end_time);
			mav.addObject("start_date" ,start_date);
			mav.addObject("end_date" ,end_date);
			mav.addObject("desired_wage" ,desired_wage);
			mav.addObject("cctv" ,cctv);

			String path = ses.getServletContext().getRealPath("/profileImg");
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
			
			mav.addObject("pic" ,oriFileName1);
			
			mav.setViewName("register/dbm/introduce");
			return mav;
		}
}





















