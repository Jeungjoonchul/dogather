package com.dogather.app.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dogather.action.Action;
import com.dogather.action.ActionTo;
import com.dogather.dao.user.UserDAO;

public class UserFindEmailAction implements Action {

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ActionTo transfer=null;
		
		String user_name=req.getParameter("user_name");
		String user_phone=req.getParameter("user_phone");
		user_phone=user_phone.replaceAll("-", "");
		UserDAO udao = new UserDAO();
		
		String user_email = udao.findEmail(user_name,user_phone);
		if(user_email!=null) {
			String[] temp=user_email.split("@");
			user_email="";
			for (int i = 0; i < temp.length; i++) {
				user_email+=temp[i].substring(0, 2);
				for (int j = 0+2; j < temp[i].length(); j++) {
					user_email+="*";
				}
				user_email+="@";
			}			
			user_email=user_email.substring(0, user_email.length()-1);
		}
		
		req.setAttribute("user_email", user_email);
		transfer=new ActionTo();
		transfer.setPath("/app/user/find_email_result.jsp");
		transfer.setRedirect(false);
		return transfer;
	}

}
