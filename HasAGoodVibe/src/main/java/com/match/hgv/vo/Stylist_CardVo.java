package com.match.hgv.vo;

public class Stylist_CardVo {

	private int stylist_card_no;
	private int stylist_no;
	private String stylist_card_subtitle;
	private int stylist_card_onedaycount;
	private String stylist_card_content;
	private int stylist_card_price;
	
	public Stylist_CardVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Stylist_CardVo(int stylist_card_no, int stylist_no, String stylist_card_subtitle,
			int stylist_card_onedaycount, String stylist_card_content, int stylist_card_price) {
		super();
		this.stylist_card_no = stylist_card_no;
		this.stylist_no = stylist_no;
		this.stylist_card_subtitle = stylist_card_subtitle;
		this.stylist_card_onedaycount = stylist_card_onedaycount;
		this.stylist_card_content = stylist_card_content;
		this.stylist_card_price = stylist_card_price;
	}
	public int getStylist_card_no() {
		return stylist_card_no;
	}
	public void setStylist_card_no(int stylist_card_no) {
		this.stylist_card_no = stylist_card_no;
	}
	public int getStylist_no() {
		return stylist_no;
	}
	public void setStylist_no(int stylist_no) {
		this.stylist_no = stylist_no;
	}
	public String getStylist_card_subtitle() {
		return stylist_card_subtitle;
	}
	public void setStylist_card_subtitle(String stylist_card_subtitle) {
		this.stylist_card_subtitle = stylist_card_subtitle;
	}
	public int getStylist_card_onedaycount() {
		return stylist_card_onedaycount;
	}
	public void setStylist_card_onedaycount(int stylist_card_onedaycount) {
		this.stylist_card_onedaycount = stylist_card_onedaycount;
	}
	public String getStylist_card_content() {
		return stylist_card_content;
	}
	public void setStylist_card_content(String stylist_card_content) {
		this.stylist_card_content = stylist_card_content;
	}
	public int getStylist_card_price() {
		return stylist_card_price;
	}
	public void setStylist_card_price(int stylist_card_price) {
		this.stylist_card_price = stylist_card_price;
	}
}
