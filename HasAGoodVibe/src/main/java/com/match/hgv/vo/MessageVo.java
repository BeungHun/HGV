package com.match.hgv.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class MessageVo {
		private int message_no;
		private int	member_no;
		private int	bfmember_no;
		private String message_content;
		@DateTimeFormat(pattern = "yyyy-MM-dd")
		private Date message_send_date;
		private Date message_read_date;
		private String read_check;
		
		
		public MessageVo() {
			super();
		}


		public MessageVo(int message_no, int member_no, int bfmember_no, String message_content, Date message_send_date,
				Date message_read_date, String read_check) {
			super();
			this.message_no = message_no;
			this.member_no = member_no;
			this.bfmember_no = bfmember_no;
			this.message_content = message_content;
			this.message_send_date = message_send_date;
			this.message_read_date = message_read_date;
			this.read_check = read_check;
		}


		public int getMessage_no() {
			return message_no;
		}


		public void setMessage_no(int message_no) {
			this.message_no = message_no;
		}


		public int getMember_no() {
			return member_no;
		}


		public void setMember_no(int member_no) {
			this.member_no = member_no;
		}


		public int getBfmember_no() {
			return bfmember_no;
		}


		public void setBfmember_no(int bfmember_no) {
			this.bfmember_no = bfmember_no;
		}


		public String getMessage_content() {
			return message_content;
		}


		public void setMessage_content(String message_content) {
			this.message_content = message_content;
		}


		public Date getMessage_send_date() {
			return message_send_date;
		}


		public void setMessage_send_date(Date message_send_date) {
			this.message_send_date = message_send_date;
		}


		public Date getMessage_read_date() {
			return message_read_date;
		}


		public void setMessage_read_date(Date message_read_date) {
			this.message_read_date = message_read_date;
		}


		public String getRead_check() {
			return read_check;
		}


		public void setRead_check(String read_check) {
			this.read_check = read_check;
		}

		
		
}
		