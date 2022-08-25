package com.dogather.dto.dogather;

public class DogatherPostDTO {
	private int dp_index;
	private int dg_index;
	private int user_index;
	private String user_nickname;
	private String dp_reg_date;
	private String dp_update_date;
	private String dp_contents;
	private String dp_like_user_index;
	private int dp_like_cnt;
	private boolean dp_inactive;
	private String dp_image1_org;
	private String dp_image1_sys;
	private String dp_image2_org;
	private String dp_image2_sys;
	private String dp_image3_org;
	private String dp_image3_sys;
	private String dp_type;
	public int getDp_index() {
		return dp_index;
	}
	public void setDp_index(int dp_index) {
		this.dp_index = dp_index;
	}
	public int getDg_index() {
		return dg_index;
	}
	public void setDg_index(int dg_index) {
		this.dg_index = dg_index;
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
	public String getDp_reg_date() {
		return dp_reg_date;
	}
	public void setDp_reg_date(String dp_reg_date) {
		this.dp_reg_date = dp_reg_date;
	}
	public String getDp_update_date() {
		return dp_update_date;
	}
	public void setDp_update_date(String dp_update_date) {
		this.dp_update_date = dp_update_date;
	}
	public String getDp_contents() {
		return dp_contents;
	}
	public void setDp_contents(String dp_contents) {
		this.dp_contents = dp_contents;
	}
	public String getDp_like_user_index() {
		return dp_like_user_index;
	}
	public void setDp_like_user_index(String dp_like_user_index) {
		this.dp_like_user_index = dp_like_user_index;
	}
	public int getDp_like_cnt() {
		return dp_like_cnt;
	}
	public void setDp_like_cnt(int dp_like_cnt) {
		this.dp_like_cnt = dp_like_cnt;
	}
	public void setDp_inactive(boolean dp_inactive) {
		this.dp_inactive = dp_inactive;
	}
	public boolean isDp_inactive() {
		return dp_inactive;
	}
	public void setDp_inactive(int dp_inactive) {
		this.dp_inactive = dp_inactive==1;
	}
	public String getDp_image1_org() {
		return dp_image1_org;
	}
	public void setDp_image1_org(String dp_image1_org) {
		this.dp_image1_org = dp_image1_org;
	}
	public String getDp_image1_sys() {
		return dp_image1_sys;
	}
	public void setDp_image1_sys(String dp_image1_sys) {
		this.dp_image1_sys = dp_image1_sys;
	}
	public String getDp_image2_org() {
		return dp_image2_org;
	}
	public void setDp_image2_org(String dp_image2_org) {
		this.dp_image2_org = dp_image2_org;
	}
	public String getDp_image2_sys() {
		return dp_image2_sys;
	}
	public void setDp_image2_sys(String dp_image2_sys) {
		this.dp_image2_sys = dp_image2_sys;
	}
	public String getDp_image3_org() {
		return dp_image3_org;
	}
	public void setDp_image3_org(String dp_image3_org) {
		this.dp_image3_org = dp_image3_org;
	}
	public String getDp_image3_sys() {
		return dp_image3_sys;
	}
	public void setDp_image3_sys(String dp_image3_sys) {
		this.dp_image3_sys = dp_image3_sys;
	}
	public String getDp_type() {
		return dp_type;
	}
	public void setDp_type(String dp_type) {
		this.dp_type = dp_type;
	}
	
}
