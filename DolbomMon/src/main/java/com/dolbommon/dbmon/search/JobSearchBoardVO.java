package com.dolbommon.dbmon.search;

public class JobSearchBoardVO {
	//구직리스트(돌봄몬찾기) 
	//private String insurance; //보험여부
	private int no; //선생님리스트글번호
	private String userid; //선생님아이디
	private String username; //선생님 이름
	private int age; //선생님 나이
	private String zone; //지역
	private int wage; //시급
	private String t_date; //날짜
	private String type; //활동유형
	private String situation; //상태
	private String content; //내용
	private int headcount; //인원수
	private String discussion; //협의유무
	private int hit; //조회수
	
//	public String getInsurance() {
//		return insurance;
//	}
//	public void setInsurance(String insurance) {
//		this.insurance = insurance;
//	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getZone() {
		return zone;
	}
	public void setZone(String zone) {
		this.zone = zone;
	}
	public int getWage() {
		return wage;
	}
	public void setWage(int wage) {
		this.wage = wage;
	}
	public String getT_date() {
		return t_date;
	}
	public void setT_date(String t_date) {
		this.t_date = t_date;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getSituation() {
		return situation;
	}
	public void setSituation(String situation) {
		this.situation = situation;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getHeadcount() {
		return headcount;
	}
	public void setHeadcount(int headcount) {
		this.headcount = headcount;
	}
	public String getDiscussion() {
		return discussion;
	}
	public void setDiscussion(String discussion) {
		this.discussion = discussion;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	
	
}
