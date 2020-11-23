package com.dolbommon.dbmon.message;

public class MessageVO {
	private int no;
	private String userid; //현재접속자
	private String userid_w;
	private String userid_r;
	private String subject;
	private String content;
	private String writedate;
	private String message_check;
	private String message_save;
	private String spam;
	private String tabType;

	
	
	//======================페이징
	
	private int nowPage=1; //현재페이지
	private int totalRecord; //총레코드수
	private int totalPage; //총페이지수
	private int onePageRecord=10; //한페이지 레코드수
	private int onepageNumCount=5; //한번에 표시할 페이지번호수
	private int startPageNum=1; //페이지 번호 시작위치
	private int currentPageRecord=nowPage*onePageRecord;
	private int lastPageRecordCount=10; //마지막 페이지의 레코드수
	private String searchKey; //검색키
	private String searchWord; //검색어

	public MessageVO() {}
	
	public MessageVO(int no, String userid_w, String userid_r, String content) {
		this.no = no;
		this.userid_w = userid_w;
		this.userid_r = userid_r;
		this.content = content;
	}
	
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
		currentPageRecord = nowPage * onePageRecord;
		startPageNum = (nowPage-1)/onepageNumCount*onepageNumCount+1;
	}
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
		
		//총페이지수
		totalPage=(int)Math.ceil((double)totalRecord/onePageRecord);
		//마지막페이지레코드수
		if(nowPage==totalPage && totalRecord%onePageRecord!=0) {
			lastPageRecordCount = totalRecord%onePageRecord;
		}else {
			lastPageRecordCount = onePageRecord;
		}
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getOnePageRecord() {
		return onePageRecord;
	}

	public void setOnePageRecord(int onePageRecord) {
		this.onePageRecord = onePageRecord;
	}

	public int getOnepageNumCount() {
		return onepageNumCount;
	}

	public void setOnepageNumCount(int onepageNumCount) {
		this.onepageNumCount = onepageNumCount;
	}

	public int getStartPageNum() {
		return startPageNum;
	}

	public void setStartPageNum(int startPageNum) {
		this.startPageNum = startPageNum;
	}

	public int getLastPageRecordCount() {
		return lastPageRecordCount;
	}

	public void setLastPageRecordCount(int lastPageRecordCount) {
		this.lastPageRecordCount = lastPageRecordCount;
	}

	public String getSearchKey() {
		return searchKey;
	}

	public void setSearchKey(String searchKey) {
		this.searchKey = searchKey;
	}

	public String getSearchWord() {
		return searchWord;
	}

	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
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

	public String getTabType() {
		return tabType;
	}

	public void setTabType(String tabType) {
		this.tabType = tabType;
	}

	public int getCurrentPageRecord() {
		return currentPageRecord;
	}

	public void setCurrentPageRecord(int currentPageRecord) {
		this.currentPageRecord = currentPageRecord;
	}
	
	
	
}
