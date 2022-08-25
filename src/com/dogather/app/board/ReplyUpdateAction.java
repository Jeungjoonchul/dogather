package com.dogather.app.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dogather.action.Action;
import com.dogather.action.ActionTo;
import com.dogather.dao.board.ReplyDAO;
import com.dogather.dto.board.ReplyDTO;
import com.dogather.dto.user.UserDTO;
import com.dogather.util.ReplyPaging;

public class ReplyUpdateAction implements Action {

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp,String b_name,String r_name) throws ServletException, IOException {

		String r_contents = req.getParameter("r_contents");
		r_contents=r_contents.replaceAll("\n", "<br>");
		int r_index = Integer.parseInt(req.getParameter("r_index"));
	
		ReplyDAO rdao = new ReplyDAO();
		resp.setCharacterEncoding("utf-8");

		if (rdao.updateReply(r_index,r_contents,r_name)) {

			resp.getWriter().print("O");
			
		}else {
			resp.getWriter().print("X");
		}

		resp.getWriter().close();
		return null;
	}

}
