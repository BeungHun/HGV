package com.match.hgv.vo;

import java.util.Date;

public class ReportVo {
	private int report_no;
	private int reporting_member_no;
	private int reported_member_no;
	private int report_confirm;
	private int report_complete;
	private String report_category;
	private String report_content;
	private Date report_date;
	
	public ReportVo() {
		super();
	}

	public ReportVo(int report_no, int reporting_member_no, int reported_member_no, int report_confirm,
			int report_complete, String report_category, String report_content, Date report_date) {
		super();
		this.report_no = report_no;
		this.reporting_member_no = reporting_member_no;
		this.reported_member_no = reported_member_no;
		this.report_confirm = report_confirm;
		this.report_complete = report_complete;
		this.report_category = report_category;
		this.report_content = report_content;
		this.report_date = report_date;
	}

	public int getReport_no() {
		return report_no;
	}

	public void setReport_no(int report_no) {
		this.report_no = report_no;
	}

	public int getReporting_member_no() {
		return reporting_member_no;
	}

	public void setReporting_member_no(int reporting_member_no) {
		this.reporting_member_no = reporting_member_no;
	}

	public int getReported_member_no() {
		return reported_member_no;
	}

	public void setReported_member_no(int reported_member_no) {
		this.reported_member_no = reported_member_no;
	}

	public int getReport_confirm() {
		return report_confirm;
	}

	public void setReport_confirm(int report_confirm) {
		this.report_confirm = report_confirm;
	}

	public int getReport_complete() {
		return report_complete;
	}

	public void setReport_complete(int report_complete) {
		this.report_complete = report_complete;
	}

	public String getReport_category() {
		return report_category;
	}

	public void setReport_category(String report_category) {
		this.report_category = report_category;
	}

	public String getReport_content() {
		return report_content;
	}

	public void setReport_content(String report_content) {
		this.report_content = report_content;
	}

	public Date getReport_date() {
		return report_date;
	}

	public void setReport_date(Date report_date) {
		this.report_date = report_date;
	}
	
	
}
