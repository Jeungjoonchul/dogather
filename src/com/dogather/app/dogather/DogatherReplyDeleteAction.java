package com.dogather.app.dogather;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dogather.action.Action;
import com.dogather.action.ActionTo;
import com.dogather.dao.dogather.DogatherDAO;
import com.dogather.util.DogatherReplyPaging;


public class DogatherReplyDeleteAction implements Action {

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int dpr_index = Integer.parseInt(req.getParameter("dpr_index"));
		String page = req.getParameter("page");		
		System.out.println(page);
		int dp_index=Integer.parseInt(req.getParameter("dp_index"));
		DogatherDAO ddao = new DogatherDAO();
		
		
		resp.setCharacterEncoding("utf-8");

		if (ddao.deleteReply(dpr_index)) {
			int totalCnt=ddao.getReplyTotalCnt(dp_index);
			DogatherReplyPaging r = new DogatherReplyPaging(page, totalCnt);
			System.out.println(r.getPage());
			resp.getWriter().print(r.getPage());
		}else {
			resp.getWriter().print("X");
		}

		resp.getWriter().close();
		return null;
	}
	
}
