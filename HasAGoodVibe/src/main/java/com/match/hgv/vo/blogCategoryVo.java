package com.match.hgv.vo;

public class blogCategoryVo {

	private int c_no;
	private int stylist_no;
	private String c_name;
	private String main_c;
	
	
	public blogCategoryVo() {
		super();
	}


	public blogCategoryVo(int c_no, int stylist_no, String c_name, String main_c) {
		super();
		this.c_no = c_no;
		this.stylist_no = stylist_no;
		this.c_name = c_name;
		this.main_c = main_c;
	}


	public int getC_no() {
		return c_no;
	}


	public void setC_no(int c_no) {
		this.c_no = c_no;
	}


	public int getStylist_no() {
		return stylist_no;
	}


	public void setStylist_no(int stylist_no) {
		this.stylist_no = stylist_no;
	}


	public String getC_name() {
		return c_name;
	}


	public void setC_name(String c_name) {
		this.c_name = c_name;
	}


	public String getMain_c() {
		return main_c;
	}


	public void setMain_c(String main_c) {
		this.main_c = main_c;
	}


	
	
	
}
