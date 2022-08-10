package com.dogather.app.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dogather.action.Action;
import com.dogather.action.ActionTo;
import com.dogather.dao.user.UserDAO;
import com.dogather.dto.user.UserDTO;

public class UserImforAction implements Action {

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String user_id = req.getParameter("user_email");
		
		//DB에서 정보를 가져올 DAO
		UserDAO udao = new UserDAO();
		
		udao.getUserInfor(user_id);
		
		
		UserDTO udto = new UserDTO();
		//작업중
		

		return null;
	}
}