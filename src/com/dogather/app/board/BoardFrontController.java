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
		case "/board/board_list.bo":
			try {
				transfer = new BoardListAction().execute(req,resp);
			} catch (ServletException e) {
				System.out.println("/board/board_list.bo : "+e);
			}
			break;
		case "/board/board_write.bo":
			try {
				transfer=new BoardWriteOkAction().execute(req,resp);
			} catch (ServletException e) {
				System.out.println("/board/board_write.bo"+e);
			} catch (IOException e) {
				System.out.println("/board/board_write.bo"+e);
			}
			break;
		case "/board/board_imageUpload.bo":
			try {
				transfer=new BoardImageUploadAction().execute(req, resp);
			} catch (ServletException e) {
				System.out.println("/board/board_imageUpload.bo"+e);
			} catch (IOException e) {
				System.out.println("/board/board_imageUpload.bo"+e);
			}
			break;
		case "/board/board_view.bo":
			try {
				transfer = new BoardViewAction().execute(req,resp);
			} catch (ServletException e) {
				System.out.println("/board/boardview.bo"+e);
			} catch (IOException e) {
				System.out.println("/board/boardview.bo"+e);
			}
			break;
		case "/board/free_board/list.bo":
			try {
				transfer=new FreeBoardListAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("/board/free_board/list.bo"+e);
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
