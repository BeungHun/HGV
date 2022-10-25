package com.match.hgv.vo;

import java.util.List;

public class Card_Category_RelationVo {

	private int card_category_relation_no;
	private int stylist_card_no;
	private int card_category_no;

	public Card_Category_RelationVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Card_Category_RelationVo(int card_category_relation_no, int stylist_card_no, int card_category_no) {
		super();
		this.card_category_relation_no = card_category_relation_no;
		this.stylist_card_no = stylist_card_no;
		this.card_category_no = card_category_no;
	}
	public int getCard_category_relation_no() {
		return card_category_relation_no;
	}
	public void setCard_category_relation_no(int card_category_relation_no) {
		this.card_category_relation_no = card_category_relation_no;
	}
	public int getStylist_card_no() {
		return stylist_card_no;
	}
	public void setStylist_card_no(int stylist_card_no) {
		this.stylist_card_no = stylist_card_no;
	}
	public int getCard_category_no() {
		return card_category_no;
	}
	public void setCard_category_no(int card_category_no) {
		this.card_category_no = card_category_no;
	}

	
}
