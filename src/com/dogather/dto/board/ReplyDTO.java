package com.dogather.dto.board;

public class ReplyDTO {
	
	private int r_index;
	private int b_index;
	private int user_index;
	private String user_nickname;
	private String r_reg_date;
	private String r_update_date;
	private String r_contents;
	private String r_like_user_index;
	private boolean r_inactive;
	private String r_name;
	

	public ReplyDTO() {

	}
	public ReplyDTO(int r_index, int b_index, int user_index, String user_nickname, String r_reg_date,
			String r_update_date, String r_contents, String r_like_user_index, boolean r_inactive, String r_name) {

		this.r_index = r_index;
		this.b_index = b_index;
		this.user_index = user_index;
		this.user_nickname = user_nickname;
		this.r_reg_date = r_reg_date;
		this.r_update_date = r_update_date;
		this.r_contents = r_contents;
		this.r_like_user_index = r_like_user_index;
		this.r_inactive = r_inactive;
		this.r_name = r_name;
	}
	public int getR_index() {
		return r_index;
	}
	public void setR_index(int r_index) {
		this.r_index = r_index;
	}
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
	public String getR_reg_date() {
		return r_reg_date;
	}
	public void setR_reg_date(String r_reg_date) {
		this.r_reg_date = r_reg_date;
	}
	public String getR_update_date() {
		return r_update_date;
	}
	public void setR_update_date(String r_update_date) {
		this.r_update_date = r_update_date;
	}
	public String getR_contents() {
		return r_contents;
	}
	public void setR_contents(String r_contents) {
		this.r_contents = r_contents;
	}
	public String getR_like_user_index() {
		return r_like_user_index;
	}
	public void setR_like_user_index(String r_like_user_index) {
		this.r_like_user_index = r_like_user_index;
	}
	public boolean isR_inactive() {
		return r_inactive;
	}
	public void setR_inactive(int r_inactive) {
		this.r_inactive = r_inactive==1;
	}
	public String getR_name() {
		return r_name;
	}
	public void setR_name(String r_name) {
		this.r_name = r_name;
	}
}
