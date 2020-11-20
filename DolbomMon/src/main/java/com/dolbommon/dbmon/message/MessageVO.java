package com.dolbommon.dbmon.message;

public class MessageVO {
	private int no;
	private String userid_w;
	private String userid_r;
	private String subject;
	private String content;
	private String writedate;
	private String message_check;
	private String message_save;
	private String spam;
	
	public MessageVO() {}
	
	public MessageVO(int no, String userid_w, String userid_r, String content) {
		this.no = no;
		this.userid_w = userid_w;
		this.userid_r = userid_r;
		this.content = content;
	}
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getUserid_w() {
		return userid_w;
	}
	public void setUserid_w(String userid_w) {
		this.userid_w = userid_w;
	}
	public String getUserid_r() {
		return userid_r;
	}
	public void setUserid_r(String userid_r) {
		this.userid_r = userid_r;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
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
	public String getMessage_check() {
		return message_check;
	}
	public void setMessage_check(String message_check) {
		this.message_check = message_check;
	}
	public String getMessage_save() {
		return message_save;
	}
	public void setMessage_save(String message_save) {
		this.message_save = message_save;
	}
	public String getSpam() {
		return spam;
	}
	public void setSpam(String spam) {
		this.spam = spam;
	}
	
	
	
}
