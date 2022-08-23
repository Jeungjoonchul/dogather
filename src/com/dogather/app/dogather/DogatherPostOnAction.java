package com.dogather.app.dogather;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dogather.action.Action;
import com.dogather.action.ActionTo;
import com.dogather.dao.dogather.DogatherDAO;
import com.dogather.dto.dogather.DogatherPostDTO;
import com.dogather.dto.user.UserDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class DogatherPostOnAction implements Action {

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String saveDirectory = req.getServletContext().getRealPath("upload") + "\\images\\dogather\\cert";
		System.out.println(saveDirectory);
		int maxPostSize = 1024 * 1024 * 5;

		MultipartRequest multi = new MultipartRequest(req, saveDirectory, maxPostSize, "UTF-8",
				new DefaultFileRenamePolicy());
		DogatherPostDTO dp = new DogatherPostDTO();
		
		int dg_index = Integer.parseInt(multi.getParameter("dg_index"));
		dp.setDg_index(dg_index);

		int user_index = ((UserDTO) req.getSession().getAttribute("loginUser")).getUser_index();
		dp.setUser_index(user_index);

		String dp_contents = multi.getParameter("dp_contents");
		dp_contents=dp_contents.replaceAll("\r\n","<br>");
		
		dp.setDp_contents(dp_contents);
		System.out.println(dp_contents);
		String dp_type = multi.getParameter("dp_type");
		dp.setDp_type(dp_type);
		

		if (dp_type.equals("cert")) {
			String[] sysNames = new String[3];
			String[] orgNames = new String[3];

			for (int i = 0; i < 3; i++) {
				String image_tag_name = "dp_image";
				String num = (i + 1) + "";
				sysNames[i] = multi.getFilesystemName(image_tag_name + num);
				orgNames[i] = multi.getOriginalFileName(image_tag_name + num);
				UUID uuid = UUID.randomUUID();

				if (sysNames[i] != null) {
					File file = new File(saveDirectory + "\\" + sysNames[i]);
					File newFile = new File(saveDirectory + "\\" + uuid);
					file.renameTo(newFile);
					sysNames[i] = uuid + "";
				}

			}
			dp.setDp_image1_org(orgNames[0]);
			dp.setDp_image2_org(orgNames[1]);
			dp.setDp_image3_org(orgNames[2]);
			dp.setDp_image1_sys(sysNames[0]);
			dp.setDp_image2_sys(sysNames[1]);
			dp.setDp_image3_sys(sysNames[2]);
		} 
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=utf-8");
		
		resp.getWriter().print("<script>");
		DogatherDAO ddao = new DogatherDAO();
		if(ddao.dgPostOn(dp)) {
			resp.getWriter().print("alert('등록되었습니다');");
		}else {
			resp.getWriter().print("alert('등록에 실패하였습니다');");			
		}
		resp.getWriter().print("location.href='"+req.getContextPath()+"/dg/detail.dg?dg_index="+dg_index+"';");
		resp.getWriter().print("</script>");
		resp.getWriter().close();
		return null;
	}

}
