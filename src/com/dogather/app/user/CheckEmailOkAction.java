package com.dogather.app.user;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dogather.action.Action;
import com.dogather.action.ActionTo;
import com.dogather.dao.user.UserDAO;

public class CheckEmailOkAction implements Action {
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String user_email = req.getParameter("user_email");
		UserDAO udao = new UserDAO();
		PrintWriter out = resp.getWriter();// 응답을 작성하기 위한 객체
		if(udao.check(user_email)) {
			out.write("O");
		}
		else {
			out.write("X");
		}
		out.close();
		return null;
	}
}

