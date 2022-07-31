package com.dogather.dto.board;

public class BoardDTO {
	//게시글 번호
	private int tb_index;
	//게시글 작성자 인덱스
	private int user_index;
	
	//게시글 등록일자
	private String tb_reg_date;
	
	//게시글 수정 날짜
	private String tb_update_date;
	
	//게시글 제목
	private String tb_title;
	
	//게시글 내용
	private String tb_contents;
	
	//게시글 조회수
	private int tb_hits;
	
	//게시글 좋아요 누른 사람
	private String tb_like_user_index;
	
	//db에 1이면 true, 0이면 false
	private boolean tb_inactive;
	
	private String tb_files;

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

	public void setTb_inactive(int tb_inactive) {
		this.tb_inactive = (tb_inactive==1);
	}

	public String getTb_files() {
		return tb_files;
	}

	public void setTb_files(String tb_files) {
		this.tb_files = tb_files;
	}
	
	
}
