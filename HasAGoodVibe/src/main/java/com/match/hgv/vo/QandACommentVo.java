package com.match.hgv.vo;

import java.util.Date;

public class QandACommentVo {

	private int qAndAComment_no;
	private int qAndABoard_no;
	private int admin_no;
	private String qAndAComment_content;
	private Date qAndAComment_writedate;
	public QandACommentVo() {
		super();
	}
	public QandACommentVo(int qAndAComment_no, int qAndABoard_no, int admin_no, String qAndAComment_content,
			Date qAndAComment_writedate) {
		super();
		this.qAndAComment_no = qAndAComment_no;
		this.qAndABoard_no = qAndABoard_no;
		this.admin_no = admin_no;
		this.qAndAComment_content = qAndAComment_content;
		this.qAndAComment_writedate = qAndAComment_writedate;
	}
	public int getqAndAComment_no() {
		return qAndAComment_no;
	}
	public void setqAndAComment_no(int qAndAComment_no) {
		this.qAndAComment_no = qAndAComment_no;
	}
	public int getqAndABoard_no() {
		return qAndABoard_no;
	}
	public void setqAndABoard_no(int qAndABoard_no) {
		this.qAndABoard_no = qAndABoard_no;
	}
	public int getAdmin_no() {
		return admin_no;
	}
	public void setAdmin_no(int admin_no) {
		this.admin_no = admin_no;
	}
	public String getqAndAComment_content() {
		return qAndAComment_content;
	}
	public void setqAndAComment_content(String qAndAComment_content) {
		this.qAndAComment_content = qAndAComment_content;
	}
	public Date getqAndAComment_writedate() {
		return qAndAComment_writedate;
	}
	public void setqAndAComment_writedate(Date qAndAComment_writedate) {
		this.qAndAComment_writedate = qAndAComment_writedate;
	}
	
}
