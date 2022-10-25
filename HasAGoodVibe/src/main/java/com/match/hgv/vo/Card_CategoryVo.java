package com.match.hgv.vo;

public class Card_CategoryVo {
	
	private int card_category_no;
	private String card_category_name;
	
	public Card_CategoryVo() {
		super();
	}

	public Card_CategoryVo(int card_category_no, String card_category_name) {
		super();
		this.card_category_no = card_category_no;
		this.card_category_name = card_category_name;
	}

	public int getCard_category_no() {
		return card_category_no;
	}

	public void setCard_category_no(int card_category_no) {
		this.card_category_no = card_category_no;
	}

	public String getCard_category_name() {
		return card_category_name;
	}

	public void setCard_category_name(String card_category_name) {
		this.card_category_name = card_category_name;
	}
}
