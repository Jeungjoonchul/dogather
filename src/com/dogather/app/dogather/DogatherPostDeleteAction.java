package com.dogather.app.dogather;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dogather.action.Action;
import com.dogather.action.ActionTo;
import com.dogather.dao.dogather.DogatherDAO;

public class DogatherPostDeleteAction implements Action {

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int dp_index=Integer.parseInt(req.getParameter("dp_index"));
		System.out.println("dp_index : "+dp_index);
		int dg_index=Integer.parseInt(req.getParameter("dg_index"));
		System.out.println("dg_index : "+dg_index);
		String dp_page=req.getParameter("dp_page");
		System.out.println("dp_page : "+dp_page);
		String dp_type=req.getParameter("dp_type");
		System.out.println("dp_type : "+dp_type);
		String dp_align=req.getParameter("dp_align");
		System.out.println("dp_align : "+dp_align);
		String dp_mine = req.getParameter("dp_mine");
		System.out.println("dp_mine : "+dp_mine);
		
		DogatherDAO ddao = new DogatherDAO();
		String params="dg_index="+dg_index;
		params+="&dp_page="+dp_page;
		params+="&dp_type="+dp_type;
		params+="&dp_align="+dp_align;
		params+="&dp_mine="+dp_mine;
		System.out.println("location.href='"+req.getContextPath()+"/dg/detail.dg?"+params+"';");
		resp.getWriter().print("<script>");
		if(ddao.dgPostDelete(dp_index)) {
			resp.getWriter().print("alert('삭제되었습니다');");
			
		}else {
			resp.getWriter().print("alert('삭제에 실패했습니다');");	
		}
		resp.getWriter().print("location.href='"+req.getContextPath()+"/dg/detail.dg?"+params+"';");
		resp.getWriter().print("</script>");
		resp.getWriter().close();
		return null;
	}

}
