package com.dogather.app.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dogather.action.Action;
import com.dogather.action.ActionTo;
import com.dogather.dao.user.UserDAO;
import com.dogather.dao.user.UserDTO;

// Controller
public class UserJoinOkAction implements Action{

	// 메소드
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) {
		// 입력 -> 데이터전송 -> [데이터수집 -> 처리 -> 결과전송] -> 출력
		UserDTO user = new UserDTO();
		UserDAO udao = new UserDAO();
		String user_email = req.getParameter("user_email");
		user.setUser_email(user_email);
		user.setUser_nickname(req.getParameter("user_nickname"));
		user.setUser_name(req.getParameter("user_name"));
		user.setUser_password(req.getParameter("user_password"));
		user.setUser_phone(req.getParameter("user_phone"));
		user.setUser_gender(req.getParameter("user_gender"));
		user.setUser_birth_date(req.getParameter("user_birth_date"));
		
		ActionTo transfer = new ActionTo();
		transfer.setRedirect(true);
		if(udao.join(user)) {
			transfer.setPath(req.getContextPath()+"/user/userlogin.us?user_email="+user_email);
		}
		else {
			// localhost:9090/????
			transfer.setPath(req.getContextPath());
		}
		
		return transfer;
	}
	
}
