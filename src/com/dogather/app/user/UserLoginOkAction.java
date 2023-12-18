package com.dogather.app.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.Out;

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

		String keep = req.getParameter("keep");

		boolean al = keep != null ? true : false;

		UserDAO udao = new UserDAO();
		UserDTO user = udao.loginUser(user_email, user_password);

		boolean user_inactive = user.isUser_inactive();
		ActionTo transfer = null;
		if (user_inactive) {
			transfer = new ActionTo();
			transfer.setRedirect(false);
			transfer.setPath("/app/user/release_dormancy.jsp");
		} else {

			req.getSession().setAttribute("loginUser", user);
			resp.setCharacterEncoding("utf-8");
			resp.setContentType("text/html charset=utf-8");
			PrintWriter out = resp.getWriter();

			// 출입증(session)
			// request객체에서 세션을 가져옴 -> 세션을 세팅(key,value)

			// 자동로그인(쿠키)
			if (al) {

				// 자동 로그인 체크 시 쿠키
				Cookie autoLogin_check = new Cookie("autoLogin_check", user_email);
				// 누구인지 확인하기 위해 이메일 주소 저장용 쿠키
				autoLogin_check.setPath(req.getContextPath());
				// 사용자의 컴퓨터에 쿠키를 저장
				resp.addCookie(autoLogin_check);
			}

			String prev = req.getParameter("prev_page");
			String cp = req.getContextPath();
			String cmd = prev.substring(cp.length() + prev.indexOf(cp));
			System.out.println("이전 화면 : "+cmd);
			out.print("<script>");
			if (cmd.contains("user/join")||cmd.contains("user/find")) {
				out.print("alert('" + user.getUser_nickname() + "님 환영합니다!');");
				out.print("location.href='" + req.getContextPath()+"/main'");
			} else {
				out.print("alert('" + user.getUser_nickname() + "님 환영합니다!');");
				out.print("location.href='" + req.getContextPath() + cmd + "'");
			}
			out.print("</script>");
			out.close();
		}
		return transfer;
	}
}
