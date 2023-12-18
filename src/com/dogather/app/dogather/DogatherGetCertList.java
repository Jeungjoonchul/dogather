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
import com.dogather.dto.dogather.DogatherUserInfoDTO;
import com.dogather.dto.user.UserDTO;
import com.google.gson.Gson;

public class DogatherGetCertList implements Action {

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int dg_index = Integer.parseInt(req.getParameter("dg_index"));
		String year=req.getParameter("year");
		String month=req.getParameter("month");
		month=month.length()==1?"0"+month:month;
		int user_index = ((UserDTO)req.getSession().getAttribute("loginUser")).getUser_index();
		
		DogatherDAO ddao=new DogatherDAO();
		DogatherUserInfoDTO info = ddao.getDgUserInfo(dg_index,user_index);
		String td=info.getDg_user_target_date();
		List<DogatherPostDTO> cl = ddao.getDgCertPostList(dg_index,user_index,year,month);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("cl", cl);
		map.put("td", td);
		Gson gson = new Gson();
		String jsonStr=gson.toJson(map);
		resp.getWriter().print(jsonStr);
		resp.getWriter().close();		
		return null;
	}
}
