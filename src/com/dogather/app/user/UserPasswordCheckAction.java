package com.dogather.app.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dogather.action.Action;
import com.dogather.action.ActionTo;
import com.dogather.dao.user.UserDAO;

public class UserPasswordCheckAction implements Action {

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int user_index = 1;
		String user_password = req.getParameter("user_password");
		UserDAO udao = new UserDAO();
		String db_password = udao.selectUserPassword(user_index);
		
		System.out.println(user_password);
		
		resp.setCharacterEncoding("utf-8");
		
		PrintWriter out = resp.getWriter();
		
		
		// 현재 비밀번호 일치하는 경우
		if(user_password.equals(db_password)) {
			out.print("O");
		} else {
			out.print("X");
		}
		
		
		out.close();
		return null;
	}
}
