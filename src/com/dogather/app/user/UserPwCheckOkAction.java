package com.dogather.app.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dogather.action.Action;
import com.dogather.action.ActionTo;
import com.dogather.dao.user.UserDAO;
import com.dogather.dto.user.UserDTO;

public class UserPwCheckOkAction implements Action {
	
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String user_email = req.getParameter("user_email");
		String user_password = req.getParameter("user_password");
		
		//My page에서 비밀번호 확인이 되었다는 세션 설정.
		//로그아웃시 세션 해제되게 설정해야함
		//유효시간 설정 해야함
		
		//유저 정보를 담아 보낼 DTO설정
		UserDAO udao = new UserDAO();
		UserDTO userInfor = new UserDTO();
		userInfor = udao.getUserInfor(user_email);
		//세션설정
		req.getSession().setAttribute("myInfor", userInfor);
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html charset=utf-8");
		req.getSession().setMaxInactiveInterval(15*16);

		ActionTo transfer = new ActionTo();
		transfer.setRedirect(false);
		transfer.setPath("/app/user/myPage/infor.jsp");

		return transfer;
	}
}
