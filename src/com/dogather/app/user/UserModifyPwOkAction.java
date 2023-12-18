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

public class UserModifyPwOkAction implements Action {

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//데이터 수집
		String user_email=req.getParameter("user_email");
		System.out.println("이메일 : "+user_email);
		String m_user_password=req.getParameter("user_password");
		System.out.println("비밀번호 : "+m_user_password);
		
		//유저 정보를 가져오고 보낼 DTO설정
		//바뀐 정보를 dto에 새로 포장
		UserDAO udao = new UserDAO();
		UserDTO userInfor = new UserDTO();
		userInfor = udao.getUserInfor(user_email);
		userInfor.setUser_password(m_user_password);

		//sql명령문으로 업데이트
		udao.updateUserPw(userInfor);
		
		//세션 재설정
		req.getSession().setAttribute("loginUser", userInfor);
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html charset=utf-8");
		PrintWriter out = resp.getWriter();
		
		out.print("<script>");
		out.print("alert('비밀번호가 변경되었습니다.');");
		out.print("location.href='" + req.getContextPath()+"/app/user/myPage/password.jsp'");
		out.print("</script>");
		out.close();


		return null;
	}
}
