package com.match.hgv.vo;

public class RandomBox_ImgVo {
	private int randomBox_Img_no;
	private int randomBox_no;
	private String randomBox_Img_link;
	private String randomBox_Img_name;
	public RandomBox_ImgVo() {
		super();
	}
	public RandomBox_ImgVo(int randomBox_Img_no, int randomBox_no, String randomBox_Img_link,
			String randomBox_Img_name) {
		super();
		this.randomBox_Img_no = randomBox_Img_no;
		this.randomBox_no = randomBox_no;
		this.randomBox_Img_link = randomBox_Img_link;
		this.randomBox_Img_name = randomBox_Img_name;
	}
	public int getRandomBox_Img_no() {
		return randomBox_Img_no;
	}
	public void setRandomBox_Img_no(int randomBox_Img_no) {
		this.randomBox_Img_no = randomBox_Img_no;
	}
	public int getRandomBox_no() {
		return randomBox_no;
	}
	public void setRandomBox_no(int randomBox_no) {
		this.randomBox_no = randomBox_no;
	}
	public String getRandomBox_Img_link() {
		return randomBox_Img_link;
	}
	public void setRandomBox_Img_link(String randomBox_Img_link) {
		this.randomBox_Img_link = randomBox_Img_link;
	}
	public String getRandomBox_Img_name() {
		return randomBox_Img_name;
	}
	public void setRandomBox_Img_name(String randomBox_Img_name) {
		this.randomBox_Img_name = randomBox_Img_name;
	}
	
}
