package com.dogethar.dto.board;

import java.util.Date;

public class BoardDTO {
/*
//	자유게시판 db
	private int fb_index; // 게시글 번호
	private int user_index; // 작성자 인덱스
	private Date fb_reg_date; // 게시글 등록일
	private Date fb_update_date // 게시글 수정일
	private String fb_subject; // 말머리
	private String fb_title; // 게시글 제목
	private String fb_contents; // 게시글 내용
	private int fb_hits; // 게시글 조회수
	private String fb_like_user_index; // 좋아요 누른 유저의 인덱스
	private boolean fb_inactive; // 게시글 삭제 여부

	public int getFb_index() {
		return fb_index;
	}
	public void setFb_index(int fb_index) {
		this.fb_index = fb_index;
	}
	public int getUser_index() {
		return user_index;
	}
	public void setUser_index(int user_index) {
		this.user_index = user_index;
	}
	public Date getFb_reg_date() {
		return fb_reg_date;
	}
	public void setFb_reg_date(Date fb_reg_date) {
		this.fb_reg_date = fb_reg_date;
	}
	public Date getFb_update_date() {
		return fb_update_date;
	}
	public void setFb_update_date(Date fb_update_date) {
		this.fb_update_date = fb_update_date;
	}
	public String getFb_subject() {
		return fb_subject;
	}
	public void setFb_subject(String fb_subject) {
		this.fb_subject = fb_subject;
	}
	public String getFb_title() {
		return fb_title;
	}
	public void setFb_title(String fb_title) {
		this.fb_title = fb_title;
	}
	public String getFb_contents() {
		return fb_contents;
	}
	public void setFb_contents(String fb_contents) {
		this.fb_contents = fb_contents;
	}
	public int getFb_hits() {
		return fb_hits;
	}
	public void setFb_hits(int fb_hits) {
		this.fb_hits = fb_hits;
	}
	public String getFb_like_user_index() {
		return fb_like_user_index;
	}
	public void setFb_like_user_index(String fb_like_user_index) {
		this.fb_like_user_index = fb_like_user_index;
	}
	public boolean isFb_inactive() {
		return fb_inactive;
	}
	public void setFb_inactive(boolean fb_inactive) {
		this.fb_inactive = fb_inactive;
	}
*/
	//test db
	private int tb_index; // 게시글 번호
	private int user_index; // 작성자 인덱스
	private String tb_reg_date; // 게시글 등록일
	private String tb_update_date; // 게시글 수정일
	private String tb_title; // 게시글 제목
	private String tb_contents; // 게시글 내용
	private int tb_hits; // 게시글 조회수
	private String tb_like_user_index; // 좋아요 누른 유저의 인덱스
	private boolean tb_inactive; // 게시글 삭제여부 (0이면 flase(default,게시), 1이면 true(삭제)) 

	public int getTb_index() {
		return tb_index;
	}
	public void setTb_index(int tb_index) {
		this.tb_index = tb_index;
	}
	public int getUser_index() {
		return user_index;
	}
	public void setUser_index(int user_index) {
		this.user_index = user_index;
	}
	public String getTb_reg_date() {
		return tb_reg_date;
	}
	public void setTb_reg_date(String tb_reg_date) {
		this.tb_reg_date = tb_reg_date;
	}
	public String getTb_update_date() {
		return tb_update_date;
	}
	public void setTb_update_date(String tb_update_date) {
		this.tb_update_date = tb_update_date;
	}
	public String getTb_title() {
		return tb_title;
	}
	public void setTb_title(String tb_title) {
		this.tb_title = tb_title;
	}
	public String getTb_contents() {
		return tb_contents;
	}
	public void setTb_contents(String tb_contents) {
		this.tb_contents = tb_contents;
	}
	public int getTb_hits() {
		return tb_hits;
	}
	public void setTb_hits(int tb_hits) {
		this.tb_hits = tb_hits;
	}
	public String getTb_like_user_index() {
		return tb_like_user_index;
	}
	public void setTb_like_user_index(String tb_like_user_index) {
		this.tb_like_user_index = tb_like_user_index;
	}
	public boolean isTb_inactive() {
		return tb_inactive;
	}
	public void setTb_inactive(boolean tb_inactive) {
		this.tb_inactive = tb_inactive;
	}
	
	
}
