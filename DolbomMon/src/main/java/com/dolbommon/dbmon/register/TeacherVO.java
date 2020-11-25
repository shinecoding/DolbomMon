package com.dolbommon.dbmon.register;

public class TeacherVO {
	private String userid;
	private String care_type; 
	private String activity_type;// 원하는 돌봄유형
	private String child_age; // 돌봄가능연령 
	private String desired_wage; // 희망시급
	private String intro;
	private String cctv;
	private String pic;
	/*
	 * 		안 넣은 테이블 
	 * 		순위 지역 
	 * 		프로필 사진
	 *  	인증확인
	 * 
	 * */
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getActivity_type() {
		return activity_type;
	}
	public void setActivity_type(String activity_type) {
		this.activity_type = activity_type;
	}
	public String getCare_type() {
		return care_type;
	}
	public void setCare_type(String care_type) {
		this.care_type = care_type;
	}
	public String getChild_age() {
		return child_age;
	}
	public void setChild_age(String child_age) {
		this.child_age = child_age;
	}
	public String getDesired_wage() {
		return desired_wage;
	}
	public void setDesired_wage(String desired_wage) {
		this.desired_wage = desired_wage;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getCctv() {
		return cctv;
	}
	public void setCctv(String cctv) {
		this.cctv = cctv;
	}
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
}
