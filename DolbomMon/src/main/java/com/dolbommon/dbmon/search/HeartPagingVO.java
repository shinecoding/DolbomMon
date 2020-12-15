package com.dolbommon.dbmon.search;

public class HeartPagingVO {

	private int nowPage=1; //현재 페이지
	private int totalRecord=1; //총레코드수
	private int totalPage; //총페이지수
	private int onePageRecord=5; //한 페이지에 표시할 레코드 수
	private int onePageNumCount=5; //한번에 표시할 페이지 번호 숫자 
	private int startPageNum = 1; //페이지 번호의 시작페이지
	private int currentPageRecord=nowPage*onePageRecord;
	private int lastPageRecordCount = 10; //마지막페이지의 선택 레코드 수
	
	public HeartPagingVO() {}
	
	
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
		
		currentPageRecord = nowPage * onePageRecord;
		//시작페이지 번호 계산
		startPageNum = (nowPage-1)/onePageNumCount* onePageNumCount+1;
	}
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
		totalPage = (int)Math.ceil((double)totalRecord/onePageRecord);
		if(nowPage==totalPage && totalRecord%onePageRecord!=0) { //마지막페이지인데 레코드 수가 적으면
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
		//총페이지수 구하기
		totalPage = (int)Math.ceil(totalRecord /(double)onePageRecord);
	}
	public int getOnePageRecord() {
		return onePageRecord;
	}
	public void setOnePageRecord(int onePageRecord) {
		this.onePageRecord = onePageRecord;
	}
	public int getOnePageNumCount() {
		return onePageNumCount;
	}
	public void setOnePageNumCount(int onePageNumCount) {
		this.onePageNumCount = onePageNumCount;
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


	public int getCurrentPageRecord() {
		return currentPageRecord;
	}


	public void setCurrentPageRecord(int currentPageRecord) {
		this.currentPageRecord = currentPageRecord;
	}
	
	
}
