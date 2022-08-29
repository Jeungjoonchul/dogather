package com.dogather.app.board;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dogather.action.Action;
import com.dogather.action.ActionTo;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BoardImageUploadAction implements Action {

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		String saveDirectory = req.getServletContext().getRealPath("temp");
		System.out.println("임시 저장 장소 : "+saveDirectory);
		int maxPostSize = 1024*1024*20;
		System.out.println("저장 크기 : "+maxPostSize);
		
		MultipartRequest multi = new MultipartRequest(req, saveDirectory, maxPostSize, "utf-8",new DefaultFileRenamePolicy());
		String orgName = (String)multi.getOriginalFileName("file");
		String sysName = (String)multi.getFilesystemName("file");
		UUID uuid = UUID.randomUUID();
		System.out.println("원본 파일명 : "+orgName);
		System.out.println("저장 파일명 : "+uuid);
				
		File file = new File(saveDirectory+"\\"+sysName);
		File newFile = new File(saveDirectory+"\\"+uuid);
		file.renameTo(newFile);
		System.out.println("파일 경로 : "+saveDirectory+"\\"+uuid);
		
		out.print(orgName+","+uuid);
		out.close();
		
		return null;
	}

}
