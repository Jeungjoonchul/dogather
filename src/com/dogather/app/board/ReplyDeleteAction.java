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

public class ReplyDeleteAction implements Action {

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp,String b_name,String r_name) throws ServletException, IOException {
		String r_index = req.getParameter("r_index");
		String page = req.getParameter("page");
		int b_index=Integer.parseInt(req.getParameter("b_index"));
		
		
		ReplyDAO rdao = new ReplyDAO();
		
		
		resp.setCharacterEncoding("utf-8");

		if (rdao.deleteReply(r_index,r_name)) {
			int totalCnt=rdao.getReplyCntOnPost(r_name, b_index);
			ReplyPaging r = new ReplyPaging(page, totalCnt);
			resp.getWriter().print(r.getPage());
		}else {
			resp.getWriter().print("X");
		}

		resp.getWriter().close();
		return null;
	}

}
