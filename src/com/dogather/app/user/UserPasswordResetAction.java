package com.dogather.app.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dogather.action.Action;
import com.dogather.action.ActionTo;
import com.dogather.dao.user.UserDAO;

public class UserPasswordResetAction implements Action {

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int user_index = Integer.parseInt(req.getParameter("user_index"));
		String user_password=req.getParameter("user_password");
		String user_email=req.getParameter("user_email");
		UserDAO udao = new UserDAO();

		
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		
		out.print("<script>");
		
		if(udao.resetPassword(user_index,user_password)) {
			out.print("alert('비밀번호 설정이 완료되었습니다');");
			out.print("location.href='"+req.getContextPath()+"/user/login.us?user="+user_email+"';");
		}else {
			out.print("alert('비밀번호 재설정에 실패했습니다')");			
			out.print("location.href='"+req.getContextPath()+"/user/login.us';");
		}
		out.print("</script>");
		out.close();
		return null;
	}
}
