package com.dogather.app.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dogather.action.ActionTo;

public class AdminFrontController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		doProcess(req, resp);
	}

	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html charset=utf-8");
		
		String requestURI = req.getRequestURI(); // ????/board/boardmain.do
		String contextPath = req.getContextPath(); // ????(module명)
		String command = requestURI.substring(contextPath.length()); // /board/boardmain.do
		System.out.println(command);

		ActionTo transfer = null;
		switch (command) {
		case "/admin/set_terms.ad":
			try {
				transfer=new AdminSetTermsAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println(command+" : "+e);
				e.printStackTrace();
			}
			break;
		case "/admin/set_terms_ok.ad":
			try {
				transfer=new AdminSetTermsOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println(command+" : "+e);
				e.printStackTrace();
			}
			break;
		}

		// 전송 일괄처리
		if (transfer != null) {
			if (transfer.isRedirect()) {
				resp.sendRedirect(transfer.getPath());
			} else {
				req.getRequestDispatcher(transfer.getPath()).forward(req, resp);
			}
		}
	}

}
