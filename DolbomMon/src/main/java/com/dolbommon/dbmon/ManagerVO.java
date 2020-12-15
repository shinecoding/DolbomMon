package com.dolbommon.dbmon;

public class ManagerVO {
	private int no;
	private String userid;
	private String userpwd;
	private String manager_join_authority; //슈퍼유저
	private String member_inactivity_authority; //회원 비활성화 권한
	private String page_authority; //웹페이지 관리권한
	private String department;
	private String position;
	private String username;
	private String tel;
	private String regdate;
	private String email;
	
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
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
	public String getUserpwd() {
		return userpwd;
	}
	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}
	public String getManager_join_authority() {
		return manager_join_authority;
	}
	public void setManager_join_authority(String manager_join_authority) {
		this.manager_join_authority = manager_join_authority;
	}
	public String getMember_inactivity_authority() {
		return member_inactivity_authority;
	}
	public void setMember_inactivity_authority(String member_inactivity_authority) {
		this.member_inactivity_authority = member_inactivity_authority;
	}
	public String getPage_authority() {
		return page_authority;
	}
	public void setPage_authority(String page_authority) {
		this.page_authority = page_authority;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	
	
}
