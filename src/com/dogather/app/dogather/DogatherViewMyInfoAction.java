package com.dogather.app.dogather;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dogather.action.Action;
import com.dogather.action.ActionTo;
import com.dogather.dao.dogather.DogatherDAO;
import com.dogather.dto.dogather.DogatherPostDTO;
import com.dogather.dto.dogather.DogatherUserInfoDTO;
import com.dogather.dto.user.UserDTO;

public class DogatherViewMyInfoAction implements Action {

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ActionTo transfer=new ActionTo();
		transfer.setPath("/app/dg/view_my_info.jsp");
		transfer.setRedirect(false);
		int dg_index = Integer.parseInt(req.getParameter("dg_index"));
		int user_index = ((UserDTO)req.getSession().getAttribute("loginUser")).getUser_index();
		
		DogatherDAO ddao = new DogatherDAO();
		
		//유저가 쓴 글 개수,유저가 쓴 리뷰 개수,유저 목표,목표 완성 날짜,가입날짜
		DogatherUserInfoDTO info = ddao.getDgUserInfo(dg_index,user_index);
		
		//유저가 쓴 후기 List
		List<DogatherPostDTO> cl = ddao.getDgCertPostList(dg_index,user_index);
		
		req.setAttribute("info", info);
		req.setAttribute("cl", cl);
		
		return transfer;
	}

}
