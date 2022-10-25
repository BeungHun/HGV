package com.match.hgv.vo;

import java.util.Date;

public class FreeBoardCommentVo {
	private int freeboard_comment_no;
	private int freeboard_no;
	private int member_no;
	private String freeboard_comment_content;
	private Date freeboard_comment_writedate;
	public FreeBoardCommentVo() {
		super();
	}
	public FreeBoardCommentVo(int freeboard_comment_no, int freeboard_no, int member_no,
			String freeboard_comment_content, Date freeboard_comment_writedate) {
		super();
		this.freeboard_comment_no = freeboard_comment_no;
		this.freeboard_no = freeboard_no;
		this.member_no = member_no;
		this.freeboard_comment_content = freeboard_comment_content;
		this.freeboard_comment_writedate = freeboard_comment_writedate;
	}
	public int getFreeboard_comment_no() {
		return freeboard_comment_no;
	}
	public void setFreeboard_comment_no(int freeboard_comment_no) {
		this.freeboard_comment_no = freeboard_comment_no;
	}
	public int getFreeboard_no() {
		return freeboard_no;
	}
	public void setFreeboard_no(int freeboard_no) {
		this.freeboard_no = freeboard_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public String getFreeboard_comment_content() {
		return freeboard_comment_content;
	}
	public void setFreeboard_comment_content(String freeboard_comment_content) {
		this.freeboard_comment_content = freeboard_comment_content;
	}
	public Date getFreeboard_comment_writedate() {
		return freeboard_comment_writedate;
	}
	public void setFreeboard_comment_writedate(Date freeboard_comment_writedate) {
		this.freeboard_comment_writedate = freeboard_comment_writedate;
	}
	
	
	
}
