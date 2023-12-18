package com.dogather.app.user;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dogather.action.Action;
import com.dogather.action.ActionTo;
import com.dogather.dao.terms.TermsDAO;
import com.dogather.dto.terms.TermsDTO;

public class UserJoinAction implements Action {

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// db에 t_terms에 접근하기 위한 DAO
		TermsDAO tdao = new TermsDAO();

		// selectList라는 메소드를 호출하여 t_terms에 있는 데이터를 가져와서 각 행 별로TermsDTO 객체로 포장 후 List에 담기
		List<TermsDTO> terms_list = tdao.selectList();
		
		// 가져온 terms_list 데이터를 "terms_list"
		req.setAttribute("terms_list", terms_list);

		ActionTo transfer = new ActionTo();
		transfer.setRedirect(false);
		transfer.setPath("/app/user/join.jsp");

		return transfer;
	}

}
