package com.match.hgv.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class QandABoardVo {

	private int qAndABoard_no;
	private int member_no;
	private String qAndABoard_title;
	private String qAndABoard_content;
	private int qAndABoard_readcount;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date qAndABoard_writedate;
	public QandABoardVo() {
		super();
	}
	public QandABoardVo(int qAndABoard_no, int member_no, String qAndABoard_title, String qAndABoard_content,
			int qAndABoard_readcount, Date qAndABoard_writedate) {
		super();
		this.qAndABoard_no = qAndABoard_no;
		this.member_no = member_no;
		this.qAndABoard_title = qAndABoard_title;
		this.qAndABoard_content = qAndABoard_content;
		this.qAndABoard_readcount = qAndABoard_readcount;
		this.qAndABoard_writedate = qAndABoard_writedate;
	}
	public int getqAndABoard_no() {
		return qAndABoard_no;
	}
	public void setqAndABoard_no(int qAndABoard_no) {
		this.qAndABoard_no = qAndABoard_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public String getqAndABoard_title() {
		return qAndABoard_title;
	}
	public void setqAndABoard_title(String qAndABoard_title) {
		this.qAndABoard_title = qAndABoard_title;
	}
	public String getqAndABoard_content() {
		return qAndABoard_content;
	}
	public void setqAndABoard_content(String qAndABoard_content) {
		this.qAndABoard_content = qAndABoard_content;
	}
	public int getqAndABoard_readcount() {
		return qAndABoard_readcount;
	}
	public void setqAndABoard_readcount(int qAndABoard_readcount) {
		this.qAndABoard_readcount = qAndABoard_readcount;
	}
	public Date getqAndABoard_writedate() {
		return qAndABoard_writedate;
	}
	public void setqAndABoard_writedate(Date qAndABoard_writedate) {
		this.qAndABoard_writedate = qAndABoard_writedate;
	}
	
}
