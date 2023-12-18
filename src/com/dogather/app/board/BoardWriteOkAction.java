package com.dogather.app.board;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dogather.action.Action;
import com.dogather.action.ActionTo;
import com.dogather.dao.board.BoardDAO;

import com.dogather.dto.board.BoardDTO;
import com.dogather.dto.user.UserDTO;

public class BoardWriteOkAction implements Action {

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp,String b_name,String r_name) throws ServletException, IOException {
		BoardDTO newPost = new BoardDTO();
		BoardDAO bdao = new BoardDAO();

		String page=req.getParameter("page");
		String keyword=req.getParameter("keyword");
		String subject = req.getParameter("subject");
		
		newPost.setB_name(b_name);
		String b_path = b_name.substring(2);

		int user_index = ((UserDTO) req.getSession().getAttribute("loginUser")).getUser_index();
		newPost.setUser_index(user_index);

		String b_subject = req.getParameter("b_subject");
		newPost.setB_subject(b_subject);

		String b_title = req.getParameter("b_title");
		newPost.setB_title(b_title);
		System.out.println("게시글 제목 : " + b_title);

		String b_contents = req.getParameter("b_contents");
		b_contents = b_contents.replaceAll("/temp", "/upload/images/"+b_path);
		newPost.setB_contents(b_contents);
		System.out.println("게시글 내용 : " + b_contents);

		String sysName = req.getParameter("sysName");
		String orgName = req.getParameter("orgName");
		String[] sysNames = null;
		String[] orgNames = null;

		System.out.println("저장 파일명 : " + sysName);
		System.out.println("원본 파일명 : " + orgName);

		// 제일 마지막 ',' 자르는 코드
		if (sysName.length()!=0) {
			sysName = sysName.substring(0, sysName.lastIndexOf(","));
			sysNames = sysName.split(",");
			orgName = orgName.substring(0, orgName.lastIndexOf(","));
			orgNames = orgName.split(",");

			String b_files = "";
			for (int i = 0; i < orgNames.length; i++) {
				b_files += orgNames[i] + ":";
				b_files += sysNames[i] + "/";
			}
			b_files = b_files.substring(0, b_files.lastIndexOf("/"));
			System.out.println(b_files);
			newPost.setB_files(b_files);

			System.out.println("파일 임시 저장 경로 : " + req.getServletContext().getRealPath("temp") + "\\");
			System.out.println(
					"파일 최종 저장 경로 : " + req.getServletContext().getRealPath("upload") + "\\images\\"+b_path+"\\");
		}
		
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		// db에 게시글 저장 성공 시
		if (bdao.postOn(newPost)) {
			// 게시글에 등록한 파일 하나씩 꺼내기
			
			if (sysName.length()!=0) {
				for (int i = 0; i < sysNames.length; i++) {

					// 임시 폴더에 저장한 파일 객체 생성
					// temp/uuid
					// getContextPath = /dogather
					//
					File temp_file = new File(req.getServletContext().getRealPath("temp") + "\\" + sysNames[i]);

					// images폴더에 저장할 파일 객체 생성
					// upload/images/uuid
					File new_file = new File(req.getServletContext().getRealPath("upload") + "\\images\\"+b_path+"\\" + sysNames[i]);

					// images폴더에 동일한 파일명의 파일이 없다면
					if (!new_file.exists()) {
						// 파일 복사
						Files.copy(temp_file.toPath(), new_file.toPath(), StandardCopyOption.REPLACE_EXISTING);
						System.out.println("파일 복사 성공");
						// 임시 파일 삭제
						temp_file.delete();
						System.out.println("파일 삭제 성공");
					}
				}
			}
			int b_index = bdao.getLastIndexWithUserIndex(b_name,user_index);
			System.out.println("게시글 db 등록 성공");
			out.write("<script>");
			out.write("alert('게시글이 등록되었습니다!');");
			out.write("location.href='" + req.getContextPath() + "/board/"+b_path+"/post_view.bo?b_index="+b_index+"&page="+page+"';");
		} else {
			out.write("<script>");
			out.write("alert('게시글 등록에 실패했습니다');");
			out.write("location.href='" + req.getContextPath() + "/board/"+b_path+"/post_list.bo?page="+page+"&keyword="+keyword+"&subject="+subject+"';");
		}
		out.write("</script>");
		out.close();
		return null;
	}

}
