package com.match.hgv.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class AttendVo {
	
	private int attend_no ;
	private int member_no;
	private int attend_count;
	@DateTimeFormat (pattern = "yyyy-MM-dd")
	private Date attend_date;
	private String attend_comment;
	
	public AttendVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AttendVo(int attend_no, int member_no, int attend_count, Date attend_date, String attend_comment) {
		super();
		this.attend_no = attend_no;
		this.member_no = member_no;
		this.attend_count = attend_count;
		this.attend_date = attend_date;
		this.attend_comment = attend_comment;
	}
	public int getAttend_no() {
		return attend_no;
	}
	public void setAttend_no(int attend_no) {
		this.attend_no = attend_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public int getAttend_count() {
		return attend_count;
	}
	public void setAttend_count(int attend_count) {
		this.attend_count = attend_count;
	}
	public Date getAttend_date() {
		return attend_date;
	}
	public void setAttend_date(Date attend_date) {
		this.attend_date = attend_date;
	}
	public String getAttend_comment() {
		return attend_comment;
	}
	public void setAttend_comment(String attend_comment) {
		this.attend_comment = attend_comment;
	}
}
