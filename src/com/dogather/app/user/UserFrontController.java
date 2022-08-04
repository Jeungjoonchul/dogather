package com.dogather.app.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dogather.action.ActionTo;

public class UserFrontController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		doProcess(req, resp);
	}

	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String requestURI = req.getRequestURI(); // ????/board/boardmain.do
		String contextPath = req.getContextPath(); // ????(module명)
		String command = requestURI.substring(contextPath.length()); // /board/boardmain.do
		System.out.println(command);

		ActionTo transfer = null;
		switch (command) {
		case "/user/user_join.us":
			try {
				transfer = new UserJoinAction().execute(req, resp);
			} catch (ServletException e) {
				System.out.println("/user/user_join.us" + e);
			} catch (IOException e) {
				System.out.println("/user/user_join.us" + e);
			}
			break;
			
		case "/user/user_check_email.us":
			try {
				transfer = new UserCheckEmailAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("/user/user_check_email.us" + e);
			}
			break;
			
		case "/user/user_join_ok.us":
			try {
				transfer = new UserJoinOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println(req.getParameter("user_terms_type3"));
				System.out.println("/user/user_join_ok.us" + e);
				e.printStackTrace();
			}
			break;

		case "/user/user_logout.us":
			req.getSession().invalidate();
			PrintWriter out = resp.getWriter();
			out.print("<script>alert('로그아웃되었습니다');");
			out.print("location.href='${cp}");
			out.print("</script>");
			break;
			
		case "/user/user_login.us":
			transfer = new ActionTo();
			transfer.setPath("/app/user/user_login.jsp");
			transfer.setRedirect(false);
			break;
			
		case "/user/user_check_nickname.us":
			try {
				transfer = new UserCheckNicknameAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("/user/user_check_nickname.us" + e);
			}
			break;
			
		case "/user/user_login_ok.us":
			try {
				transfer=new UserLoginOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("/user/user_login_ok.us"+e);
			}
			break;
		}

		// 전송 일괄처리
		if (transfer != null) {
			if (transfer.isRedirect()) {
				resp.sendRedirect(transfer.getPath());
			} else {
				req.getRequestDispatcher(transfer.getPath()).forward(req, resp);
			}
		}
	}

}
