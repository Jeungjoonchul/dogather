package com.dogather.app.user;

import java.io.IOException;
import java.io.PrintWriter;
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
		String s_user_term_selective1=req.getParameter("user_terms_type3");
		int user_term_selective1=s_user_term_selective1!=null?1:0;
		System.out.println("선택약관1:"+s_user_term_selective1+"("+user_term_selective1+")");
		String s_user_term_selective2=req.getParameter("user_terms_type4");
		int user_term_selective2=s_user_term_selective2!=null?1:0;
		System.out.println("선택약관2:"+s_user_term_selective2+"("+user_term_selective2+")");
		
		String user_email=req.getParameter("user_email");
		System.out.println("이메일 : "+user_email);
		String user_nickname=req.getParameter("user_nickname");
		System.out.println("닉네임 : "+user_nickname);
		String user_name=req.getParameter("user_name");
		System.out.println("이름 : "+user_name);
		String user_password=req.getParameter("user_password");
		System.out.println("비밀번호 : "+user_password);
		String user_phone=req.getParameter("user_phone");
		System.out.println(user_phone);
		String[] user_phone_arr=user_phone.split("-");
		user_phone="";
		for (int i = 0; i < user_phone_arr.length; i++) {
			user_phone+=user_phone_arr[i];
		}
		System.out.println("휴대폰 : "+user_phone);
		String user_gender=req.getParameter("user_gender");
		System.out.println("성별 : "+user_gender);
		String user_birth_date=req.getParameter("user_birth_date");
		System.out.println("생년월일 : "+user_birth_date);
		String[] user_interest_arr=req.getParameterValues("user_interest");
		String user_interest_etc=req.getParameter("user_interest_etc");
		String user_interest ="";
		if(user_interest_arr==null&&(user_interest_etc==null||user_interest_etc.equals(""))){
			user_interest=null;
		}else {
			if(user_interest_arr!=null) {
				for (int i = 0; i < user_interest_arr.length; i++) {
					user_interest+=user_interest_arr[i]+",";
				}
			}
		
			if(user_interest_etc==null||user_interest_etc.equals("")) {
				user_interest=user_interest.substring(0, user_interest.length()-1);
			}else {
				user_interest+=user_interest_etc;
			}
		}
		System.out.println("관심사 : "+user_interest);
		String user_intro=req.getParameter("user_intro");
		if(user_intro==null||user_intro.equals("")) {
			user_intro=null;
		}
		System.out.println("자기 소개 : "+user_intro);
		String zip_code=req.getParameter("zip_code");
		System.out.println("우편번호 : "+zip_code);
		String address_default=req.getParameter("address_default");
		System.out.println("기본 주소 : "+address_default);
		String address_detail=req.getParameter("address_detail");
		System.out.println("상세 주소 : "+address_detail);
		String address_extra=req.getParameter("address_extra");
		if(address_extra==null||address_extra.equals("")) {
			address_extra=null;
		}
		System.out.println("참고 주소 : "+address_extra);
				
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
		user.setAddress_default(address_default);
		user.setAddress_detail(address_detail);
		user.setAddress_extra(address_extra);
		user.setUser_buddies("");
		user.setUser_block_list("");
		
		
		UserDAO udao=new UserDAO();
		
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		
		out.print("<script>");
		if(udao.insertUser(user)) {
			//회원가입 성공
			//경로, 전송방법 설정
			out.print("alert('두개더의 가족이 되신 걸 환영합니다!!');");
			out.print("location.href='"+req.getContextPath()+"/user/login.us?user="+user_email+"';");
		}else {
			//회원가입 실패
			//경로, 전송방법 설정
			String prev = req.getParameter("prev_page");
			String cp = req.getContextPath();
			String cmd = prev.substring(cp.length() + prev.indexOf(cp));
			out.print("alert('회원 가입에 실패했습니다 ㅠㅠ 다시 시도해주세요!')");			
			out.print("location.href='"+req.getContextPath()+cmd+"';");
		}
		out.print("</script>");
		out.close();
		return null;

	}
}
