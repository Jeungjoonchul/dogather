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
import com.dogather.util.BoardPaging;

public class BoardListAction implements Action {

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp,String b_name,String r_name) throws ServletException, IOException {

		BoardDAO bdao = new BoardDAO();
		
	
		
		String keyword=req.getParameter("keyword");//검색 키워드
		String page = req.getParameter("page");//현재 페이지
		String subject = req.getParameter("subject");
		keyword=keyword==null?"":keyword;
		subject=subject==null?"":subject;

		//페이징 구하는 util, 매개변수는 현재 페이지(null도 가능), 전체 게시글 개수 
		BoardPaging paging = new BoardPaging(page, bdao.getBoardCnt(b_name,keyword,subject));

		//paging 객체의 startRow와 pageSize로 전체 게시글 목록 얻음
		List<BoardDTO> b_list = bdao.getBoard(paging.getStartRow(),paging.getPageSize(),keyword,subject,b_name,r_name);
		//전송을 위한 set
		req.setAttribute("b_list", b_list);
		req.setAttribute("totalPage", paging.getTotalPage());
		req.setAttribute("totalCnt", paging.getTotalCnt());
		req.setAttribute("startPage", paging.getStartPage());
		req.setAttribute("endPage", paging.getEndPage());
		req.setAttribute("page", paging.getPage());
		req.setAttribute("keyword", keyword);
		req.setAttribute("subject", subject);
		
		String b_path=b_name.substring(2);

		//path 및 redirect 설정(forward 방식)
		ActionTo transfer=new ActionTo();
		transfer.setRedirect(false);
		transfer.setPath("/app/board/"+b_path+"/list.jsp");

		return transfer;

	}


}
