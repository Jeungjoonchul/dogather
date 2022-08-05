package com.dogather.app.main;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dogather.action.Action;
import com.dogather.action.ActionTo;

public class MainAction implements Action {

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ActionTo transfer = new ActionTo();
		transfer.setRedirect(false);
		transfer.setPath("/main.jsp");
		return transfer;
	}

}
