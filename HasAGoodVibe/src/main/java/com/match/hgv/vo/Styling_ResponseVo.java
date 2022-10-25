package com.match.hgv.vo;

import java.util.Date;

public class Styling_ResponseVo {
	
	private int styling_no;
	private int order_no;
	private String styling_content;
	private Date styling_date;
	
	public Styling_ResponseVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Styling_ResponseVo(int styling_no, int order_no, String styling_content, Date styling_date) {
		super();
		this.styling_no = styling_no;
		this.order_no = order_no;
		this.styling_content = styling_content;
		this.styling_date = styling_date;
	}
	public int getStyling_no() {
		return styling_no;
	}
	public void setStyling_no(int styling_no) {
		this.styling_no = styling_no;
	}
	public int getOrder_no() {
		return order_no;
	}
	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}
	public String getStyling_content() {
		return styling_content;
	}
	public void setStyling_content(String styling_content) {
		this.styling_content = styling_content;
	}
	public Date getStyling_date() {
		return styling_date;
	}
	public void setStyling_date(Date styling_date) {
		this.styling_date = styling_date;
	}
}