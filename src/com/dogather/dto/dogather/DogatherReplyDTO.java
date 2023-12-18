package com.dogather.dto.dogather;

public class DogatherReplyDTO {
	private int dpr_index;
	private int dp_index;
	private int user_index;
	private String user_nickname;
	private String dpr_reg_date;
	private String dpr_update_date;
	private String dpr_contents;
	private boolean dpr_inactive;
	public int getDpr_index() {
		return dpr_index;
	}
	public void setDpr_index(int dpr_index) {
		this.dpr_index = dpr_index;
	}
	public int getDp_index() {
		return dp_index;
	}
	public void setDp_index(int dp_index) {
		this.dp_index = dp_index;
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
	public String getDpr_reg_date() {
		return dpr_reg_date;
	}
	public void setDpr_reg_date(String dpr_reg_date) {
		this.dpr_reg_date = dpr_reg_date;
	}
	public String getDpr_update_date() {
		return dpr_update_date;
	}
	public void setDpr_update_date(String dpr_update_date) {
		this.dpr_update_date = dpr_update_date;
	}
	public String getDpr_contents() {
		return dpr_contents;
	}
	public void setDpr_contents(String dpr_contents) {
		this.dpr_contents = dpr_contents;
	}
	public boolean isDpr_inactive() {
		return dpr_inactive;
	}
	public void setDpr_inactive(int dpr_inactive) {
		this.dpr_inactive = dpr_inactive==1;
	}

}
