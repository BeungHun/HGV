package com.match.hgv.vo;

import java.util.Date;

public class UserCardBookMarkVo {
	
	private int user_card_bookmark_no;
	private int stylist_card_no;
	private int user_no;
	private Date user_card_bookmark_date;
	
	public UserCardBookMarkVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public UserCardBookMarkVo(int user_card_bookmark_no, int stylist_card_no, int user_no, Date user_card_bookmark_date) {
		super();
		this.user_card_bookmark_no = user_card_bookmark_no;
		this.stylist_card_no = stylist_card_no;
		this.user_no = user_no;
		this.user_card_bookmark_date = user_card_bookmark_date;
	}
	public int getUser_card_bookmark_no() {
		return user_card_bookmark_no;
	}
	public void setUser_card_bookmark_no(int user_card_bookmark_no) {
		this.user_card_bookmark_no = user_card_bookmark_no;
	}
	public int getStylist_card_no() {
		return stylist_card_no;
	}
	public void setStylist_card_no(int stylist_card_no) {
		this.stylist_card_no = stylist_card_no;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public Date getUser_card_bookmark_date() {
		return user_card_bookmark_date;
	}
	public void setUser_card_bookmark_date(Date user_card_bookmark_date) {
		this.user_card_bookmark_date = user_card_bookmark_date;
	}
}
