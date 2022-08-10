package com.dogather.app.board;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dogather.action.Action;
import com.dogather.action.ActionTo;
import com.dogather.dao.board.ReplyDAO;
import com.dogather.dto.board.ReplyDTO;
import com.google.gson.Gson;
import com.mysql.cj.xdevapi.JsonArray;

public class ReplyOkAction implements Action {

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int user_index = Integer.parseInt(req.getParameter("user_index"));
		int b_index = Integer.parseInt(req.getParameter("b_index"));
		String r_contents = req.getParameter("r_contents");
		String r_name = "t_fb_reply";

		ReplyDTO reply = new ReplyDTO();
		reply.setUser_index(user_index);
		reply.setB_index(b_index);
		reply.setR_contents(r_contents);
		reply.setR_name(r_name);
		
		ReplyDAO rdao = new ReplyDAO();
		List<ReplyDTO> result = new ArrayList<ReplyDTO>();
		if (rdao.replyOn(reply)) {
			result = rdao.getReplies(r_name);

		}
		Gson gson = new Gson();
		String jsonStr = gson.toJson(result);
		
		resp.setCharacterEncoding("utf-8");
		
		resp.getWriter().print(jsonStr);
		resp.getWriter().close();
		return null;
	}

}
