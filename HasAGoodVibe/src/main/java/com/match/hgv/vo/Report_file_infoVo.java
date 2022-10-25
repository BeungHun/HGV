package com.match.hgv.vo;

public class Report_file_infoVo {
	private int report_file_info_no;
	private int report_no;
	private String report_file_link;
	private String report_file_originalName;
	public Report_file_infoVo() {
		super();
	}
	public Report_file_infoVo(int report_file_info_no, int report_no, String report_file_link,
			String report_file_originalName) {
		super();
		this.report_file_info_no = report_file_info_no;
		this.report_no = report_no;
		this.report_file_link = report_file_link;
		this.report_file_originalName = report_file_originalName;
	}
	public int getReport_file_info_no() {
		return report_file_info_no;
	}
	public void setReport_file_info_no(int report_file_info_no) {
		this.report_file_info_no = report_file_info_no;
	}
	public int getReport_no() {
		return report_no;
	}
	public void setReport_no(int report_no) {
		this.report_no = report_no;
	}
	public String getReport_file_link() {
		return report_file_link;
	}
	public void setReport_file_link(String report_file_link) {
		this.report_file_link = report_file_link;
	}
	public String getReport_file_originalName() {
		return report_file_originalName;
	}
	public void setReport_file_originalName(String report_file_originalName) {
		this.report_file_originalName = report_file_originalName;
	}
	
	
}
