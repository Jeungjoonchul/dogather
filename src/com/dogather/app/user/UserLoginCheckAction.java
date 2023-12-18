package com.dogather.app.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dogather.action.Action;
import com.dogather.action.ActionTo;
import com.dogather.dao.user.UserDAO;
import com.dogather.dto.user.UserDTO;

public class UserLoginCheckAction implements Action {

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String user_email = req.getParameter("user_email");
		String user_password = req.getParameter("user_password");
		System.out.println(user_email);
		System.out.println(user_password);
		UserDAO udao = new UserDAO();
		
		PrintWriter out = resp.getWriter();
		UserDTO user = udao.selectUserWithUserInfo(user_email,user_password);
		
		if(user==null) {
			out.print("X");
		}else {
			if(user.isUser_inactive()==true&&user.getUser_inactive_reason().equals("withdrawal")) {				
				out.print("X");
			}else if(user.isUser_inactive()==false){
				out.print("O");
			}
		}
		out.close();
		return null;
	}
}
