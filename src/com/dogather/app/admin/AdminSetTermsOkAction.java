package com.dogather.app.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dogather.action.Action;
import com.dogather.action.ActionTo;
import com.dogather.dao.terms.TermsDAO;
import com.dogather.dto.terms.TermsDTO;

public class AdminSetTermsOkAction implements Action {

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		TermsDAO tdao=new TermsDAO();
		
		ArrayList<TermsDTO> arr = new ArrayList<TermsDTO>();
		String terms_title1 = req.getParameter("terms_title1");
		String terms_contents1 = req.getParameter("terms_contents1");
		terms_contents1=terms_contents1.replaceAll("네이버", "두게더");
		arr.add(new TermsDTO());
		arr.get(0).setTerms_index(1);
		arr.get(0).setTerms_title(terms_title1);
		arr.get(0).setTerms_contents(terms_contents1);
		
		String terms_title2 = req.getParameter("terms_title2");
		String terms_contents2 = req.getParameter("terms_contents2");
		terms_contents2=terms_contents2.replaceAll("네이버", "두게더");
		arr.add(new TermsDTO());
		arr.get(1).setTerms_index(2);
		arr.get(1).setTerms_title(terms_title2);
		arr.get(1).setTerms_contents(terms_contents2);
		
		String terms_title3 = req.getParameter("terms_title3");
		String terms_contents3 = req.getParameter("terms_contents3");
		terms_contents3=terms_contents3.replaceAll("네이버", "두게더");
		arr.add(new TermsDTO());
		arr.get(2).setTerms_index(3);
		arr.get(2).setTerms_title(terms_title3);
		arr.get(2).setTerms_contents(terms_contents3);
		
		String terms_title4 = req.getParameter("terms_title4");
		String terms_contents4 = req.getParameter("terms_contents4");
		terms_contents4=terms_contents4.replaceAll("네이버", "두게더");
		arr.add(new TermsDTO());
		arr.get(3).setTerms_index(4);
		arr.get(3).setTerms_title(terms_title4);
		arr.get(3).setTerms_contents(terms_contents4);
		
		for (TermsDTO termsDTO : arr) {
			tdao.setTerms(termsDTO);
		}
		
		ActionTo transfer = new ActionTo();
		transfer.setPath(req.getContextPath()+"/admin/set_terms.ad");
		transfer.setRedirect(true);
		return transfer;
	}
	
}
