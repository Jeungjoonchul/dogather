package com.dogather.app.main;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dogather.action.Action;
import com.dogather.action.ActionTo;
import com.dogather.dao.user.UserDAO;
import com.dogather.dto.user.UserDTO;

public class MainAction implements Action {

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ActionTo transfer = new ActionTo();
		String skip_index = req.getParameter("skip_index");
		boolean skip_check = skip_index != null ? true : false;
		// true -> 인덱스 스킵하는 사람
		// false -> 인덱스 보는 사람
		if (skip_check) {
			// 인덱스 다시 보지 않기 쿠키 생성
			Cookie c1 = new Cookie("skip_index", "on");
			// 쿠키의 경로 설정
			c1.setPath(req.getContextPath());
			// 사용자의 컴퓨터에 쿠키 저장(응답)
			resp.addCookie(c1);
		}

		// 자동 로그인 체크 여부
		String user_email = null;

		Cookie[] cookies = req.getCookies();

		for (Cookie c : cookies) {
			if (c.getName().equals("autoLogin_check")) {
				user_email = c.getValue();
				System.out.println("쿠키값 : "+user_email);
				break;
			}
		}
		//user_email = apple@apple.com
		if (req.getSession().getAttribute("loginUser") == null) {
			if (user_email != null) {
				UserDAO udao = new UserDAO();
				UserDTO user = udao.selectUserWithUserEmail(user_email);
				System.out.println("세션값 : "+user.getUser_email());
				req.getSession().setAttribute("loginUser", user);
			}
		}

		transfer.setRedirect(false);
		transfer.setPath("/main.jsp");
		return transfer;
	}

}
