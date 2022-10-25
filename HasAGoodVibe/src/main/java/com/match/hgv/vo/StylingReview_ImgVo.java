package com.match.hgv.vo;

public class StylingReview_ImgVo {
	private int styling_review_img_no;
	private int styling_review_no;
	private String styling_review_img_link;
	private String styling_review_img_name;
	public StylingReview_ImgVo() {
		super();
	}
	public StylingReview_ImgVo(int styling_review_img_no, int styling_review_no, String styling_review_img_link,
			String styling_review_img_name) {
		super();
		this.styling_review_img_no = styling_review_img_no;
		this.styling_review_no = styling_review_no;
		this.styling_review_img_link = styling_review_img_link;
		this.styling_review_img_name = styling_review_img_name;
	}
	public int getStyling_review_img_no() {
		return styling_review_img_no;
	}
	public void setStyling_review_img_no(int styling_review_img_no) {
		this.styling_review_img_no = styling_review_img_no;
	}
	public int getStyling_review_no() {
		return styling_review_no;
	}
	public void setStyling_review_no(int styling_review_no) {
		this.styling_review_no = styling_review_no;
	}
	public String getStyling_review_img_link() {
		return styling_review_img_link;
	}
	public void setStyling_review_img_link(String styling_review_img_link) {
		this.styling_review_img_link = styling_review_img_link;
	}
	public String getStyling_review_img_name() {
		return styling_review_img_name;
	}
	public void setStyling_review_img_name(String styling_review_img_name) {
		this.styling_review_img_name = styling_review_img_name;
	}

	
}
