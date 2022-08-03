package com.dogather.app.user;

import java.io.IOException;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dogather.action.Action;
import com.dogather.action.ActionTo;
import com.dogather.dao.user.UserDAO;
import com.dogather.dto.user.UserDTO;

public class UserJoinOkAction implements Action {

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//데이터 수집
		//user_term_selective1, user_term_selective2
		//user_email, user_nickname, user_name, user_password, user_phone
		//user_gender, user_birth_date, user_interest, user_interest_etc, user_intro
		//zip_code, address(address1, address2, address3, address4), address_detail, address_extra
		String s_user_term_selective1=req.getParameter("user_term_selective1");
		int user_term_selective1=s_user_term_selective1.equalsIgnoreCase("true")?1:0;
		String s_user_term_selective2=req.getParameter("user_term_selective2");
		int user_term_selective2=s_user_term_selective2.equalsIgnoreCase("true")?1:0;
		
		String user_email=req.getParameter("user_email");
		String user_nickname=req.getParameter("user_nickname");
		String user_name=req.getParameter("user_name");
		String user_password=req.getParameter("user_password");
		String user_phone=req.getParameter("user_phone");
		String user_gender=req.getParameter("user_gender");
		String user_birth_date=req.getParameter("user_birth_date");
		
		String[] user_interest_arr=req.getParameterValues("user_interest");
		String user_interest_etc=req.getParameter("user_interest_etc");
		String user_interest ="";
		for (int i = 0; i < user_interest_arr.length; i++) {
			user_interest+=user_interest_arr[i]+",";
		}
		
		user_interest+=user_interest_etc;
		
		String user_intro=req.getParameter("user_intro");
		String zip_code=req.getParameter("zip_code");
		String[] address=req.getParameter("address").split(" ");

		String address1=address[0];
		String address2="";
		String address3="";
		String address4="";
		for (int i = 1; i < address.length; i++) {
			if(Pattern.matches("^[가-힣0-9]+[시군구]{1}$", address[i])) {
				address2=address[i];
				continue;
			}
			if(Pattern.matches("^[가-힣0-9]+[읍면동]{1}$", address[i])) {
				address3=address[i];
				continue;
			}
			address4+=address[i]+" ";
		}
		address4=address4.trim();

		String address_detail=req.getParameter("address_detail");
		String address_extra=req.getParameter("address_extra");
		
		UserDTO user = new UserDTO();
		user.setUser_term_selective1(user_term_selective1);
		user.setUser_term_selective2(user_term_selective2);
		user.setUser_email(user_email);
		user.setUser_nickname(user_nickname);
		user.setUser_name(user_name);
		user.setUser_password(user_password);
		user.setUser_phone(user_phone);
		user.setUser_gender(user_gender);
		user.setUser_birth_date(user_birth_date);
		user.setUser_interest(user_interest);
		user.setUser_intro(user_intro);
		user.setZip_code(zip_code);
		user.setAddress1(address1);
		user.setAddress2(address2);
		user.setAddress3(address3);
		user.setAddress4(address4);
		user.setAddress_detail(address_detail);
		user.setAddress_extra(address_extra);
		
		
		UserDAO udao=new UserDAO();
		ActionTo transfer = new ActionTo();
		transfer.setRedirect(true);
		if(udao.insertUser(user)) {
			//회원가입 성공
			//경로, 전송방법 설정
			transfer.setPath(req.getContextPath()+"/user/user_login.us?user_email="+user_email);
		}else {
			//회원가입 실패
			//경로, 전송방법 설정
			transfer.setPath(req.getContextPath());
		}
		//테스트, 유효성, 중복검사, 로그인(세션 범위)
		//유효성 검사+중복 검사 백 프론트 합치는 방법(태그 등등,,)
		
		return transfer;
	}
}
