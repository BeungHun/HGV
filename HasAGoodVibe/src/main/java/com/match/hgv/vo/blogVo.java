package com.match.hgv.vo;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class blogVo {
	
		private int blog_no;
		private int stylist_no;
		private int c_no;
		private String blog_title;
		private String blog_content;
		//@DateTimeFormat(pattern = "yyyy-MM-dd")
		private Date blog_writedate;
		private int blog_readCount;
		private int blog_like;
		private String main_board;
		
		
		public blogVo() {
			super();
		}


		public blogVo(int blog_no, int stylist_no, int c_no, String blog_title, String blog_content,
				Date blog_writedate, int blog_readCount, int blog_like, String main_board) {
			super();
			this.blog_no = blog_no;
			this.stylist_no = stylist_no;
			this.c_no = c_no;
			this.blog_title = blog_title;
			this.blog_content = blog_content;
			this.blog_writedate = blog_writedate;
			this.blog_readCount = blog_readCount;
			this.blog_like = blog_like;
			this.main_board = main_board;
		}


		public int getBlog_no() {
			return blog_no;
		}


		public void setBlog_no(int blog_no) {
			this.blog_no = blog_no;
		}


		public int getStylist_no() {
			return stylist_no;
		}


		public void setStylist_no(int stylist_no) {
			this.stylist_no = stylist_no;
		}


		public int getC_no() {
			return c_no;
		}


		public void setC_no(int c_no) {
			this.c_no = c_no;
		}


		public String getBlog_title() {
			return blog_title;
		}


		public void setBlog_title(String blog_title) {
			this.blog_title = blog_title;
		}


		public String getBlog_content() {
			return blog_content;
		}


		public void setBlog_content(String blog_content) {
			this.blog_content = blog_content;
		}


		public Date getBlog_writedate() {
			return blog_writedate;
		}


		public void setBlog_writedate(Date blog_writedate) {
			this.blog_writedate = blog_writedate;
		}


		public int getBlog_readCount() {
			return blog_readCount;
		}


		public void setBlog_readCount(int blog_readCount) {
			this.blog_readCount = blog_readCount;
		}


		public int getBlog_like() {
			return blog_like;
		}


		public void setBlog_like(int blog_like) {
			this.blog_like = blog_like;
		}


		public String getMain_board() {
			return main_board;
		}


		public void setMain_board(String main_board) {
			this.main_board = main_board;
		}


		
		
		
	}


