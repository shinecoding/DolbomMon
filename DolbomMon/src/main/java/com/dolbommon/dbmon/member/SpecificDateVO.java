package com.dolbommon.dbmon.member;

public class SpecificDateVO {
	private int job_board_no;
	private String userid;
	private String select_date;
	private String start_time;
	private String end_time;
	
	public int getJob_board_no() {
		return job_board_no;
	}
	public void setJob_board_no(int job_board_no) {
		this.job_board_no = job_board_no;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getSelect_date() {
		return select_date;
	}
	public void setSelect_date(String select_date) {
		this.select_date = select_date;
	}
	public String getStart_time() {
		return start_time;
	}
	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}
	public String getEnd_time() {
		return end_time;
	}
	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}
	
}
