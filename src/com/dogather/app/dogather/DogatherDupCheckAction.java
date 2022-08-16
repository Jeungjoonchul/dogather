package com.dogather.app.dogather;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dogather.action.Action;
import com.dogather.action.ActionTo;
import com.dogather.dao.dogather.DogatherDAO;

public class DogatherDupCheckAction implements Action {

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String dg_title = req.getParameter("dg_title");
		
		DogatherDAO ddao=new DogatherDAO();
		
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=utf-8");
		
		PrintWriter out = resp.getWriter();
		
		if(ddao.dgDupCheck(dg_title)) {
			out.print("O");
			System.out.println("O");
		}else {
			out.print("X");
			System.out.println("X");
		}
		out.close();
		return null;
	}
	
}
