package com.dogather.dto.dogather;

public class DogatherDTO {
	private int dg_index;
	private int user_index;
	private String user_nickname;
	private String dg_reg_date;
	private int category_index;
	private String dg_title;
	private String dg_intro;
	private String dg_intro_short;
	private String dg_banner_org;
	private String dg_banner_sys;
	private boolean dg_public_scope;
	private int dg_hits;
	private int dg_capacity;
	private String dg_limit_scope;
	private String dg_expire;
	private boolean dg_inactive;
	private int dg_member_cnt;
		
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
	public String getDg_reg_date() {
		return dg_reg_date;
	}
	public void setDg_reg_date(String dg_reg_date) {
		this.dg_reg_date = dg_reg_date;
	}
	public int getCategory_index() {
		return category_index;
	}
	public void setCategory_index(int category_index) {
		this.category_index = category_index;
	}
	public String getDg_title() {
		return dg_title;
	}
	public void setDg_title(String dg_title) {
		this.dg_title = dg_title;
	}
	public String getDg_intro() {
		return dg_intro;
	}
	public void setDg_intro(String dg_intro) {
		this.dg_intro = dg_intro;
	}
	public String getDg_intro_short() {
		return dg_intro_short;
	}
	public void setDg_intro_short(String dg_intro_short) {
		this.dg_intro_short = dg_intro_short;
	}
	public String getDg_banner_org() {
		return dg_banner_org;
	}
	public void setDg_banner_org(String dg_banner_org) {
		this.dg_banner_org = dg_banner_org;
	}
	public String getDg_banner_sys() {
		return dg_banner_sys;
	}
	public void setDg_banner_sys(String dg_banner_sys) {
		this.dg_banner_sys = dg_banner_sys;
	}
	public boolean isDg_public_scope() {
		return dg_public_scope;
	}
	public void setDg_public_scope(int dg_public_scope) {
		this.dg_public_scope = dg_public_scope==1;
	}
	public int getDg_hits() {
		return dg_hits;
	}
	public void setDg_hits(int dg_hits) {
		this.dg_hits = dg_hits;
	}
	public int getDg_capacity() {
		return dg_capacity;
	}
	public void setDg_capacity(int dg_capacity) {
		this.dg_capacity = dg_capacity;
	}
	public String getDg_limit_scope() {
		return dg_limit_scope;
	}
	public void setDg_limit_scope(String dg_limit_scope) {
		this.dg_limit_scope = dg_limit_scope;
	}
	public String getDg_expire() {
		return dg_expire;
	}
	public void setDg_expire(String dg_expire) {
		this.dg_expire = dg_expire;
	}
	public boolean isDg_inactive() {
		return dg_inactive;
	}
	public void setDg_inactive(int dg_inactive) {
		this.dg_inactive = dg_inactive==1;
	}
	public int getDg_member_cnt() {
		return dg_member_cnt;
	}
	public void setDg_member_cnt(int dg_member_cnt) {
		this.dg_member_cnt = dg_member_cnt;
	}
}
