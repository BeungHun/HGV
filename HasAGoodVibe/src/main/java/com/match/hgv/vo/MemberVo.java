package com.match.hgv.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class MemberVo {
	
	private int member_no;
	private String member_id;
	private String member_pw;
	private String member_nick;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date member_joindate;
	private String member_profileimage_link;
	private int member_cash;
	
	public MemberVo() {
		super();
	}

	public MemberVo(int member_no, String member_id, String member_pw, String member_nick, Date member_joindate,
			String member_profileimage_link, int member_cash) {
		super();
		this.member_no = member_no;
		this.member_id = member_id;
		this.member_pw = member_pw;
		this.member_nick = member_nick;
		this.member_joindate = member_joindate;
		this.member_profileimage_link = member_profileimage_link;
		this.member_cash = member_cash;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_pw() {
		return member_pw;
	}

	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}

	public String getMember_nick() {
		return member_nick;
	}

	public void setMember_nick(String member_nick) {
		this.member_nick = member_nick;
	}

	public Date getMember_joindate() {
		return member_joindate;
	}

	public void setMember_joindate(Date member_joindate) {
		this.member_joindate = member_joindate;
	}

	public String getMember_profileimage_link() {
		return member_profileimage_link;
	}

	public void setMember_profileimage_link(String member_profileimage_link) {
		this.member_profileimage_link = member_profileimage_link;
	}

	public int getMember_cash() {
		return member_cash;
	}

	public void setMember_cash(int member_cash) {
		this.member_cash = member_cash;
	}
	
	
}
