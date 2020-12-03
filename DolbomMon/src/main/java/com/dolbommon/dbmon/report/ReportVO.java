package com.dolbommon.dbmon.report;

public class ReportVO {
	private String shingo_no;
	private String userid; //신고자아이디
	private String shingo_reason;
	private String shingo_date;
	private String shingo_detail;
	private String shingo_id; //신고당한 아이디
	private String shingo_status; //신고처리상태
	private String shingo_response; //신고 답변메시지
	private String shingo_name;
	private String firstName;
	private String lastName;
	
	public String getShingo_no() {
		return shingo_no;
	}
	public void setShingo_no(String shingo_no) {
		this.shingo_no = shingo_no;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getShingo_reason() {
		return shingo_reason;
	}
	public void setShingo_reason(String shingo_reason) {
		this.shingo_reason = shingo_reason;
	}
	public String getShingo_date() {
		return shingo_date;
	}
	public void setShingo_date(String shingo_date) {
		this.shingo_date = shingo_date;
	}
	public String getShingo_detail() {
		return shingo_detail;
	}
	public void setShingo_detail(String shingo_detail) {
		this.shingo_detail = shingo_detail;
	}
	public String getShingo_id() {
		return shingo_id;
	}
	public void setShingo_id(String shingo_id) {
		this.shingo_id = shingo_id;
	}
	public String getShingo_status() {
		return shingo_status;
	}
	public void setShingo_status(String shingo_status) {
		this.shingo_status = shingo_status;
	}
	public String getShingo_response() {
		return shingo_response;
	}
	public void setShingo_response(String shingo_response) {
		this.shingo_response = shingo_response;
	}
	
	public String getShingo_name() {
		return shingo_name;
	}
	public void setShingo_name(String shingo_name) {
		this.shingo_name = shingo_name;
		firstName = shingo_name.substring(0, 1);
		lastName = shingo_name.substring(shingo_name.length()-1);
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	
	
}
