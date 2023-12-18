package com.dogather.app.dogather;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dogather.action.Action;
import com.dogather.action.ActionTo;
import com.dogather.dao.dogather.DogatherDAO;
import com.dogather.dto.user.UserDTO;

public class DogatherJoinOkAction implements Action {

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		DogatherDAO ddao = new DogatherDAO();
		int dg_index = Integer.parseInt(req.getParameter("dg_index"));
		int user_index = ((UserDTO)req.getSession().getAttribute("loginUser")).getUser_index();
		String dg_user_join_record=req.getParameter("dg_user_join_record");

		String dg_user_target = req.getParameter("dg_user_target");
		dg_user_target=dg_user_target. equals("")?null:dg_user_target;
		if(dg_user_target!=null) {
			dg_user_target=dg_user_target.replaceAll("\r\n", "<br>");
		}
		String dg_user_target_date = req.getParameter("dg_user_target_date");
		dg_user_target_date=dg_user_target_date.equals("")?null:dg_user_target_date;
		
		
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=utf-8");
		
		PrintWriter out = resp.getWriter();
		out.print("<script>");
		if(dg_user_join_record.equals("new-member")) {
			if(ddao.dgJoin(dg_index, user_index)) {
				ddao.setDgUserTarget(dg_index,user_index,dg_user_target,dg_user_target_date);
				out.print("alert('참여를 환영합니다');");
			}else {			
				out.print("alert('두개더 참여에 실패했습니다');");
			}
		}else{
			if(ddao.dgReJoin(dg_index, user_index)) {
				ddao.updateDgUserTarget(dg_index,user_index,dg_user_target,dg_user_target_date);
				out.print("alert('참여를 환영합니다');");
			}else {			
				out.print("alert('두개더 참여에 실패했습니다');");
			}
		}
		
		out.print("location.href='"+req.getContextPath()+"/dg/detail.dg?dg_index="+dg_index+"';");
		out.print("</script>");
		out.close();
		return null;
	}
}
