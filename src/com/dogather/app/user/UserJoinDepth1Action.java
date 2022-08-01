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

public class UserJoinDepth1Action implements Action {

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		TermsDAO tdao = new TermsDAO();
		List<TermsDTO> terms_list= tdao.selectList();
		System.out.println(terms_list.size());
		req.setAttribute("terms_list", terms_list);
		for (TermsDTO t : terms_list) {
			System.out.println(t.getTerms_index());
			System.out.println(t.getTerms_title());
			System.out.println(t.getTerms_contents());
			System.out.println(t.getTerms_type());
		}
		ActionTo transfer=new ActionTo();
		transfer.setRedirect(false);
		transfer.setPath("/app/user/user_join_depth1.jsp");
		
		return transfer;
	}

}
