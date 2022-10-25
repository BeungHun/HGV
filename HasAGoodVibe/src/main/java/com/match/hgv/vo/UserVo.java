package com.match.hgv.vo;

public class UserVo {

	private int user_no;
	private int member_no;
	private int user_heigth;
	private int user_weight;
	private int user_top;
	private int user_bottom;
	private int user_shoes;
	
	public UserVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public UserVo(int user_no, int member_no, int user_heigth, int user_weight, int user_top, int user_bottom,
			int user_shoes) {
		super();
		this.user_no = user_no;
		this.member_no = member_no;
		this.user_heigth = user_heigth;
		this.user_weight = user_weight;
		this.user_top = user_top;
		this.user_bottom = user_bottom;
		this.user_shoes = user_shoes;
	}
	
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public int getUser_heigth() {
		return user_heigth;
	}
	public void setUser_heigth(int user_heigth) {
		this.user_heigth = user_heigth;
	}
	public int getUser_weight() {
		return user_weight;
	}
	public void setUser_weight(int user_weight) {
		this.user_weight = user_weight;
	}
	public int getUser_top() {
		return user_top;
	}
	public void setUser_top(int user_top) {
		this.user_top = user_top;
	}
	public int getUser_bottom() {
		return user_bottom;
	}
	public void setUser_bottom(int user_bottom) {
		this.user_bottom = user_bottom;
	}
	public int getUser_shoes() {
		return user_shoes;
	}
	public void setUser_shoes(int user_shoes) {
		this.user_shoes = user_shoes;
	}
	
}
