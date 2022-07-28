package com.dogather.dto.board;

public class BoardDTO {
	//게시글 번호
	int tb_index;
	//게시글 작성자 인덱스
	int user_index;
	
	//게시글 등록일자
	String tb_reg_date;
	
	//게시글 수정 날짜
	String tb_update_date;
	
	//게시글 제목
	String tb_title;
	
	//게시글 내용
	String tb_contents;
	
	//게시글 조회수
	int tb_hits;
	
	//게시글 좋아요 누른 사람
	String tb_like_user_index;
	
	//db에 1이면 true, 0이면 false
	boolean tb_inactive;
	
	
	
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
	
	//db에서 select할 시에는 0 또는 1의 값으로 넘어오므로 1인 경우 true 반환
	//inactive true => 비활성화 된 게시글
	//inactive false => 활성화 된 게시글
	public void setTb_inactive(int tb_inactive) {
		this.tb_inactive = (tb_inactive==1);
	}
}
