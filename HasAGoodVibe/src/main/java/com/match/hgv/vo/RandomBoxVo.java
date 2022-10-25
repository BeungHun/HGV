package com.match.hgv.vo;

import java.util.Date;

public class RandomBoxVo {

	private int randomBox_no;
	private int member_no;
	private int stylist_no;
	private String randomBox_category;
	private String randomBox_title;
	private String randomBox_content;
	private int randomBox_price;
	private int randomBox_readcount;
	private String randomBox_state;
	private Date randomBox_writedate;
	public RandomBoxVo() {
		super();
	}
	public RandomBoxVo(int randomBox_no, int member_no, int stylist_no, String randomBox_category,
			String randomBox_title, String randomBox_content, int randomBox_price, int randomBox_readcount,
			String randomBox_state, Date randomBox_writedate) {
		super();
		this.randomBox_no = randomBox_no;
		this.member_no = member_no;
		this.stylist_no = stylist_no;
		this.randomBox_category = randomBox_category;
		this.randomBox_title = randomBox_title;
		this.randomBox_content = randomBox_content;
		this.randomBox_price = randomBox_price;
		this.randomBox_readcount = randomBox_readcount;
		this.randomBox_state = randomBox_state;
		this.randomBox_writedate = randomBox_writedate;
	}
	public int getRandomBox_no() {
		return randomBox_no;
	}
	public void setRandomBox_no(int randomBox_no) {
		this.randomBox_no = randomBox_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public int getStylist_no() {
		return stylist_no;
	}
	public void setStylist_no(int stylist_no) {
		this.stylist_no = stylist_no;
	}
	public String getRandomBox_category() {
		return randomBox_category;
	}
	public void setRandomBox_category(String randomBox_category) {
		this.randomBox_category = randomBox_category;
	}
	public String getRandomBox_title() {
		return randomBox_title;
	}
	public void setRandomBox_title(String randomBox_title) {
		this.randomBox_title = randomBox_title;
	}
	public String getRandomBox_content() {
		return randomBox_content;
	}
	public void setRandomBox_content(String randomBox_content) {
		this.randomBox_content = randomBox_content;
	}
	public int getRandomBox_price() {
		return randomBox_price;
	}
	public void setRandomBox_price(int randomBox_price) {
		this.randomBox_price = randomBox_price;
	}
	public int getRandomBox_readcount() {
		return randomBox_readcount;
	}
	public void setRandomBox_readcount(int randomBox_readcount) {
		this.randomBox_readcount = randomBox_readcount;
	}
	public String getRandomBox_state() {
		return randomBox_state;
	}
	public void setRandomBox_state(String randomBox_state) {
		this.randomBox_state = randomBox_state;
	}
	public Date getRandomBox_writedate() {
		return randomBox_writedate;
	}
	public void setRandomBox_writedate(Date randomBox_writedate) {
		this.randomBox_writedate = randomBox_writedate;
	}
	
}