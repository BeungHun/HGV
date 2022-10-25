package com.match.hgv.vo;

import java.util.Date;

public class Styling_ReviewVo {
	private int styling_review_no;
	private int styling_no;
	private double styling_review_starRatring;
	private String styling_review_content;
	private Date styling_review_date;
	
	public Styling_ReviewVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Styling_ReviewVo(int styling_review_no, int styling_no, double styling_review_starRatring,
			String styling_review_content, Date styling_review_date) {
		super();
		this.styling_review_no = styling_review_no;
		this.styling_no = styling_no;
		this.styling_review_starRatring = styling_review_starRatring;
		this.styling_review_content = styling_review_content;
		this.styling_review_date = styling_review_date;
	}
	public int getStyling_review_no() {
		return styling_review_no;
	}
	public void setStyling_review_no(int styling_review_no) {
		this.styling_review_no = styling_review_no;
	}
	public int getStyling_no() {
		return styling_no;
	}
	public void setStyling_no(int styling_no) {
		this.styling_no = styling_no;
	}
	public double getStyling_review_starRatring() {
		return styling_review_starRatring;
	}
	public void setStyling_review_starRatring(double styling_review_starRatring) {
		this.styling_review_starRatring = styling_review_starRatring;
	}
	public String getStyling_review_content() {
		return styling_review_content;
	}
	public void setStyling_review_content(String styling_review_content) {
		this.styling_review_content = styling_review_content;
	}
	public Date getStyling_review_date() {
		return styling_review_date;
	}
	public void setStyling_review_date(Date styling_review_date) {
		this.styling_review_date = styling_review_date;
	}
	
	
}
