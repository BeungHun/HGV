package com.match.hgv.vo;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class BlogCommentVo {
	private int comment_no;
	private int blog_no;
	private int member_no;
	private String comment_content;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date comment_writedate;
	private int comment_like;
	
	public BlogCommentVo() {
		super();
	}

	public BlogCommentVo(int comment_no, int blog_no, int member_no, String comment_content, Date comment_writedate,
			int comment_like) {
		super();
		this.comment_no = comment_no;
		this.blog_no = blog_no;
		this.member_no = member_no;
		this.comment_content = comment_content;
		this.comment_writedate = comment_writedate;
		this.comment_like = comment_like;
	}

	public int getComment_no() {
		return comment_no;
	}

	public void setComment_no(int comment_no) {
		this.comment_no = comment_no;
	}

	public int getBlog_no() {
		return blog_no;
	}

	public void setBlog_no(int blog_no) {
		this.blog_no = blog_no;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public String getComment_content() {
		return comment_content;
	}

	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}

	public Date getComment_writedate() {
		return comment_writedate;
	}

	public void setComment_writedate(Date comment_writedate) {
		this.comment_writedate = comment_writedate;
	}

	public int getComment_like() {
		return comment_like;
	}

	public void setComment_like(int comment_like) {
		this.comment_like = comment_like;
	}

	
	
}
