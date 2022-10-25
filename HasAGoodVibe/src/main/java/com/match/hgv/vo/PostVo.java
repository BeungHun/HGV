package com.match.hgv.vo;

public class PostVo {
	private int post_no;
	private String postcode;
	private String roadAddress;
	private String jibunAddress;
	private String detailAddress;
	private String extraAddress;
	public PostVo() {
		super();
	}
	public PostVo(int post_no, String postcode, String roadAddress, String jibunAddress, String detailAddress,
			String extraAddress) {
		super();
		this.post_no = post_no;
		this.postcode = postcode;
		this.roadAddress = roadAddress;
		this.jibunAddress = jibunAddress;
		this.detailAddress = detailAddress;
		this.extraAddress = extraAddress;
	}
	public int getPost_no() {
		return post_no;
	}
	public void setPost_no(int post_no) {
		this.post_no = post_no;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getRoadAddress() {
		return roadAddress;
	}
	public void setRoadAddress(String roadAddress) {
		this.roadAddress = roadAddress;
	}
	public String getJibunAddress() {
		return jibunAddress;
	}
	public void setJibunAddress(String jibunAddress) {
		this.jibunAddress = jibunAddress;
	}
	public String getDetailAddress() {
		return detailAddress;
	}
	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}
	public String getExtraAddress() {
		return extraAddress;
	}
	public void setExtraAddress(String extraAddress) {
		this.extraAddress = extraAddress;
	}

}
