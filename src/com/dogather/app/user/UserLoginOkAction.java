package com.dogather.app.user;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dogather.action.Action;
import com.dogather.action.ActionTo;
import com.dogather.dao.user.UserDAO;

public class UserLoginOkAction implements Action {
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		resp.setCharacterEncoding("utf-8");
		// MIME 타입
		resp.setContentType("text/html; charset=utf-8");
		
		UserDAO udao = new UserDAO();
		String user_email = req.getParameter("user_email");
		String user_password = req.getParameter("user_password");
		
		PrintWriter out = resp.getWriter();
//		ActionTo transfer = new ActionTo();
//		transfer.setRedirect(false);
		if(udao.login(user_email,user_password)) {
			req.getSession().setAttribute("loginUser", user_email);
//			transfer.setPath("/app/board/main.jsp");
			
			out.print("<script>");
			// alert('apple님 어서오세요~!');
			out.print("alert('"+user_email+"님 어서오세요~!');");
			// location.href = '???/app/board/main.jsp';
			out.print("location.href = '"+req.getContextPath()+"/board/boardlist.bo';");
			out.print("</script>");
		}
		else {
//			transfer.setPath("/");
			out.print("<script>");
			out.print("location.href = '"+req.getContextPath()+"/';");
			out.print("</script>");
		}
//		return transfer;
		return null;
	}
}



































