package com.match.hgv.vo;

import java.util.Date;

public class MemberFreezeVo {

	private int member_no;
	private String member_freezeOrNot;
	private Date member_canLoginDate;
	
	public MemberFreezeVo() {
		super();
	}

	public MemberFreezeVo(int member_no, String member_freezeOrNot, Date member_canLoginDate) {
		super();
		this.member_no = member_no;
		this.member_freezeOrNot = member_freezeOrNot;
		this.member_canLoginDate = member_canLoginDate;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public String getMember_freezeOrNot() {
		return member_freezeOrNot;
	}

	public void setMember_freezeOrNot(String member_freezeOrNot) {
		this.member_freezeOrNot = member_freezeOrNot;
	}

	public Date getMember_canLoginDate() {
		return member_canLoginDate;
	}

	public void setMember_canLoginDate(Date member_canLoginDate) {
		this.member_canLoginDate = member_canLoginDate;
	}
	
	
}
