package com.dogather.app.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dogather.action.Action;
import com.dogather.action.ActionTo;

public class UserLogoutAction implements Action {

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("여기");
		
		String check = req.getHeader("cookie");
		System.out.println(check);
		if(check!=null) {
			Cookie[] cookies = req.getCookies();
			for (Cookie cookie : cookies) {
				if(cookie.getName().equals("autoLogin_check")) {
					cookie.setValue(null);
					cookie.setMaxAge(0);
					resp.addCookie(cookie);
					break;
				}
			}		
		}
		req.getSession().invalidate();
		
		PrintWriter out = resp.getWriter();
		out.print("<script>alert('로그아웃되었습니다');");
		out.print("location.href='"+req.getContextPath()+"/main'");
		out.print("</script>");
		return null;
	}

}
