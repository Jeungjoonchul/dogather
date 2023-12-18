package com.dogather.app.dogather;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dogather.action.Action;
import com.dogather.action.ActionTo;
import com.dogather.dao.dogather.DogatherDAO;
import com.dogather.dto.dogather.DogatherDTO;
import com.dogather.dto.user.UserDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class DogatherCreateOkAction implements Action {

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String saveDirectory = req.getServletContext().getRealPath("upload")+"\\images\\dogather\\banner";
		System.out.println(saveDirectory);
		int maxPostSize = 1024*1024*5;
		MultipartRequest multi = new MultipartRequest(req, saveDirectory, maxPostSize, "UTF-8",new DefaultFileRenamePolicy());
		
		String orgName=multi.getOriginalFileName("dg_banner");
		String sysName=multi.getFilesystemName("dg_banner");
		UUID uuid=UUID.randomUUID();
		
		int category_index=Integer.parseInt(multi.getParameter("category_index"));
		String dg_title=multi.getParameter("dg_title");
		String dg_intro=multi.getParameter("dg_intro");
		dg_intro=dg_intro.replaceAll("\r\n","<br>");
		System.out.println(dg_intro);
		String dg_intro_short=multi.getParameter("dg_intro_short");
		dg_intro_short=dg_intro_short.equals("")?null:dg_intro_short;
		
		String dg_banner_org=null;
		String dg_banner_sys=null;
		//배너가 있을때
		if(sysName!=null) {
			File file = new File(saveDirectory+"\\"+sysName);
			File newFile=new File(saveDirectory+"\\"+uuid);
			file.renameTo(newFile);
			dg_banner_org=orgName;
			System.out.println("dg_banner_org : "+dg_banner_org);
			dg_banner_sys=uuid+"";
			System.out.println("dg_banner_sys : "+dg_banner_sys);
		}

		int dg_public_scope=Integer.parseInt(multi.getParameter("dg_public_scope"));

		String dg_limit_scope=multi.getParameter("dg_limit_scope");
		dg_limit_scope=dg_public_scope==0?"impossible":dg_limit_scope;

		String dg_expire = multi.getParameter("dg_expire");
		dg_expire=dg_expire.equals("")?null:dg_expire;
		
		DogatherDTO dg=new DogatherDTO();
		
		int user_index=((UserDTO)req.getSession().getAttribute("loginUser")).getUser_index();
		
		dg.setUser_index(user_index);
		dg.setCategory_index(category_index);
		dg.setDg_title(dg_title);
		dg.setDg_intro(dg_intro);
		dg.setDg_intro_short(dg_intro_short);
		dg.setDg_banner_org(dg_banner_org);
		dg.setDg_banner_sys(dg_banner_sys);
		dg.setDg_public_scope(dg_public_scope);
		dg.setDg_limit_scope(dg_limit_scope);
		dg.setDg_expire(dg_expire);
		
		DogatherDAO ddao = new DogatherDAO();
		
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print("<script>");
		if(ddao.dgCreate(dg)) {
			int dg_index=ddao.getDgIndexWithDgTitle(dg_title);
			ddao.dgJoin(dg_index,user_index);
			out.print("alert('두개더가 개설되었습니다!');");
			out.print("location.href='"+req.getContextPath()+"/dg/detail.dg?dg_index="+dg_index+"';");
		}else {
			out.print("alert('두개더가 개설에 실패했습니다');");
			out.print("location.href='"+req.getContextPath()+"/dg/front.dg';");
		}
		out.print("</script>");
		return null;
	}
}
