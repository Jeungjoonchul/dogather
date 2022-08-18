package com.dogather.app.dogather;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dogather.action.Action;
import com.dogather.action.ActionTo;
import com.dogather.dao.dogather.DogatherDAO;
import com.dogather.dto.dogather.DogatherDTO;

public class DogatherDetailAction implements Action {

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int dg_index = Integer.parseInt(req.getParameter("dg_index"));
//		String page = req.getParameter("page");
//		String criteria_key = req.getParameter("criteria_key");
//		String align = req.getParameter("align");
//		String keyword = req.getParameter("keyword");
//		String category_index = req.getParameter("category_index");

		DogatherDAO ddao = new DogatherDAO();
		
		//dg_index에 해당하는 dogather
		DogatherDTO dg = ddao.getDetail(dg_index);
		req.setAttribute("dg", dg);
		
		//dg에 가입한 사람 List
		List<Integer> members = ddao.getDgMembers(dg_index);
		req.setAttribute("members", members);
		ActionTo transfer = new ActionTo();
		transfer.setRedirect(false);
		transfer.setPath("/app/dg/detail.jsp");
		return transfer;
	}
	
}
