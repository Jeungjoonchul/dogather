package com.dogather.app.board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dogather.action.Action;
import com.dogather.action.ActionTo;
import com.dogather.dao.board.BoardDAO;

public class BoardDeleteOkAction implements Action {

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp,String b_name,String r_name) throws ServletException, IOException {
		int b_index = Integer.parseInt(req.getParameter("b_index"));
		BoardDAO bdao = new BoardDAO();
		String page=req.getParameter("page");
		String keyword=req.getParameter("keyword");
		String subject=req.getParameter("subject");
		System.out.println(subject+":"+subject.length());
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		String b_path=b_name.substring(2);
		out.print("<script>");
		if(bdao.postOff(b_index,b_name)) {
			out.print("alert('게시글이 삭제되었습니다');");
			out.print("location.href='"+req.getContextPath()+"/board/"+b_path+"/post_list.bo?page="+page+"&keyword="+keyword+"&subject="+subject+"';");
		}else {
			out.print("alert('게시글 삭제에 실패했습니다');");
			out.print("location.href='"+req.getContextPath()+"/board/"+b_path+"/post_view.bo?b_index="+b_index+"&page="+page+"&keyword="+keyword+"&subject="+subject+"';");
		}
		out.print("</script>");
		out.close();
		return null;
	}

}
