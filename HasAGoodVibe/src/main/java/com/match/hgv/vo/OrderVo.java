package com.match.hgv.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class OrderVo {

	private int order_no; 
	private int user_no; 
	private int stylist_card_no; 
	private int card_category_no;
	private String order_state; 
	private int order_heigth; 
	private int order_weight; 
	private int order_top; 
	private int order_bottom; 
	private int order_shoes; 
	private String order_content; 
	private int order_saleprice;
	@DateTimeFormat (pattern = "yyyy-MM-dd")
	private Date order_date;
	
	public OrderVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public OrderVo(int order_no, int user_no, int stylist_card_no, int card_category_no, String order_state,
			int order_heigth, int order_weight, int order_top, int order_bottom, int order_shoes, String order_content,
			int order_saleprice, Date order_date) {
		super();
		this.order_no = order_no;
		this.user_no = user_no;
		this.stylist_card_no = stylist_card_no;
		this.card_category_no = card_category_no;
		this.order_state = order_state;
		this.order_heigth = order_heigth;
		this.order_weight = order_weight;
		this.order_top = order_top;
		this.order_bottom = order_bottom;
		this.order_shoes = order_shoes;
		this.order_content = order_content;
		this.order_saleprice = order_saleprice;
		this.order_date = order_date;
	}
	public int getOrder_no() {
		return order_no;
	}
	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
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
	public String getOrder_state() {
		return order_state;
	}
	public void setOrder_state(String order_state) {
		this.order_state = order_state;
	}
	public int getOrder_heigth() {
		return order_heigth;
	}
	public void setOrder_heigth(int order_heigth) {
		this.order_heigth = order_heigth;
	}
	public int getOrder_weight() {
		return order_weight;
	}
	public void setOrder_weight(int order_weight) {
		this.order_weight = order_weight;
	}
	public int getOrder_top() {
		return order_top;
	}
	public void setOrder_top(int order_top) {
		this.order_top = order_top;
	}
	public int getOrder_bottom() {
		return order_bottom;
	}
	public void setOrder_bottom(int order_bottom) {
		this.order_bottom = order_bottom;
	}
	public int getOrder_shoes() {
		return order_shoes;
	}
	public void setOrder_shoes(int order_shoes) {
		this.order_shoes = order_shoes;
	}
	public String getOrder_content() {
		return order_content;
	}
	public void setOrder_content(String order_content) {
		this.order_content = order_content;
	}
	public int getOrder_saleprice() {
		return order_saleprice;
	}
	public void setOrder_saleprice(int order_saleprice) {
		this.order_saleprice = order_saleprice;
	}
	public Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	
}
