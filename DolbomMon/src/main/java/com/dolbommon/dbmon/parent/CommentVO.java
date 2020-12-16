package com.dolbommon.dbmon.parent;

public class CommentVO {

	private String userid;
	private String reviewid;
	private String review_content;
	private String review_star;
	private int sum_star;
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getReviewid() {
		return reviewid;
	}
	public void setReviewid(String reviewid) {
		this.reviewid = reviewid;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	
	public String getReview_star() {
		return review_star;
	}
	public void setReview_star(String review_star) {
		this.review_star = review_star;
	}
	public int getSum_star() {
		return sum_star;
	}
	public void setSum_star(int sum_star) {
		this.sum_star = sum_star;
	}
}
