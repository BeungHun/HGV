package com.match.hgv.vo;

public class NoticeFileInfoVo {

	int notice_file_no;
	int notice_no;
	String notice_file_link;
	String notice_file_originalName;
	
	public NoticeFileInfoVo() {
		super();
	}

	public NoticeFileInfoVo(int notice_file_no, int notice_no, String notice_file_link, String notice_file_originalName) {
		super();
		this.notice_file_no = notice_file_no;
		this.notice_no = notice_no;
		this.notice_file_link = notice_file_link;
		this.notice_file_originalName = notice_file_originalName;
	}

	public int getNotice_file_no() {
		return notice_file_no;
	}

	public void setNotice_file_no(int notice_file_no) {
		this.notice_file_no = notice_file_no;
	}

	public int getNotice_no() {
		return notice_no;
	}

	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}

	public String getNotice_file_link() {
		return notice_file_link;
	}

	public void setNotice_file_link(String notice_file_link) {
		this.notice_file_link = notice_file_link;
	}

	public String getNotice_file_originalName() {
		return notice_file_originalName;
	}

	public void setNotice_file_originalName(String notice_file_originalName) {
		this.notice_file_originalName = notice_file_originalName;
	}
	
	
}
