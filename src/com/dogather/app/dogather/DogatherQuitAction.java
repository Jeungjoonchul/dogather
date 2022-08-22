package com.dogather.app.dogather;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dogather.action.Action;
import com.dogather.action.ActionTo;
import com.dogather.dao.dogather.DogatherDAO;

public class DogatherQuitAction implements Action {

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int user_index=Integer.parseInt(req.getParameter("loginUser_index"));
		int dg_index=Integer.parseInt(req.getParameter("dg_index"));
		System.out.println("user_index : "+user_index);
		System.out.println("dg_index : "+dg_index);
		DogatherDAO ddao = new DogatherDAO();
		
		resp.getWriter().print("<script>");
		
		if(ddao.dgQuit(user_index,dg_index)) {
			resp.getWriter().print("alert('두개더 탈퇴가 완료되었습니다');");
		}else {
			resp.getWriter().print("alert('두개더 탈퇴에 실패했습니다');");
		}
		resp.getWriter().print("location.href='"+req.getContextPath()+"/dg/detail.dg?dg_index="+dg_index+"';");
		resp.getWriter().print("</script>");
		resp.getWriter().close();
		return null;
	}

}
