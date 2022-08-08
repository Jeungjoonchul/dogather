package com.dogather.app.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dogather.action.Action;
import com.dogather.action.ActionTo;
import com.dogather.dao.board.BoardDAO;
import com.dogather.dto.board.BoardDTO;
import com.dogather.util.Paging;

public class BoardListAction implements Action{

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		BoardDAO bdao = new BoardDAO();
		
		//현재 페이지(int로 변환할 필요 없음)
		String temp = req.getParameter("page");
		String boardName = "테이블 명";
		
		//페이징 구하는 util, 매개변수는 현재 페이지(null도 가능), 전체 게시글 개수 
		Paging paging = new Paging(temp, bdao.getBoardCnt(boardName));
		
		//paging 객체의 startRow와 pageSize로 전체 게시글 목록 얻음
		List<BoardDTO> list = bdao.getBoard(paging.getStartRow(),paging.getPageSize(),boardName);
		
		//전송을 위한 set
		req.setAttribute("list", list);
		req.setAttribute("totalPage", paging.getTotalPage());
		req.setAttribute("totalCnt", paging.getTotalCnt());
		req.setAttribute("startPage", paging.getStartPage());
		req.setAttribute("endPage", paging.getEndPage());
		req.setAttribute("page", paging.getPage());
		
		//path 및 redirect 설정(forward 방식)
		ActionTo transfer=new ActionTo();
		transfer.setRedirect(false);
		transfer.setPath("");
		return transfer;
	}

}
