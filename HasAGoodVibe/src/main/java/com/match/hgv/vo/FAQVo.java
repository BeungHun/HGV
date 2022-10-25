package com.match.hgv.vo;

import java.util.Date;

public class FAQVo {
	
	int faq_no;
	int admin_no;
	String faq_title;
	String faq_content;
	String faq_category;
	Date faq_writedate;
	
	public FAQVo() {
		super();
	}

	public FAQVo(int faq_no, int admin_no, String faq_title, String faq_content, String faq_category,
			Date faq_writedate) {
		super();
		this.faq_no = faq_no;
		this.admin_no = admin_no;
		this.faq_title = faq_title;
		this.faq_content = faq_content;
		this.faq_category = faq_category;
		this.faq_writedate = faq_writedate;
	}

	public int getFaq_no() {
		return faq_no;
	}

	public void setFaq_no(int faq_no) {
		this.faq_no = faq_no;
	}

	public int getAdmin_no() {
		return admin_no;
	}

	public void setAdmin_no(int admin_no) {
		this.admin_no = admin_no;
	}

	public String getFaq_title() {
		return faq_title;
	}

	public void setFaq_title(String faq_title) {
		this.faq_title = faq_title;
	}

	public String getFaq_content() {
		return faq_content;
	}

	public void setFaq_content(String faq_content) {
		this.faq_content = faq_content;
	}

	public String getFaq_category() {
		return faq_category;
	}

	public void setFaq_category(String faq_category) {
		this.faq_category = faq_category;
	}

	public Date getFaq_writedate() {
		return faq_writedate;
	}

	public void setFaq_writedate(Date faq_writedate) {
		this.faq_writedate = faq_writedate;
	}
	
	
	
}
