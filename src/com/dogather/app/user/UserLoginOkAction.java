package com.dogather.app.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dogather.action.Action;
import com.dogather.action.ActionTo;
import com.dogather.dao.user.UserDAO;
import com.dogather.dto.user.UserDTO;

public class UserLoginOkAction implements Action {

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//데이터 수집 : user_email, user_password, keep
		//데이터 null 일 경우
		String user_email = req.getParameter("user_email");
		String user_password = req.getParameter("user_password");
		//user_email = dbrlgus@naver.com
		//user_password = asdf1234!
		String keep = req.getParameter("keep");
		keep = keep==null?"off":"on";

		
		UserDAO udao= new UserDAO();
		UserDTO loginUser = udao.loginUser(user_email,user_password);
		
		if(loginUser.getUser_index()!=0) {
			
		}else {
			
		}
		
		return null;
	}
}
