package com.match.hgv.vo;

import java.util.Date;

public class NoticeVo {
	int notice_no;
	int admin_no;
	String notice_category;
	String notice_title;
	String notice_content;
	Date notice_writedate;
	
	public NoticeVo() {
		super();
	}

	public NoticeVo(int notice_no, int admin_no, String notice_category, String notice_title, String notice_content,
			Date notice_writedate) {
		super();
		this.notice_no = notice_no;
		this.admin_no = admin_no;
		this.notice_category = notice_category;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.notice_writedate = notice_writedate;
	}

	public int getNotice_no() {
		return notice_no;
	}

	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}

	public int getAdmin_no() {
		return admin_no;
	}

	public void setAdmin_no(int admin_no) {
		this.admin_no = admin_no;
	}

	public String getNotice_category() {
		return notice_category;
	}

	public void setNotice_category(String notice_category) {
		this.notice_category = notice_category;
	}

	public String getNotice_title() {
		return notice_title;
	}

	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}

	public String getNotice_content() {
		return notice_content;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}

	public Date getNotice_writedate() {
		return notice_writedate;
	}

	public void setNotice_writedate(Date notice_writedate) {
		this.notice_writedate = notice_writedate;
	}
	
	
}
