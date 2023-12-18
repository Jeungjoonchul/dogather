package com.dogather.app.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dogather.action.Action;
import com.dogather.action.ActionTo;
import com.dogather.dao.user.UserDAO;

public class UserCheckEmailAction implements Action {

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//수집된 user_email
		String user_email=req.getParameter("user_email");
		//DB에 접근할 DAO 설정
		UserDAO udao = new UserDAO();
		
		//view로 보내줄 out 객체 설정
		PrintWriter out = resp.getWriter();

		if(udao.checkEmail(user_email)) {
			//유저가 입력한 email이 사용 가능하다는 뜻(result = 'O')
			out.print("O");
		}else {
			//유저가 입력한 email이 사용 불가능하다는 뜻(result = 'X)
			out.print("X");
		}
		out.close();
		return null;
	}

}
