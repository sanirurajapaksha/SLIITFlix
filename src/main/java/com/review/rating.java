package com.review;

public class rating {
	private int review_id;
	private int content_id;
	private int user_id;
	private String rating;
	private String review_title;
	private String recommendation;
	private String review_tags;
	private String spoiler_alert;
	private String review_text;
	private String review_date;
	
	public rating() {
		
	}
	
	public rating(int review_id, int content_id, int user_id, String rating, String review_title, String recommendation,
			String review_tags, String spoiler_alert,String review_text, String review_date) {
		super();
		this.review_id = review_id;
		this.content_id = content_id;
		this.user_id = user_id;
		this.rating = rating;
		this.review_title = review_title;
		this.recommendation = recommendation;
		this.review_tags = review_tags;
		this.spoiler_alert = spoiler_alert;
		this.review_text=review_text;
		this.review_date = review_date;
	}

	
	
	public int getReview_id() {
		return review_id;
	}

	public void setReview_id(int review_id) {
		this.review_id = review_id;
	}

	public int getContent_id() {
		return content_id;
	}

	public void setContent_id(int content_id) {
		this.content_id = content_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getRating() {
		return rating;
	}

	public void setRating(String rating) {
		this.rating = rating;
	}

	public String getReview_title() {
		return review_title;
	}

	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}

	public String getRecommendation() {
		return recommendation;
	}

	public void setRecommendation(String recommendation) {
		this.recommendation = recommendation;
	}

	public String getReview_tags() {
		return review_tags;
	}

	public void setReview_tags(String review_tags) {
		this.review_tags = review_tags;
	}

	public String getSpoiler_alert() {
		return spoiler_alert;
	}

	public void setSpoiler_alert(String spoiler_alert) {
		this.spoiler_alert = spoiler_alert;
	}
	public String getreview_text() {
		return review_text;
	}

	public void setreview_text(String review_text) {
		this.review_text = review_text;
	}
	
	public String getReview_date() {
		return review_date;
	}

	public void setReview_date(String review_date) {
		this.review_date = review_date;
	}
	
	
	}
