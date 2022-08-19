package com.dogather.util;

public class BoardPaging {
	// 현재 페이지 번호
	private int page;
	// 전체 게시글 개수
	private int totalCnt;
	// 한 페이지에서 보여줄 개시글의 개수
	private int pageSize = 10;
	// 아래쪽 페이징 처리 부분에 보여질 첫번째 페이지 번호
	private int startPage;
	// 아래쪽 페이징 처리 부분에 보여질 마지막 페이지 번호
	private int endPage;
	// 전체 게시글 개수를 기반으로 한 띄워질 수 있는 가장 마지막 페이지 번호
	private int totalPage;
	// 게시판 페이지에서 가장 첫번째로 보여줄 게시글 번호
	private int startRow;

	// getter, setter
	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getTotalCnt() {
		return totalCnt;
	}

	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	// 파라미터로 page번호와 전체 게시글의 개수를 받아 새로운 페이징 정보 생성
	// 전체 게시글 개수는 BoardDAO에 getBoardCnt 메소드로 얻음
	public BoardPaging(String paramPage, int totalCnt) {
		page = (paramPage == (null)) || (paramPage.equals("")) ? 1 : Integer.parseInt(paramPage);
		this.totalCnt = totalCnt;
		startPage = (page - 1) / 10 * 10 + 1;
		endPage = startPage + 9;
		totalPage = (this.totalCnt - 1) / pageSize + 1;
		endPage = endPage > totalPage ? totalPage : endPage;
		startRow = (page - 1) * pageSize;
	}
}
