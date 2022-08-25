package com.dogather.app.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dogather.action.ActionTo;

public class BoardFrontController extends HttpServlet {

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
		String requestURI = req.getRequestURI(); // ????/board/boardmain.do
		String contextPath = req.getContextPath(); // ????(module명)
		String command = requestURI.substring(contextPath.length()); // /board/boardmain.do
		System.out.println(command);
		String b_name = "";
		String r_name = "";
		if (!command.contains("Upload")) {
			b_name = "t_" + command.substring(7, command.lastIndexOf("/"));
			System.out.println("게시판 : " + b_name);
			r_name = b_name.substring(0, 3) + "b_reply";
			System.out.println("댓글 : " + r_name);
		}

		ActionTo transfer = null;
		switch (command) {
		// image 임시 업로드
		case "/board/board_imageUpload.bo":
			try {
				transfer = new BoardImageUploadAction().execute(req, resp);
			} catch (ServletException e) {
				System.out.println(command + " : " + e);
				e.printStackTrace();
			} catch (IOException e) {
				System.out.println(command + " : " + e);
				e.printStackTrace();
			}
			break;
////////////////////////////////////////////////////////////////////////////////////
		// 자유 게시판
		case "/board/free_board/post_list.bo":
			try {
				transfer = new BoardListAction().execute(req, resp, b_name, r_name);
			} catch (Exception e) {
				System.out.println(command + " : " + e);
				e.printStackTrace();
			}
			break;

		case "/board/free_board/post_view.bo":
			try {
				transfer = new BoardViewAction().execute(req, resp, b_name, r_name);
			} catch (Exception e) {
				System.out.println(command + " : " + e);
				e.printStackTrace();
			}
			break;

		case "/board/free_board/post_write.bo":
			transfer = new ActionTo();
			transfer.setRedirect(false);
			b_name = b_name.substring(2);
			transfer.setPath("/app/board/" + b_name + "/write.jsp");
			break;

		case "/board/free_board/post_write_ok.bo":
			try {
				transfer = new BoardWriteOkAction().execute(req, resp, b_name, r_name);
			} catch (Exception e) {
				System.out.println(command + " : " + e);
				e.printStackTrace();
			}
			break;

		case "/board/free_board/post_delete.bo":
			try {
				transfer = new BoardDeleteOkAction().execute(req, resp, b_name, r_name);
			} catch (Exception e) {
				System.out.println(command + " : " + e);
				e.printStackTrace();
			}
			break;

		case "/board/free_board/post_update.bo":
			try {
				transfer = new BoardUpdateAction().execute(req, resp, b_name, r_name);
			} catch (Exception e) {
				System.out.println(command + " : " + e);
				e.printStackTrace();
			}
			break;

		case "/board/free_board/post_update_ok.bo":
			try {
				transfer = new BoardUpdateOkAction().execute(req, resp, b_name, r_name);
			} catch (Exception e) {
				System.out.println(command + " : " + e);
				e.printStackTrace();
			}
			break;

		case "/board/free_board/reply_list.bo":
			try {
				transfer = new ReplyListAction().execute(req, resp, b_name, r_name);
			} catch (ServletException e) {
				System.out.println(command + " : " + e);
				e.printStackTrace();
			} catch (IOException e) {
				System.out.println(command + " : " + e);
				e.printStackTrace();
			}
			break;

		case "/board/free_board/reply_on.bo":
			try {
				transfer = new ReplyOnAction().execute(req, resp, b_name, r_name);
			} catch (Exception e) {
				System.out.println(command + " : " + e);
				e.printStackTrace();
			}
			break;
		case "/board/free_board/reply_update.bo":
			try {
				transfer = new ReplyUpdateAction().execute(req, resp, b_name, r_name);
			} catch (Exception e) {
				System.out.println(command + " : " + e);
				e.printStackTrace();
			}
			break;
		case "/board/free_board/reply_delete.bo":
			try {
				transfer = new ReplyDeleteAction().execute(req, resp, b_name, r_name);
			} catch (Exception e) {
				System.out.println(command + " : " + e);
				e.printStackTrace();
			}
			break;
//////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////
		// 이벤트 게시판
		case "/board/event_board/post_list.bo":
			try {
				transfer = new BoardListAction().execute(req, resp, b_name, r_name);
			} catch (Exception e) {
				System.out.println(command + " : " + e);
				e.printStackTrace();
			}
			break;

		case "/board/event_board/post_view.bo":
			try {
				transfer = new BoardViewAction().execute(req, resp, b_name, r_name);
			} catch (Exception e) {
				System.out.println(command + " : " + e);
				e.printStackTrace();
			}
			break;

		case "/board/event_board/post_write.bo":
			transfer = new ActionTo();
			transfer.setRedirect(false);
			b_name = b_name.substring(2);
			transfer.setPath("/app/board/" + b_name + "/write.jsp");
			break;

		case "/board/event_board/post_write_ok.bo":
			try {
				transfer = new BoardWriteOkAction().execute(req, resp, b_name, r_name);
			} catch (Exception e) {
				System.out.println(command + " : " + e);
				e.printStackTrace();
			}
			break;

		case "/board/event_board/post_delete.bo":
			try {
				transfer = new BoardDeleteOkAction().execute(req, resp, b_name, r_name);
			} catch (Exception e) {
				System.out.println(command + " : " + e);
				e.printStackTrace();
			}
			break;

		case "/board/event_board/post_update.bo":
			try {
				transfer = new BoardUpdateAction().execute(req, resp, b_name, r_name);
			} catch (Exception e) {
				System.out.println(command + " : " + e);
				e.printStackTrace();
			}
			break;

		case "/board/event_board/post_update_ok.bo":
			try {
				transfer = new BoardUpdateOkAction().execute(req, resp, b_name, r_name);
			} catch (Exception e) {
				System.out.println(command + " : " + e);
				e.printStackTrace();
			}
			break;

		case "/board/event_board/reply_list.bo":
			try {
				transfer = new ReplyListAction().execute(req, resp, b_name, r_name);
			} catch (ServletException e) {
				System.out.println(command + " : " + e);
				e.printStackTrace();
			} catch (IOException e) {
				System.out.println(command + " : " + e);
				e.printStackTrace();
			}
			break;

		case "/board/event_board/reply_on.bo":
			try {
				transfer = new ReplyOnAction().execute(req, resp, b_name, r_name);
			} catch (Exception e) {
				System.out.println(command + " : " + e);
				e.printStackTrace();
			}
			break;
		case "/board/event_board/reply_update.bo":
			try {
				transfer = new ReplyUpdateAction().execute(req, resp, b_name, r_name);
			} catch (Exception e) {
				System.out.println(command + " : " + e);
				e.printStackTrace();
			}
			break;
		case "/board/event_board/reply_delete.bo":
			try {
				transfer = new ReplyDeleteAction().execute(req, resp, b_name, r_name);
			} catch (Exception e) {
				System.out.println(command + " : " + e);
				e.printStackTrace();
			}
			break;
////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////
			//정보 게시판
		case "/board/info_board/post_list.bo":
			try {
				transfer = new BoardListAction().execute(req, resp, b_name, r_name);
			} catch (Exception e) {
				System.out.println(command + " : " + e);
				e.printStackTrace();
			}
			break;

		case "/board/info_board/post_view.bo":
			try {
				transfer = new BoardViewAction().execute(req, resp, b_name, r_name);
			} catch (Exception e) {
				System.out.println(command + " : " + e);
				e.printStackTrace();
			}
			break;

		case "/board/info_board/post_write.bo":
			transfer = new ActionTo();
			transfer.setRedirect(false);
			b_name = b_name.substring(2);
			transfer.setPath("/app/board/" + b_name + "/write.jsp");
			break;

		case "/board/info_board/post_write_ok.bo":
			try {
				transfer = new BoardWriteOkAction().execute(req, resp, b_name, r_name);
			} catch (Exception e) {
				System.out.println(command + " : " + e);
				e.printStackTrace();
			}
			break;

		case "/board/info_board/post_delete.bo":
			try {
				transfer = new BoardDeleteOkAction().execute(req, resp, b_name, r_name);
			} catch (Exception e) {
				System.out.println(command + " : " + e);
				e.printStackTrace();
			}
			break;

		case "/board/info_board/post_update.bo":
			try {
				transfer = new BoardUpdateAction().execute(req, resp, b_name, r_name);
			} catch (Exception e) {
				System.out.println(command + " : " + e);
				e.printStackTrace();
			}
			break;

		case "/board/info_board/post_update_ok.bo":
			try {
				transfer = new BoardUpdateOkAction().execute(req, resp, b_name, r_name);
			} catch (Exception e) {
				System.out.println(command + " : " + e);
				e.printStackTrace();
			}
			break;

		case "/board/info_board/reply_list.bo":
			try {
				transfer = new ReplyListAction().execute(req, resp, b_name, r_name);
			} catch (ServletException e) {
				System.out.println(command + " : " + e);
				e.printStackTrace();
			} catch (IOException e) {
				System.out.println(command + " : " + e);
				e.printStackTrace();
			}
			break;

		case "/board/info_board/reply_on.bo":
			try {
				transfer = new ReplyOnAction().execute(req, resp, b_name, r_name);
			} catch (Exception e) {
				System.out.println(command + " : " + e);
				e.printStackTrace();
			}
			break;
		case "/board/info_board/reply_update.bo":
			try {
				transfer = new ReplyUpdateAction().execute(req, resp, b_name, r_name);
			} catch (Exception e) {
				System.out.println(command + " : " + e);
				e.printStackTrace();
			}
			break;
		case "/board/info_board/reply_delete.bo":
			try {
				transfer = new ReplyDeleteAction().execute(req, resp, b_name, r_name);
			} catch (Exception e) {
				System.out.println(command + " : " + e);
				e.printStackTrace();
			}
			break;
////////////////////////////////////////////////////////////////////////////////////
		case "/board/free_board/board_like.bo":
			try {
				transfer = new BoardLikeAction().execute(req,resp,b_name,r_name);
			} catch (Exception e) {
				System.out.println(command + " : " + e);
				e.printStackTrace();
			}
			break;
		case "/board/info_board/board_like.bo":
			try {
				transfer = new BoardLikeAction().execute(req,resp,b_name,r_name);
			} catch (Exception e) {
				System.out.println(command + " : " + e);
				e.printStackTrace();
			}
			break;
		case "/board/event_board/board_like.bo":
			try {
				transfer = new BoardLikeAction().execute(req,resp,b_name,r_name);
			} catch (Exception e) {
				System.out.println(command + " : " + e);
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
