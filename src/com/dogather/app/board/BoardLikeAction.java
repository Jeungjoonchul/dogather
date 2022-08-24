package com.dogather.app.board;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dogather.action.Action;
import com.dogather.action.ActionTo;
import com.dogather.dao.board.BoardDAO;
import com.dogather.dto.user.UserDTO;
import com.google.gson.Gson;

public class BoardLikeAction implements Action {

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp, String b_name, String r_name)
			throws ServletException, IOException {
		int b_index=Integer.parseInt(req.getParameter("b_index"));

		String status=req.getParameter("status");

		int user_index = ((UserDTO)req.getSession().getAttribute("loginUser")).getUser_index();
		BoardDAO bdao = new BoardDAO();
		String b_like_user_index=bdao.getLikeUsers(b_index,b_name);
		HashMap<String, Object> map = new HashMap<String, Object>();
		if(status.equals("like")) {
			
				String[] temp=b_like_user_index.split(",");
				b_like_user_index="";
				for (int i = 0; i < temp.length; i++) {
					if(Integer.parseInt(temp[i])!=user_index) {
						b_like_user_index=temp[i]+",";					
					}
				}
				if(b_like_user_index.equals("")) {
					b_like_user_index=null;
				}else {
					b_like_user_index=b_like_user_index.substring(0, b_like_user_index.length()-1);					
				}
			map.put("result", "none");
		}else {
			if(b_like_user_index!=null) {
				b_like_user_index=b_like_user_index+","+user_index;

			}else {
				b_like_user_index=user_index+"";
			}
			map.put("result", "like");
		}
		

		if(bdao.setLikeUserIndex(b_index,b_name,b_like_user_index)) {
			String b_like_cnt=bdao.getLikeCnt(b_index,b_name);
			map.put("b_like_cnt", b_like_cnt);
		}
		
		Gson gson = new Gson();
		String gsonStr = gson.toJson(map);
		resp.getWriter().print(gsonStr);		
		resp.getWriter().close();
		return null;
	}

}
