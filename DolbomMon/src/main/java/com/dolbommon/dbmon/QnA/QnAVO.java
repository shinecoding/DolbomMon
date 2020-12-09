package com.dolbommon.dbmon.QnA;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class QnAVO {
	private int no;
	private String subject;
	private String userid;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date writedate;
	private String content;
	private int hit;
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
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public Date getWritedate() {
		return writedate;
	}
	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	@Override

	public String toString() {

	return "QnAVO [no=" + no + ", subject=" + subject + ", content=" + content + ", writedate=" + writedate

	+ ", hit=" + hit+ ", userid=" + userid + "]";

	}
}
