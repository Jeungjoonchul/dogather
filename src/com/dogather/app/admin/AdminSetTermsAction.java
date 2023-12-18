package com.dogather.app.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dogather.action.Action;
import com.dogather.action.ActionTo;
import com.dogather.dao.terms.TermsDAO;
import com.dogather.dto.terms.TermsDTO;

public class AdminSetTermsAction implements Action {

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		TermsDAO tdao=new TermsDAO();
		List<TermsDTO> list= tdao.selectList();
		req.setAttribute("list", list);
		ActionTo transfer=new ActionTo();
		transfer.setPath("/app/admin/set_terms.jsp");
		transfer.setRedirect(false);
		return transfer;
	}

}
