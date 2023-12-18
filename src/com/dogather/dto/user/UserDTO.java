package com.dogather.dto.user;

public class UserDTO {
	private int user_index;
	private String user_email;
	private String user_nickname;
	private String user_name;
	private String user_password;
	private String user_phone;
	private String user_gender;
	private String user_birth_date;
	private String user_interest;
	private String user_intro;

	private String user_profile_original_name;
	private String user_profile_system_name;
	
	private boolean user_term_essential1;
	private boolean user_term_essential2;
	private boolean user_term_selective1;
	private String user_term_selective1_reg_date;
	private boolean user_term_selective2;
	private String user_term_selective2_reg_date;

	private String user_public_scope;
	private String user_reg_date;
    private String user_password_set_date;
    private String user_last_login;
    private String user_inactive_date;
    private boolean user_inactive;
    private String user_inactive_reason;

	private String zip_code;
	private String address_default;
	private String address_detail;
	private String address_extra;
	
	private String user_buddies;
	
	private String user_block_list;
	
	private String note_scope;

	public int getUser_index() {
		return user_index;
	}

	public void setUser_index(int user_index) {
		this.user_index = user_index;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_nickname() {
		return user_nickname;
	}

	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_password() {
		return user_password;
	}

	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}

	public String getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

	public String getUser_gender() {
		return user_gender;
	}

	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}

	public String getUser_birth_date() {
		return user_birth_date;
	}

	public void setUser_birth_date(String user_birth_date) {
		this.user_birth_date = user_birth_date;
	}

	public String getUser_interest() {
		return user_interest;
	}

	public void setUser_interest(String user_interest) {
		this.user_interest = user_interest;
	}

	public String getUser_intro() {
		return user_intro;
	}

	public void setUser_intro(String user_intro) {
		this.user_intro = user_intro;
	}

	public String getUser_profile_original_name() {
		return user_profile_original_name;
	}

	public void setUser_profile_original_name(String user_profile_original_name) {
		this.user_profile_original_name = user_profile_original_name;
	}

	public String getUser_profile_system_name() {
		return user_profile_system_name;
	}

	public void setUser_profile_system_name(String user_profile_system_name) {
		this.user_profile_system_name = user_profile_system_name;
	}

	public boolean isUser_term_essential1() {
		return user_term_essential1;
	}

	public void setUser_term_essential1(int user_term_essential1) {
		this.user_term_essential1 = user_term_essential1==1;
	}

	public boolean isUser_term_essential2() {
		return user_term_essential2;
	}

	public void setUser_term_essential2(int user_term_essential2) {
		this.user_term_essential2 = user_term_essential2==1;
	}

	public boolean isUser_term_selective1() {
		return user_term_selective1;
	}

	public void setUser_term_selective1(int user_term_selective1) {
		this.user_term_selective1 = user_term_selective1==1;
	}

	public String getUser_term_selective1_reg_date() {
		return user_term_selective1_reg_date;
	}

	public void setUser_term_selective1_reg_date(String user_term_selective1_reg_date) {
		this.user_term_selective1_reg_date = user_term_selective1_reg_date;
	}

	public boolean isUser_term_selective2() {
		return user_term_selective2;
	}

	public void setUser_term_selective2(int user_term_selective2) {
		this.user_term_selective2 = user_term_selective2==1;
	}

	public String getUser_term_selective2_reg_date() {
		return user_term_selective2_reg_date;
	}

	public void setUser_term_selective2_reg_date(String user_term_selective2_reg_date) {
		this.user_term_selective2_reg_date = user_term_selective2_reg_date;
	}

	public String getUser_public_scope() {
		return user_public_scope;
	}

	public void setUser_public_scope(String user_public_scope) {
		this.user_public_scope = user_public_scope;
	}

	public String getUser_reg_date() {
		return user_reg_date;
	}

	public void setUser_reg_date(String user_reg_date) {
		this.user_reg_date = user_reg_date;
	}

	public String getUser_password_set_date() {
		return user_password_set_date;
	}

	public void setUser_password_set_date(String user_password_set_date) {
		this.user_password_set_date = user_password_set_date;
	}

	public String getUser_last_login() {
		return user_last_login;
	}

	public void setUser_last_login(String user_last_login) {
		this.user_last_login = user_last_login;
	}

	public String getUser_inactive_date() {
		return user_inactive_date;
	}

	public void setUser_inactive_date(String user_inactive_date) {
		this.user_inactive_date = user_inactive_date;
	}

	public boolean isUser_inactive() {
		return user_inactive;
	}

	public void setUser_inactive(int user_inactive) {
		this.user_inactive = user_inactive==1;
	}

	public String getUser_inactive_reason() {
		return user_inactive_reason;
	}

	public void setUser_inactive_reason(String user_inactive_reason) {
		this.user_inactive_reason = user_inactive_reason;
	}

	public String getZip_code() {
		return zip_code;
	}

	public void setZip_code(String zip_code) {
		this.zip_code = zip_code;
	}

	public String getAddress_default() {
		return address_default;
	}

	public void setAddress_default(String address_default) {
		this.address_default = address_default;
	}

	public String getAddress_detail() {
		return address_detail;
	}

	public void setAddress_detail(String address_detail) {
		this.address_detail = address_detail;
	}

	public String getAddress_extra() {
		return address_extra;
	}

	public void setAddress_extra(String address_extra) {
		this.address_extra = address_extra;
	}

	public String getUser_buddies() {
		return user_buddies;
	}

	public void setUser_buddies(String user_buddies) {
		this.user_buddies = user_buddies;
	}

	public String getUser_block_list() {
		return user_block_list;
	}

	public void setUser_block_list(String user_block_list) {
		this.user_block_list = user_block_list;
	}

	public String getNote_scope() {
		return note_scope;
	}

	public void setNote_scope(String note_scope) {
		this.note_scope = note_scope;
	}
	
	
}
