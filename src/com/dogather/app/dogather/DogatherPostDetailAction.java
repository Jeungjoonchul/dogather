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
import com.dogather.dto.dogather.DogatherPostDTO;
import com.dogather.dto.dogather.DogatherReplyDTO;
import com.dogather.util.DogatherReplyPaging;
import com.google.gson.Gson;

public class DogatherPostDetailAction implements Action {

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int dp_index=Integer.parseInt(req.getParameter("dp_index"));
		DogatherDAO ddao = new DogatherDAO();
		
		DogatherPostDTO dp = ddao.getPostDetail(dp_index);
		
		DogatherReplyPaging drp = new DogatherReplyPaging(null, ddao.getReplyTotalCnt(dp_index));
		System.out.println("page : "+drp.getPage());
		System.out.println("totlaCnt : "+drp.getTotalCnt());
		System.out.println("pageSize : "+drp.getPageSize());
		System.out.println("startPage : "+drp.getStartPage());
		System.out.println("endPage : "+drp.getEndPage());
		System.out.println("totalPage : "+drp.getTotalPage());
		System.out.println("startRow : "+drp.getStartRow());
		List<DogatherReplyDTO> rl=ddao.getReplyList(drp.getStartRow(),drp.getPageSize(),dp_index);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("dp", dp);
		map.put("rl", rl);
		map.put("totalPage", drp.getTotalPage());
		map.put("totalCnt", drp.getTotalCnt());
		map.put("startPage", drp.getStartPage());
		map.put("endPage", drp.getEndPage());
		map.put("page", drp.getPage());
		Gson gson = new Gson();
		String jsonStr = gson.toJson(map);

		resp.getWriter().print(jsonStr);
		resp.getWriter().close();
		return null;
	}

}
