package com.dogather.app.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
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
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html charset=utf-8");
		
		String requestURI = req.getRequestURI(); // ????/board/boardmain.do
		String contextPath = req.getContextPath(); // ????(module명)
		String command = requestURI.substring(contextPath.length()); // /board/boardmain.do
		System.out.println(command);

		ActionTo transfer = null;
		switch (command) {
		case "/user/join.us":
			try {
				transfer = new UserJoinAction().execute(req, resp);
			} catch (ServletException e) {
				System.out.println(command+" : "+e);
				e.printStackTrace();
			} catch (IOException e) {
				System.out.println(command+" : "+e);
				e.printStackTrace();
			}
			break;
			
		case "/user/check_email.us":
			try {
				transfer = new UserCheckEmailAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println(command+" : "+e);
				e.printStackTrace();
			}
			break;
			
			
		case "/user/check_nickname.us":
			try {
				transfer = new UserCheckNicknameAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println(command+" : "+e);
				e.printStackTrace();
			}
			break;
			
		case "/user/join_ok.us":
			try {
				transfer = new UserJoinOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println(command+" : "+e);
				e.printStackTrace();
			}
			break;
		case "/user/logout.us":
			Cookie[] cookies = req.getCookies();
			for (Cookie cookie : cookies) {
				if(cookie.getName().equals("autoLogin_check")) {
					cookie.setMaxAge(0);

					cookie.setPath(req.getContextPath());
					resp.addCookie(cookie);
					break;
				}
			}			
			String prev = req.getHeader("referer");

			String cmd = prev.substring(contextPath.length()+prev.indexOf(contextPath));

			req.getSession().invalidate();
			PrintWriter out = resp.getWriter();
			out.print("<script>alert('로그아웃되었습니다');");
			out.print("location.href='"+req.getContextPath()+cmd+"'");
			out.print("</script>");
		
			break;
			
//		case "/user/login.us":
//			transfer = new ActionTo();
//			req.setAttribute("prev_page", req.getHeader("referer"));
//			transfer.setPath("/app/user/login.jsp");
//			transfer.setRedirect(false);
//			break;
			case "/user/login.us":
			try {
				transfer = new UserLoginAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println(command+" : "+e);
				e.printStackTrace();
			}
			break;
					
		case "/user/login_ok.us":
			try {
				transfer=new UserLoginOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println(command+" : "+e);
				e.printStackTrace();
			}
			break;
			
		case "/user/login_check.us":
			try {
				transfer=new UserLoginCheckAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println(command+" : "+e);
				e.printStackTrace();
			}
			break;
		case "/user/myPage.us":
			transfer = new ActionTo();
			transfer.setPath("/app/user/myPage_Main.jsp");
			transfer.setRedirect(false);
			break;
			
		case "/user/pwCheck.us":
			try {
				transfer=new UserPwCheckAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println(command+" : "+e);
			}
			break;
			
		case "/user/pwCheck_ok.us":
			try {
				transfer=new UserPwCheckOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println(command+" : "+e);
			}
			break;
		case "/user/modify_ok.us":
			try {
				transfer = new UserModifyOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println(command+" : "+e);
			}
			break;
		case "/user/info.us":
			transfer = new ActionTo();
			transfer.setPath("/app/user/myPage/infor.jsp");
			transfer.setRedirect(false);
			break;
		case "/user/pw.us":
			transfer = new ActionTo();
			transfer.setPath("/app/user/myPage/password.jsp");
			transfer.setRedirect(false);
			break;
		case "/user/modifyPw_ok.us":
			try {
				transfer = new UserModifyPwOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println(command+" : "+e);
			}
		case "/user/find_email.us":
			transfer=new ActionTo();
			transfer.setPath("/app/user/find_email.jsp");
			transfer.setRedirect(false);
			break;
		case "/user/find_password.us":
			transfer=new ActionTo();
			transfer.setPath("/app/user/find_password.jsp");
			transfer.setRedirect(false);
			break;
		case "/user/find_email_submit.us":
			try {
				transfer=new UserFindEmailAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println(command+" : "+e);
				e.printStackTrace();
			}
			break;
		case "/user/find_password_cert.us":
			try {
				transfer=new UserFindPasswordAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println(command+" : "+e);
				e.printStackTrace();
			}
			break;
			
		case "/user/password_reset.us":
			try {
				transfer=new UserPasswordResetAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println(command+" : "+e);
				e.printStackTrace();
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
