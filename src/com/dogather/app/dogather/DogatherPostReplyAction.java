package com.dogather.app.dogather;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dogather.action.Action;
import com.dogather.action.ActionTo;
import com.dogather.dao.dogather.DogatherDAO;
import com.dogather.dto.dogather.DogatherReplyDTO;
import com.dogather.util.DogatherReplyPaging;
import com.google.gson.Gson;

public class DogatherPostReplyAction implements Action {

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		DogatherDAO ddao = new DogatherDAO();
		
		int dp_index=Integer.parseInt(req.getParameter("dp_index"));
		System.out.println("dp_index : "+dp_index);
		String page=req.getParameter("page");
		System.out.println("page : "+page);
		DogatherReplyPaging p=new DogatherReplyPaging(page, ddao.getReplyTotalCnt(dp_index));
		
		List<DogatherReplyDTO> rl = ddao.getReplyList(p.getStartRow(), p.getPageSize(), dp_index);

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("rl", rl);
		map.put("totalPage", p.getTotalPage());
		map.put("totalCnt", p.getTotalCnt());
		map.put("startPage", p.getStartPage());
		map.put("endPage", p.getEndPage());
		map.put("page", p.getPage());
		Gson gson = new Gson();
		String gsonStr = gson.toJson(map);
		resp.getWriter().print(gsonStr);
		resp.getWriter().close();
		return null;
	}

}
