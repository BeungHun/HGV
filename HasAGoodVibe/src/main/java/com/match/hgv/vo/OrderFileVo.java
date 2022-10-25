package com.match.hgv.vo;

public class OrderFileVo {

	private int order_file_no; 
	private int order_no; 
	private String order_file_link; 
	private String order_file_originalName;
	
	public OrderFileVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public OrderFileVo(int order_file_no, int order_no, String order_file_link, String order_file_originalName) {
		super();
		this.order_file_no = order_file_no;
		this.order_no = order_no;
		this.order_file_link = order_file_link;
		this.order_file_originalName = order_file_originalName;
	}
	public int getOrder_file_no() {
		return order_file_no;
	}
	public void setOrder_file_no(int order_file_no) {
		this.order_file_no = order_file_no;
	}
	public int getOrder_no() {
		return order_no;
	}
	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}
	public String getOrder_file_link() {
		return order_file_link;
	}
	public void setOrder_file_link(String order_file_link) {
		this.order_file_link = order_file_link;
	}
	public String getOrder_file_originalName() {
		return order_file_originalName;
	}
	public void setOrder_file_originalName(String order_file_originalName) {
		this.order_file_originalName = order_file_originalName;
	} 
}
