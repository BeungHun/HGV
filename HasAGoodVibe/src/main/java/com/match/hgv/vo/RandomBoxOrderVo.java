package com.match.hgv.vo;

import java.util.Date;

public class RandomBoxOrderVo {

	private int randomBoxOrder_no;
	private int stylist_no;
	private int user_no;
	private int randomBox_no;
	private int post_no;
	private String randomBoxOrder_content;
	private int randomBoxOrder_heigth;
	private int randomBoxOrder_weight;
	private int randomBoxOrder_top;
	private int randomBoxOrder_bottom;
	private int randomBoxOrder_shoes;
	private Date randomBoxOrder_date;
	private String randomBoxOrder_state;
	
	public RandomBoxOrderVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public RandomBoxOrderVo(int randomBoxOrder_no, int stylist_no, int user_no, int randomBox_no, int post_no,
			String randomBoxOrder_content, int randomBoxOrder_heigth, int randomBoxOrder_weight, int randomBoxOrder_top,
			int randomBoxOrder_bottom, int randomBoxOrder_shoes, Date randomBoxOrder_date,
			String randomBoxOrder_state) {
		super();
		this.randomBoxOrder_no = randomBoxOrder_no;
		this.stylist_no = stylist_no;
		this.user_no = user_no;
		this.randomBox_no = randomBox_no;
		this.post_no = post_no;
		this.randomBoxOrder_content = randomBoxOrder_content;
		this.randomBoxOrder_heigth = randomBoxOrder_heigth;
		this.randomBoxOrder_weight = randomBoxOrder_weight;
		this.randomBoxOrder_top = randomBoxOrder_top;
		this.randomBoxOrder_bottom = randomBoxOrder_bottom;
		this.randomBoxOrder_shoes = randomBoxOrder_shoes;
		this.randomBoxOrder_date = randomBoxOrder_date;
		this.randomBoxOrder_state = randomBoxOrder_state;
	}
	public int getRandomBoxOrder_no() {
		return randomBoxOrder_no;
	}
	public void setRandomBoxOrder_no(int randomBoxOrder_no) {
		this.randomBoxOrder_no = randomBoxOrder_no;
	}
	public int getStylist_no() {
		return stylist_no;
	}
	public void setStylist_no(int stylist_no) {
		this.stylist_no = stylist_no;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public int getRandomBox_no() {
		return randomBox_no;
	}
	public void setRandomBox_no(int randomBox_no) {
		this.randomBox_no = randomBox_no;
	}
	public int getPost_no() {
		return post_no;
	}
	public void setPost_no(int post_no) {
		this.post_no = post_no;
	}
	public String getRandomBoxOrder_content() {
		return randomBoxOrder_content;
	}
	public void setRandomBoxOrder_content(String randomBoxOrder_content) {
		this.randomBoxOrder_content = randomBoxOrder_content;
	}
	public int getRandomBoxOrder_heigth() {
		return randomBoxOrder_heigth;
	}
	public void setRandomBoxOrder_heigth(int randomBoxOrder_heigth) {
		this.randomBoxOrder_heigth = randomBoxOrder_heigth;
	}
	public int getRandomBoxOrder_weight() {
		return randomBoxOrder_weight;
	}
	public void setRandomBoxOrder_weight(int randomBoxOrder_weight) {
		this.randomBoxOrder_weight = randomBoxOrder_weight;
	}
	public int getRandomBoxOrder_top() {
		return randomBoxOrder_top;
	}
	public void setRandomBoxOrder_top(int randomBoxOrder_top) {
		this.randomBoxOrder_top = randomBoxOrder_top;
	}
	public int getRandomBoxOrder_bottom() {
		return randomBoxOrder_bottom;
	}
	public void setRandomBoxOrder_bottom(int randomBoxOrder_bottom) {
		this.randomBoxOrder_bottom = randomBoxOrder_bottom;
	}
	public int getRandomBoxOrder_shoes() {
		return randomBoxOrder_shoes;
	}
	public void setRandomBoxOrder_shoes(int randomBoxOrder_shoes) {
		this.randomBoxOrder_shoes = randomBoxOrder_shoes;
	}
	public Date getRandomBoxOrder_date() {
		return randomBoxOrder_date;
	}
	public void setRandomBoxOrder_date(Date randomBoxOrder_date) {
		this.randomBoxOrder_date = randomBoxOrder_date;
	}
	public String getRandomBoxOrder_state() {
		return randomBoxOrder_state;
	}
	public void setRandomBoxOrder_state(String randomBoxOrder_state) {
		this.randomBoxOrder_state = randomBoxOrder_state;
	}
	
}
