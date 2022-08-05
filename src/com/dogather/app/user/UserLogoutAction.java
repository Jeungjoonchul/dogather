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
		Cookie[] cookies = req.getCookies();
		Cookie c = null;
		for (Cookie cookie : cookies) {
			if(cookie.getName().equals("autoLogin_check")) {
				cookie.setMaxAge(0);
				c=cookie;
				break;
			}
		}			
		req.getSession().invalidate();
		resp.addCookie(c);
//		PrintWriter out = resp.getWriter();
//		out.print("<script>alert('로그아웃되었습니다');");
//		out.print("location.href='"+req.getContextPath()+"/main'");
//		out.print("</script>");
		ActionTo transfer = new ActionTo();
		transfer.setRedirect(false);
		transfer.setPath(req.getContextPath()+"/main");
		return transfer;
	}

}
