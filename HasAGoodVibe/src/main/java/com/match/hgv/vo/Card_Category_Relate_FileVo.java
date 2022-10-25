package com.match.hgv.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Card_Category_Relate_FileVo {
	
	private int card_category_relate_file_no;
	private int card_category_relation_no;
	private String card_category_relate_file_link;
	private String card_category_relate_file_name;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date card_category_relate_file_date;
	
	public Card_Category_Relate_FileVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Card_Category_Relate_FileVo(int card_category_relate_file_no, int card_category_relation_no,
			String card_category_relate_file_link, String card_category_relate_file_name,
			Date card_category_relate_file_date) {
		super();
		this.card_category_relate_file_no = card_category_relate_file_no;
		this.card_category_relation_no = card_category_relation_no;
		this.card_category_relate_file_link = card_category_relate_file_link;
		this.card_category_relate_file_name = card_category_relate_file_name;
		this.card_category_relate_file_date = card_category_relate_file_date;
	}
	public int getCard_category_relate_file_no() {
		return card_category_relate_file_no;
	}
	public void setCard_category_relate_file_no(int card_category_relate_file_no) {
		this.card_category_relate_file_no = card_category_relate_file_no;
	}
	public int getcard_category_relation_no() {
		return card_category_relation_no;
	}
	public void setcard_category_relation_no(int card_category_relation_no) {
		this.card_category_relation_no = card_category_relation_no;
	}
	public String getCard_category_relate_file_link() {
		return card_category_relate_file_link;
	}
	public void setCard_category_relate_file_link(String card_category_relate_file_link) {
		this.card_category_relate_file_link = card_category_relate_file_link;
	}
	public String getCard_category_relate_file_name() {
		return card_category_relate_file_name;
	}
	public void setCard_category_relate_file_name(String card_category_relate_file_name) {
		this.card_category_relate_file_name = card_category_relate_file_name;
	}
	public Date getCard_category_relate_file_date() {
		return card_category_relate_file_date;
	}
	public void setCard_category_relate_file_date(Date card_category_relate_file_date) {
		this.card_category_relate_file_date = card_category_relate_file_date;
	}
}
