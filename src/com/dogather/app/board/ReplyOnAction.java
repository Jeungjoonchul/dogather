package com.dogather.app.board;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dogather.action.Action;
import com.dogather.action.ActionTo;
import com.dogather.dao.board.ReplyDAO;
import com.dogather.dto.board.ReplyDTO;
import com.dogather.dto.user.UserDTO;
import com.dogather.util.ReplyPaging;
import com.google.gson.Gson;

public class ReplyOnAction implements Action {

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp,String b_name,String r_name) throws ServletException, IOException {

		int user_index = ((UserDTO)req.getSession().getAttribute("loginUser")).getUser_index();
		int b_index = Integer.parseInt(req.getParameter("b_index"));
		String r_contents = req.getParameter("r_contents");
		r_contents=r_contents.replaceAll("\n", "<br>");

		String page = req.getParameter("page");
		System.out.println(r_name);
		
		
		ReplyDTO reply = new ReplyDTO();
		reply.setUser_index(user_index);
		reply.setB_index(b_index);
		reply.setR_contents(r_contents);
		reply.setR_name(r_name);
		
		ReplyDAO rdao = new ReplyDAO();
		resp.setCharacterEncoding("utf-8");

		if (rdao.replyOn(reply)) {
			int totalCnt=rdao.getReplyCntOnPost(r_name, b_index);
			ReplyPaging r = new ReplyPaging(page, totalCnt);
			resp.getWriter().print(r.getTotalPage());
			
		}else {
			resp.getWriter().print("X");
		}

		resp.getWriter().close();
		return null;
	}

}
