package com.dogather.app.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dogather.action.ActionTo;

public class BoardFrontController extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req,resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		doProcess(req,resp);
	}

	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String requestURI = req.getRequestURI(); // ????/board/boardmain.do
		String contextPath = req.getContextPath(); // ????(module명)
		String command = requestURI.substring(contextPath.length()); // /board/boardmain.do
		System.out.println(command);
		
		ActionTo transfer = null;
		switch(command) {

		case "/board/board_imageUpload.bo":
			try {
				transfer=new BoardImageUploadAction().execute(req, resp);
			} catch (ServletException e) {
				System.out.println(command+" : "+e);
			} catch (IOException e) {
				System.out.println(command+" : "+e);
				e.printStackTrace();
			}
			break;

		case "/board/free_board/post_list.bo":
			try {
				transfer=new FreeBoardListAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println(command+" : "+e);
				e.printStackTrace();
			}
			break;
			
		case "/board/free_board/post_write.bo":
			transfer = new ActionTo();
			transfer.setRedirect(false);
			transfer.setPath("/app/board/free_board/write.jsp");
			break;
		case "/board/free_board/post_write_ok.bo":
			try {
				transfer = new FreeBoardWriteOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println(command+" : "+e);
				e.printStackTrace();
			}
			break;
		case "/board/free_board/post_view.bo":
			try {
				transfer = new FreeBoardViewAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println(command+" : "+e);
				e.printStackTrace();
			}
			break;
		case "/board/free_board/post_delete.bo":
			try {
				transfer = new FreeBoardDeleteOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println(command+" : "+e);
				e.printStackTrace();
			}
			break;
		case "/board/free_board/post_update.bo":
			try {
				transfer = new FreeBoardUpdateAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println(command+" : "+e);
				e.printStackTrace();
			}
			break;
		case "/board/free_board/post_update_ok.bo":
			try {
				transfer=new FreeBoardUpdateOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println(command+" : "+e);
				e.printStackTrace();
			}
			break;
			
			
		//테스트
		case "/board/reply_ok.bo":
			try {
				transfer= new ReplyOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println(command+" : "+e);
				e.printStackTrace();
			}
			break;
		}
		
		
		//전송 일괄처리
		if(transfer!=null) {
			if(transfer.isRedirect()) {
				resp.sendRedirect(transfer.getPath());
			}else {
				req.getRequestDispatcher(transfer.getPath()).forward(req, resp);
			}
		}
	}

}
