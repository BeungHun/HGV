package com.match.hgv.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class FriendVo {
	private int friend_no;
	private int member_no;
	private int bfmember_no;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date friend_addDate;
	
	public FriendVo() {
		super();
	}

	public FriendVo(int friend_no, int member_no, int bfmember_no, Date friend_addDate) {
		super();
		this.friend_no = friend_no;
		this.member_no = member_no;
		this.bfmember_no = bfmember_no;
		this.friend_addDate = friend_addDate;
	}

	public int getFriend_no() {
		return friend_no;
	}

	public void setFriend_no(int friend_no) {
		this.friend_no = friend_no;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public int getBfmember_no() {
		return bfmember_no;
	}

	public void setBfmember_no(int bfmember_no) {
		this.bfmember_no = bfmember_no;
	}

	public Date getFriend_addDate() {
		return friend_addDate;
	}

	public void setFriend_addDate(Date friend_addDate) {
		this.friend_addDate = friend_addDate;
	}
	
	
}
