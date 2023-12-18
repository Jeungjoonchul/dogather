package com.dogather.app.dogather;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dogather.action.Action;
import com.dogather.action.ActionTo;
import com.dogather.dao.dogather.DogatherDAO;
import com.dogather.dto.dogather.DogatherReplyDTO;
import com.dogather.dto.user.UserDTO;
import com.dogather.util.DogatherReplyPaging;
import com.google.gson.Gson;

public class DogatherReplyOnAction implements Action {

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int user_index = ((UserDTO)req.getSession().getAttribute("loginUser")).getUser_index();
		int dp_index = Integer.parseInt(req.getParameter("dp_index"));
		String dpr_contents=req.getParameter("dpr_contents");
		dpr_contents=dpr_contents.replaceAll("\n", "<br>");
		String page=req.getParameter("page");
		
		
		DogatherReplyDTO dr = new DogatherReplyDTO();
		dr.setUser_index(user_index);
		dr.setDp_index(dp_index);
		dr.setDpr_contents(dpr_contents);
		DogatherDAO ddao = new DogatherDAO();
		

		if(ddao.dpReplyOn(dr)) {

			int tc=ddao.getReplyTotalCnt(dp_index);
			DogatherReplyPaging p=new DogatherReplyPaging(page, tc);
			resp.getWriter().print(p.getTotalPage());
			
		}else {
			resp.getWriter().print("X");
		}
		resp.getWriter().close();
		return null;
	}
}
