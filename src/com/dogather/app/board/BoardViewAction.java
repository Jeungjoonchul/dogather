package com.dogather.app.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dogather.action.Action;
import com.dogather.action.ActionTo;
import com.dogather.dao.board.BoardDAO;
import com.dogather.dto.board.BoardDTO;
import com.dogather.dto.user.UserDTO;

public class BoardViewAction implements Action {

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int b_index = Integer.parseInt(req.getParameter("b_index"));
		String b_name = "게시판 이름";
		String r_name = "댓글 이름";
		BoardDAO bdao = new BoardDAO();

		
		int user_index = ((UserDTO)req.getSession().getAttribute("loginUser")).getUser_index();

		BoardDTO tb = bdao.getPost(b_index,b_name,r_name);


		if(tb.getUser_index()!=user_index) {
			tb.setB_hits(tb.getB_hits() + 1);
			bdao.updateHits(b_index,b_name);
		}

		
		req.setAttribute("tb", tb);
		
		ActionTo transfer = new ActionTo();
		transfer.setRedirect(false);
		transfer.setPath("경로");
		return transfer;
	}

}
