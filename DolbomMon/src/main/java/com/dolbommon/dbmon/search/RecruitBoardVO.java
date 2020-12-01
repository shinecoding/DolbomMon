package com.dolbommon.dbmon.search;

public class RecruitBoardVO {
		//구인게시판
		private int jo_board_no; //구인글 번호
		private String userid; //아이디
		private String care_addr; //돌봄장소
		private String time_type; //돌봄시간유형
		private String pw_activity; //원하는 활동
		private int wish_wage; //희망시급
		private String consultation; //협의유무
		private int wish_age; //원하는 선생님나이
		private String wish_gender; //원하는 선생님 성별
		private String content; //요청사항
		private String writedate; //글 등록일
		private int hit; //조회수
		
		
		public int getJo_board_no() {
			return jo_board_no;
		}
		public void setJo_board_no(int job_board_no) {
			this.jo_board_no = job_board_no;
		}
		public String getUserid() {
			return userid;
		}
		public void setUserid(String userid) {
			this.userid = userid;
		}
		public String getCare_addr() {
			return care_addr;
		}
		public void setCare_addr(String care_addr) {
			this.care_addr = care_addr;
		}
		public String getTime_type() {
			return time_type;
		}
		public void setTime_type(String time_type) {
			this.time_type = time_type;
		}
		public String getPw_activity() {
			return pw_activity;
		}
		public void setPw_activity(String pw_activity) {
			this.pw_activity = pw_activity;
		}
		public int getWish_wage() {
			return wish_wage;
		}
		public void setWish_wage(int wish_wage) {
			this.wish_wage = wish_wage;
		}
		public String getConsultation() {
			return consultation;
		}
		public void setConsultation(String consultation) {
			this.consultation = consultation;
		}
		public int getWish_age() {
			return wish_age;
		}
		public void setWish_age(int wish_age) {
			this.wish_age = wish_age;
		}
		public String getWish_gender() {
			return wish_gender;
		}
		public void setWish_gender(String wish_gender) {
			this.wish_gender = wish_gender;
		}
		public String getContent() {
			return content;
		}
		public void setContent(String content) {
			this.content = content;
		}
		public String getWritedate() {
			return writedate;
		}
		public void setWritedate(String writedate) {
			this.writedate = writedate;
		}
		public int getHit() {
			return hit;
		}
		public void setHit(int hit) {
			this.hit = hit;
		}
		
	}


