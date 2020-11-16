package com.dolbommon.dbmon.register;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RegisterController {

		// 선생님, 부모님 회원가입 선택
		@RequestMapping("/join")
		public String join() {
			return "register/join";
		}
		
		// 선생님, 부모님 회원가입 폼
		@RequestMapping("/regForm")
		public String regForm() {
			return "register/regForm";
		}
		
		//////////////////////////// 학부모 회원가입 시작 /////////////////////////////////
		@RequestMapping("/parentJoinStart")
		public String joinParentStart() {
			return "register/parent/regForm";
		}
		
		// 원하는 돌봄선택, 선생님 나이선택
		@RequestMapping("/parent/activityAndAge")
		public String selectActivityAndAge() {
			return "register/parent/activityAndAge";
		}
		
		// 자녀 정보 입력
		@RequestMapping("/parent/children")
		public String children() {
			return "register/parent/children";
		}
		
		// 지역(시,군,구,동) 설정
		@RequestMapping("/location")
		public String loaction() {
			return "register/location";
		}
		
		// 학부모 - 원하는 시간 입력
		@RequestMapping("/parentSchedule")
		public String parentSchedule() {
			return "register/parent/schedule";
		}
		
		////////////////////////////// 돌봄몬 회원가입 시작 //////////////////////////////////
		@RequestMapping("/dbmJoinStart")
		public String joinDbmStart() {
			return "register/dbm/start";
		}
		
		// 우편코드 선택창
		@RequestMapping("/zipcodeSearch")
		public String zipcodeSearch() {
			
			return "register/zipcodeSearch";
		}
}
