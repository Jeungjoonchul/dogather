package com.dogather.app.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dogather.action.Action;
import com.dogather.action.ActionTo;
import com.dogather.dao.user.UserDAO;
import com.dogather.dto.user.UserDTO;

public class UserImforAction implements Action {

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String user_id = req.getParameter("user_email");
		
		//DB에서 정보를 가져올 DAO
		UserDAO udao = new UserDAO();
		UserDTO userInfor = new UserDTO();
		
		userInfor = udao.getUserInfor(user_id);
		req.setAttribute("MyInfor_nickname", userInfor.getUser_nickname());
		req.setAttribute("MyInfor_phone", userInfor.getUser_phone());
		req.setAttribute("MyInfor_gender", userInfor.getUser_gender());
		req.setAttribute("MyInfor_birthDate", userInfor.getUser_birth_date());
		req.setAttribute("MyInfor_zipCode", userInfor.getZip_code());
		req.setAttribute("MyInfor_addressDefault", userInfor.getAddress_default());
		req.setAttribute("MyInfor_addressDetail", userInfor.getAddress_detail());
		req.setAttribute("MyInfor_addressExtra", userInfor.getAddress_extra());

		
		System.out.println("여기까지");
//		ActionTo transfer = new ActionTo();
//		transfer.setRedirect(false);
//		transfer.setPath("/app/user/user_myPage_modifyMyImfor.jsp");
		

//		userInfor.getUser_nickname();
//		userInfor.getUser_name();
////		userInfor.getUser_password();
//		userInfor.getUser_phone();
//		userInfor.getUser_gender();
//		userInfor.getUser_birth_date();
//		userInfor.getZip_code();
//		userInfor.getAddress_default();
//		
//		userInfor.getAddress_detail();
//		userInfor.getAddress_extra();

		return null;
	}
}