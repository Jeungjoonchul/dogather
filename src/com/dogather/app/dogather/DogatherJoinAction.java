package com.dogather.app.dogather;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dogather.action.Action;
import com.dogather.action.ActionTo;
import com.dogather.dao.dogather.DogatherDAO;
import com.dogather.dto.dogather.DogatherUserDTO;
import com.dogather.dto.user.UserDTO;

public class DogatherJoinAction implements Action {

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		UserDTO loginUser=(UserDTO)req.getSession().getAttribute("loginUser");
		ActionTo transfer=null;
		if(loginUser==null) {
			transfer = new ActionTo();
			transfer.setPath("/app/dg/join.jsp");
			return transfer;
		}
		int user_index=loginUser.getUser_index();
		int dg_index=Integer.parseInt(req.getParameter("dg_index"));
		String status="";
		DogatherDAO ddao=new DogatherDAO();
		List<DogatherUserDTO> msi = ddao.getDgMembersInfo(dg_index);
		for (DogatherUserDTO du : msi) {
			if(du.getUser_index()==user_index) {
				if(du.isDg_user_active()) {
					status="cur-member";
					break;
				}else {
					status="ex-member";
					break;
				}
			}else {
				status="new-member";
			}
		}
		
		if(status.equals("cur-member")) {
			resp.getWriter().print("<script>");
			resp.getWriter().print("alert('이미 가입한 두개더입니다');");
			resp.getWriter().print("location.href='"+req.getContextPath()+"/dg/detail.dg?dg_index="+dg_index+"';");			
			resp.getWriter().print("</script>");
			resp.getWriter().close();
		}else if(status.equals("ex-member")){
			transfer = new ActionTo();
			transfer.setPath("/app/dg/join.jsp");
			req.setAttribute("dg_user_join_record", "ex-member");
			req.setAttribute("dg_index", dg_index);
		}else if(status.equals("new-member")) {
			transfer = new ActionTo();
			transfer.setPath("/app/dg/join.jsp");
			req.setAttribute("dg_index", dg_index);
			req.setAttribute("dg_user_join_record", "new-member");
		}
		
		return transfer;
	}

}
