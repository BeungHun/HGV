package com.match.hgv.vo;

public class Styling_ResponseImgVo {
	
	private int styling_img_no;
	private int styling_no;
	private String styling_img_link;
	private String styling_img_originalName;
	
	public Styling_ResponseImgVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Styling_ResponseImgVo(int styling_img_no, int styling_no, String styling_img_link,
			String styling_img_originalName) {
		super();
		this.styling_img_no = styling_img_no;
		this.styling_no = styling_no;
		this.styling_img_link = styling_img_link;
		this.styling_img_originalName = styling_img_originalName;
	}
	public int getStyling_img_no() {
		return styling_img_no;
	}
	public void setStyling_img_no(int styling_img_no) {
		this.styling_img_no = styling_img_no;
	}
	public int getStyling_no() {
		return styling_no;
	}
	public void setStyling_no(int styling_no) {
		this.styling_no = styling_no;
	}
	public String getStyling_img_link() {
		return styling_img_link;
	}
	public void setStyling_img_link(String styling_img_link) {
		this.styling_img_link = styling_img_link;
	}
	public String getStyling_img_originalName() {
		return styling_img_originalName;
	}
	public void setStyling_img_originalName(String styling_img_originalName) {
		this.styling_img_originalName = styling_img_originalName;
	}

}
