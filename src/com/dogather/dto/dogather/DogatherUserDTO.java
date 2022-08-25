package com.dogather.dto.dogather;

public class DogatherUserDTO {
	private int dg_index;
	private int user_index;
	private String dg_user_reg_date;
	private boolean dg_user_active;
	private String dg_user_drop_date;
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
	public String getDg_user_reg_date() {
		return dg_user_reg_date;
	}
	public void setDg_user_reg_date(String dg_user_reg_date) {
		this.dg_user_reg_date = dg_user_reg_date;
	}
	public boolean isDg_user_active() {
		return dg_user_active;
	}
	public void setDg_user_active(int dg_user_active) {
		this.dg_user_active = dg_user_active==1;
	}
	public String getDg_user_drop_date() {
		return dg_user_drop_date;
	}
	public void setDg_user_drop_date(String dg_user_drop_date) {
		this.dg_user_drop_date = dg_user_drop_date;
	}
}
