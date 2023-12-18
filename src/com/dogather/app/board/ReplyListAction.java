package com.dogather.app.board;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dogather.action.Action;
import com.dogather.action.ActionTo;
import com.dogather.dao.board.ReplyDAO;
import com.dogather.dto.board.ReplyDTO;
import com.dogather.util.ReplyPaging;
import com.google.gson.Gson;

public class ReplyListAction implements Action {

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp,String b_name,String r_name) throws ServletException, IOException {
		String page = req.getParameter("page");

		int b_index = Integer.parseInt(req.getParameter("b_index"));

		ReplyDAO rdao = new ReplyDAO();
		int totalCnt = rdao.getReplyCntOnPost(r_name, b_index);
		ReplyPaging r = new ReplyPaging(page, totalCnt);
		
		List<ReplyDTO> list=rdao.getReplies(r.getStartRow(), r.getPageSize(), r_name, b_index);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalPage", r.getTotalPage());
		map.put("totalCnt", r.getTotalCnt());
		map.put("startPage", r.getStartPage());
		map.put("endPage", r.getEndPage());
		map.put("page", r.getPage());

		
		Gson gson= new Gson();
		String jsonStr = gson.toJson(map);
		resp.setCharacterEncoding("utf-8");
		resp.getWriter().print(jsonStr);
		resp.getWriter().close();
		return null;
	}

}
