package com.dogather.app.dogather;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dogather.action.ActionTo;

public class DogatherFrontController extends HttpServlet {

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
		case "/dg/front.dg":
			transfer=new ActionTo();
			transfer.setPath("/app/dg/front.jsp");
			transfer.setRedirect(false);
			break;
		case "/dg/create.dg":
			transfer=new ActionTo();
			transfer.setPath("/app/dg/create.jsp");
			transfer.setRedirect(false);
			break;
		case "/dg/dogather_dup_check.dg":
			try {
				transfer=new DogatherDupCheckAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println(command+" : "+e);
				e.printStackTrace();
			}
			break;
		case "/dg/create_ok.dg":
			try {
				transfer=new DogatherCreateOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println(command+" : "+e);
				e.printStackTrace();
			}
			break;
		case "/dg/catalog.dg":
			try {
				transfer=new DogatherCatalogAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println(command+" : "+e);
				e.printStackTrace();
			}
			break;
		case "/dg/detail.dg":
			try {
				transfer=new DogatherDetailAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println(command+" : "+e);
				e.printStackTrace();
			}
			break;
		case "/dg/join.dg":
			try {
				transfer=new DogatherJoinAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println(command+" : "+e);
				e.printStackTrace();
			}
			break;
		case "/dg/join_ok.dg":
			try {
				transfer=new DogatherJoinOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println(command+" : "+e);
				e.printStackTrace();
			}
			break;
		case "/dg/post_write.dg":
			transfer=new ActionTo();
			transfer.setRedirect(false);
			transfer.setPath("/app/dg/write.jsp");
			break;
			
		case "/dg/post_on.dg":
			try {
				transfer=new DogatherPostOnAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println(command+" : "+e);
				e.printStackTrace();
			}
			break;
		case "/dg/quit.dg":
			try {
				transfer=new DogatherQuitAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println(command+" : "+e);
				e.printStackTrace();
			}
			break;
		case "/dg/post_detail.dg":
			try {
				transfer=new DogatherPostDetailAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println(command+" : "+e);
				e.printStackTrace();
			}
			break;
		case "/dg/reply_on.dg":
			try {
				transfer=new DogatherReplyOnAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println(command+" : "+e);
				e.printStackTrace();
			}
			break;
		case "/dg/post_reply.dg":
			try {
				transfer=new DogatherPostReplyAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println(command+" : "+e);
				e.printStackTrace();
			}
			break;
		case "/dg/reply_update.dg":
			try {
				transfer=new DogatherReplyUpdateAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println(command+" : "+e);
				e.printStackTrace();
			}
			break;
		case "/dg/reply_delete.dg":
			try {
				transfer=new DogatherReplyDeleteAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println(command+" : "+e);
				e.printStackTrace();
			}
			break;
		case "/dg/dp_like.dg":
			try {
				transfer=new DogatherPostLikeAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println(command+" : "+e);
				e.printStackTrace();
			}
			break;
		case "/dg/view_my_info.dg":
			try {
				transfer=new DogatherViewMyInfoAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println(command+" : "+e);
				e.printStackTrace();
			}
			break;
		case "/dg/dg_get_certList.dg":
			try {
				transfer=new DogatherGetCertList().execute(req,resp);
			} catch (Exception e) {
				System.out.println(command+" : "+e);
				e.printStackTrace();
			}
			break;
		case "/dg/post_delete.dg":
			try {
				transfer=new DogatherPostDeleteAction().execute(req,resp);
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
