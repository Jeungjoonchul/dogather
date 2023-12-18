package com.dogather.app.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dogather.action.Action;
import com.dogather.action.ActionTo;
import com.dogather.dao.user.UserDAO;
import com.dogather.dto.user.UserDTO;
import com.dogather.util.Sms;

public class UserFindPasswordAction implements Action {

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ActionTo transfer=null;
		
		String user_email=req.getParameter("user_email");
		String user_phone=req.getParameter("user_phone");
		user_phone=user_phone.replaceAll("-", "");
		String user_name=req.getParameter("user_name");
		
		UserDAO udao=new UserDAO();
		String code=null;
		UserDTO user=udao.findPassword(user_email,user_phone,user_name);
		if(user!=null) {
			Sms sms=new Sms();
			code=sms.sendCode(user_phone);
		}
		req.setAttribute("user_index", user.getUser_index());
		req.setAttribute("user_email", user.getUser_email());
		req.setAttribute("code", code);
		transfer = new ActionTo();
		transfer.setPath("/app/user/find_password_result.jsp");
		transfer.setRedirect(false);
		return transfer;
	}
}
