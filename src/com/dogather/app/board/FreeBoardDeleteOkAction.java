package com.dogather.app.board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dogather.action.Action;
import com.dogather.action.ActionTo;
import com.dogather.dao.board.BoardDAO;

public class FreeBoardDeleteOkAction implements Action {

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int b_index = Integer.parseInt(req.getParameter("b_index"));
		String b_name = "t_free_board";
		BoardDAO bdao = new BoardDAO();
		
		ActionTo transfer = null;
		
		if(bdao.postOff(b_index,b_name)) {
			transfer = new ActionTo();
			transfer.setRedirect(true);
			transfer.setPath(req.getContextPath()+"/board/free_board/list.bo");
		}else {
			resp.setCharacterEncoding("utf-8");
			resp.setContentType("text/html; charset=utf-8");
			PrintWriter out = resp.getWriter();
			out.print("<script>");
			out.print("alert('게시글 삭제에 실패했습니다');");
			out.print("location.href='"+req.getContextPath()+"/board/free_board/view.bo?b_index="+b_index+"';");
			out.print("</script>");
		}
		return transfer;
	}

}
