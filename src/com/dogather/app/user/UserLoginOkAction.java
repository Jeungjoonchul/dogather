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

public class UserLoginOkAction implements Action {

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 로그인 성공했을 때만 들어옴

		// 데이터 수집 : user_email, user_password, keep
		// 데이터 null 일 경우
		String user_email = req.getParameter("user_email");
		String user_password = req.getParameter("user_password");
		System.out.println(user_email);
		System.out.println(user_password);
		String keep = req.getParameter("keep");
		boolean al = keep == null ? false : true;
		System.out.println("쿠키 : "+al);
		UserDAO udao = new UserDAO();
		UserDTO user = udao.loginUser(user_email, user_password);
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html charset=utf-8");
		PrintWriter out = resp.getWriter();

		// 출입증(session)
		// request객체에서 세션을 가져옴 -> 세션을 세팅(key,value)
		req.getSession().setAttribute("loginUser", user);
		
		// 자동로그인(쿠키)
		if (al) {
			
			Cookie autoLogin_check = new Cookie("autoLogin_check", "on");
			autoLogin_check.setMaxAge(60 * 60 * 24 * 30);
			autoLogin_check.setPath(req.getContextPath());
			resp.addCookie(autoLogin_check);
		}
		out.print("<script>");
		out.print("alert('" + user.getUser_nickname() + "님 환영합니다!');");
		out.print("location.href='" + req.getContextPath() + "/main';");
		out.print("</script>");

		return null;
	}
}
