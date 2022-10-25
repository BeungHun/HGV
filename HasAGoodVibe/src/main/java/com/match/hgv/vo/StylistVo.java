package com.match.hgv.vo;

public class StylistVo {

	private int stylist_no; 
	private int member_no;
	
	public StylistVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public StylistVo(int stylist_no, int member_no) {
		super();
		this.stylist_no = stylist_no;
		this.member_no = member_no;
	}
	
	public int getStylist_no() {
		return stylist_no;
	}
	public void setStylist_no(int stylist_no) {
		this.stylist_no = stylist_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	
	
}
