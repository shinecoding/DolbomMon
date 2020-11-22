package com.dolbommon.dbmon.message;

public class PagingVO {
	private int nowPage=1; //현재페이지
	private int totalRecord; //총레코드수
	private int totalPage; //총페이지수
	private int onePageRecord=11; //한페이지 레코드수
	private int onepageNumCount=5; //한번에 표시할 페이지번호수
	private int startPageNum=1; //페이지 번호 시작위치
	private int lastPageRecordCount=11; //마지막 페이지의 레코드수
	private String searchKey; //검색키
	private String searchWord; //검색어
	
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
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
	
	
}
