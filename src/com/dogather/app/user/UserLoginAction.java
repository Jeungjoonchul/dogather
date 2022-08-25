package com.dogather.app.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dogather.action.Action;
import com.dogather.action.ActionTo;
import com.dogather.dao.user.UserDAO;
import com.dogather.dto.user.UserDTO;

public class UserLoginAction implements Action {

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Cookie[] cookies = req.getCookies();
		String user_email = null;
		
		for (Cookie c : cookies) {
			if(c.getName().equals("autoLogin_check")) {
				user_email=c.getValue();
				break;
			}
		}
		
		ActionTo transfer = null;
		
		if(user_email==null) {
			
			System.out.println(req.getHeader("referer"));
			req.setAttribute("prev_page", req.getHeader("referer"));
			transfer=new ActionTo();
			transfer.setPath("/app/user/login.jsp");
			transfer.setRedirect(false);
		}else {
			
			UserDAO udao=new UserDAO();
			UserDTO user = udao.selectUserWithUserEmail(user_email);
			req.getSession().setAttribute("loginUser", user);
			String prev=req.getHeader("referer");
			String cp = req.getContextPath();
			String cmd=prev.substring(cp.length()+prev.indexOf(cp));
			resp.setCharacterEncoding("utf-8");
			resp.setContentType("text/html; charset=utf-8");
			PrintWriter out = resp.getWriter();
			out.print("<script>");
			out.print("location.href='" + req.getContextPath() + cmd + "'");
			out.print("</script>");
			out.close();
		}
		
		return transfer;
	}
}
