package com.dogather.app.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dogather.action.Action;
import com.dogather.action.ActionTo;
import com.dogather.dao.board.BoardDAO;
import com.dogather.dto.board.BoardDTO;

public class BoardUpdateAction implements Action {

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp, String b_name, String r_name)
			throws ServletException, IOException {
		int b_index = Integer.parseInt(req.getParameter("b_index"));

		int page= Integer.parseInt(req.getParameter("page"));
		String keyword = req.getParameter("keyword");
		
		BoardDAO bdao = new BoardDAO();
		BoardDTO b = bdao.getPost(b_index, b_name,r_name);
		
		req.setAttribute("page", page);
		req.setAttribute("keyword", keyword);
		req.setAttribute("b", b);
		
		ActionTo transfer = new ActionTo();
		transfer.setRedirect(false);
		String b_path=b_name.substring(2);
		transfer.setPath("/app/board/"+b_path+"/update.jsp");
		
		return transfer;
	}

}
