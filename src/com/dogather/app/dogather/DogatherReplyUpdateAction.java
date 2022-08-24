package com.dogather.app.dogather;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dogather.action.Action;
import com.dogather.action.ActionTo;

import com.dogather.dao.dogather.DogatherDAO;

public class DogatherReplyUpdateAction implements Action {

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String dpr_contents = req.getParameter("dpr_contents");
		dpr_contents=dpr_contents.replaceAll("\n", "<br>");
		int dpr_index = Integer.parseInt(req.getParameter("dpr_index"));
	
		DogatherDAO ddao = new DogatherDAO();
		resp.setCharacterEncoding("utf-8");

		if (ddao.updateReply(dpr_index,dpr_contents)) {

			resp.getWriter().print("O");
			
		}else {
			resp.getWriter().print("X");
		}

		resp.getWriter().close();
		return null;
	}
	
}
