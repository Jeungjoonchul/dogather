package com.dogather.app.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dogather.action.Action;
import com.dogather.action.ActionTo;
import com.dogather.dao.board.BoardDAO;
import com.dogather.dto.board.BoardDTO;

public class FreeBoardUpdateAction implements Action {

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int b_index = Integer.parseInt(req.getParameter("b_index"));
		String b_name = "t_free_board";
		
		BoardDAO bdao = new BoardDAO();
		BoardDTO fb = bdao.getPost(b_index, b_name);
		req.setAttribute("fb", fb);
		
		ActionTo transfer = new ActionTo();
		transfer.setRedirect(false);
		transfer.setPath("/app/board/free_board/update.jsp");
		
		return transfer;
	}

}
