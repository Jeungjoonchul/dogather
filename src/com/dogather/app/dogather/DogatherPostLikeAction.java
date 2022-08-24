package com.dogather.app.dogather;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dogather.action.Action;
import com.dogather.action.ActionTo;
import com.dogather.dao.board.BoardDAO;
import com.dogather.dao.dogather.DogatherDAO;
import com.dogather.dto.user.UserDTO;
import com.google.gson.Gson;

public class DogatherPostLikeAction implements Action {

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int dp_index=Integer.parseInt(req.getParameter("dp_index"));
		String status=req.getParameter("status");

		int user_index = ((UserDTO)req.getSession().getAttribute("loginUser")).getUser_index();
		DogatherDAO ddao = new DogatherDAO();
		String dp_like_user_index=ddao.getLikeUsersByDP(dp_index);
		HashMap<String, Object> map = new HashMap<String, Object>();
		if(status.equals("like")) {
			
				String[] temp=dp_like_user_index.split(",");
				dp_like_user_index="";
				for (int i = 0; i < temp.length; i++) {
					if(Integer.parseInt(temp[i])!=user_index) {
						dp_like_user_index=temp[i]+",";					
					}
				}
				if(dp_like_user_index.equals("")) {
					dp_like_user_index=null;
				}else {
					dp_like_user_index=dp_like_user_index.substring(0, dp_like_user_index.length()-1);					
				}
			map.put("result", "none");
		}else {
			if(dp_like_user_index!=null) {
				dp_like_user_index=dp_like_user_index+","+user_index;

			}else {
				dp_like_user_index=user_index+"";
			}
			map.put("result", "like");
		}
		

		if(ddao.setLikeUserIndexByDP(dp_index,dp_like_user_index)) {
			String dp_like_cnt=ddao.getLikeCntByDP(dp_index);
			map.put("dp_like_cnt", dp_like_cnt);
		}
		
		Gson gson = new Gson();
		String gsonStr = gson.toJson(map);
		resp.getWriter().print(gsonStr);		
		resp.getWriter().close();
		return null;
	}

}
