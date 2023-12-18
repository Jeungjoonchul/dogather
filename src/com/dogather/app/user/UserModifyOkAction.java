package com.dogather.app.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dogather.action.Action;
import com.dogather.action.ActionTo;
import com.dogather.dao.user.UserDAO;
import com.dogather.dto.user.UserDTO;

public class UserModifyOkAction implements Action {
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//데이터 수집
		String user_email=req.getParameter("user_email");
		System.out.println("이메일 : "+user_email);
		//수정된 데이터
		String m_user_nickname=req.getParameter("user_nickname");
		System.out.println("닉네임 : "+m_user_nickname);
		String m_user_phone=req.getParameter("user_phone");
		String[] m_user_phone_arr=m_user_phone.split("-");
		m_user_phone="";
		for (int i = 0; i < m_user_phone_arr.length; i++) {
			m_user_phone+=m_user_phone_arr[i];
		}
		System.out.println("휴대폰 : "+m_user_phone);
		String m_zip_code=req.getParameter("zip_code");
		System.out.println("우편번호 : "+m_zip_code);
		String m_address_default=req.getParameter("address_default");
		System.out.println("기본 주소 : "+m_address_default);
		String m_address_detail=req.getParameter("address_detail");
		System.out.println("상세 주소 : "+m_address_detail);
		String m_address_extra=req.getParameter("address_extra");
		if(m_address_extra==null||m_address_extra.equals("")) {
			m_address_extra=null;
		}
		System.out.println("참고 주소 : "+m_address_extra);
		
		
		//유저 정보를 가져오고 보낼 DTO설정
		//바뀐 정보를 dto에 새로 포장
		UserDAO udao = new UserDAO();
		UserDTO userInfor = new UserDTO();
		userInfor = udao.getUserInfor(user_email);
		userInfor.setUser_nickname(m_user_nickname);
		userInfor.setUser_phone(m_user_phone);
		userInfor.setZip_code(m_zip_code);
		userInfor.setAddress_default(m_address_default);
		userInfor.setAddress_detail(m_address_detail);
		userInfor.setAddress_extra(m_address_extra);

		//sql명령문으로 업데이트
		udao.updateUser(userInfor);
		
		//바뀐 정보로 새로운 세션 설정
		req.getSession().setAttribute("myInfor", userInfor);
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html charset=utf-8");
		req.getSession().setMaxInactiveInterval(15*16);
		
		//다시 화면으로 보내주기
		ActionTo transfer = new ActionTo();
		transfer.setRedirect(false);
		transfer.setPath("/app/user/myPage/infor.jsp");

		return transfer;
	}
}
