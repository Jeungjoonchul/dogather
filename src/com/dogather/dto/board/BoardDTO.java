package com.dogather.dto.board;

public class BoardDTO {
	private int b_index;
	private int user_index;
	private String user_nickname;
	private String b_reg_date;
	private String b_update_date;
	private String b_subject;
	private String b_title;
	private String b_contents;
	private int b_hits;
	private String b_like_user_index;
	private int b_like_cnt;
	private boolean b_inactive;
	private String b_files;
	private String b_name;
	private int b_reply_cnt;
	private String r_name;
	
	public int getB_index() {
		return b_index;
	}
	public void setB_index(int b_index) {
		this.b_index = b_index;
	}
	public int getUser_index() {
		return user_index;
	}
	public void setUser_index(int user_index) {
		this.user_index = user_index;
	}
	public String getUser_nickname() {
		return user_nickname;
	}
	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}
	public String getB_reg_date() {
		return b_reg_date;
	}
	public void setB_reg_date(String b_reg_date) {
		this.b_reg_date = b_reg_date;
	}
	public String getB_update_date() {
		return b_update_date;
	}
	public void setB_update_date(String b_update_date) {
		this.b_update_date = b_update_date;
	}
	public String getB_subject() {
		return b_subject;
	}
	public void setB_subject(String b_subject) {
		this.b_subject = b_subject;
	}
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public String getB_contents() {
		return b_contents;
	}
	public void setB_contents(String b_contents) {
		this.b_contents = b_contents;
	}
	public int getB_hits() {
		return b_hits;
	}
	public void setB_hits(int b_hits) {
		this.b_hits = b_hits;
	}
	public String getB_like_user_index() {
		return b_like_user_index;
	}
	public void setB_like_user_index(String b_like_user_index) {
		this.b_like_user_index = b_like_user_index;
	}
	public int getB_like_cnt() {
		return b_like_cnt;
	}
	public void setB_like_cnt(int b_like_cnt) {
		this.b_like_cnt = b_like_cnt;
	}
	public boolean isB_inactive() {
		return b_inactive;
	}
	public void setB_inactive(int b_inactive) {
		this.b_inactive = b_inactive==1;
	}
	public String getB_files() {
		return b_files;
	}
	public void setB_files(String b_files) {
		this.b_files = b_files;
	}
	public String getB_name() {
		return b_name;
	}
	public void setB_name(String b_name) {
		this.b_name = b_name;
	}
	public int getB_reply_cnt() {
		return b_reply_cnt;
	}
	public void setB_reply_cnt(int b_reply_cnt) {
		this.b_reply_cnt = b_reply_cnt;
	}
	public String getR_name() {
		return r_name;
	}
	public void setR_name(String r_name) {
		this.r_name = r_name;
	}
}
