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

public class FreeBoardUpdateOkAction implements Action {

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 데이터 수집
		BoardDAO bdao = new BoardDAO();
		BoardDTO post = new BoardDTO();
		String b_name = "t_free_board";

		String page = req.getParameter("page");
		int b_index = Integer.parseInt(req.getParameter("b_index"));
		String b_title = req.getParameter("b_title");
		String b_subject = req.getParameter("b_subject");
		String b_contents = req.getParameter("b_contents");

		String orgName = req.getParameter("orgName");
		System.out.println("원본 파일들 : "+orgName);
		String sysName = req.getParameter("sysName");
		System.out.println("사본 파일들 : "+sysName);
		
		String b_files = req.getParameter("b_files");

		post.setB_name(b_name);
		post.setB_index(b_index);
		post.setB_title(b_title);
		post.setB_subject(b_subject);

		String imgCheck=b_files+sysName;
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		
		if (imgCheck.equals("") || imgCheck == null) {
			// 게시글에 사진이 포함되지 않은 경우
			post.setB_contents(b_contents);
			if (bdao.updatePost(post)) {
				out.print("<script>");
				out.print("alert('게시글이 수정되었습니다');");

			} else {
				out.print("<script>");
				out.print("alert('게시글이 수정에 실패했습니다');");

			}
		} else {
			// 게시글에 사진이 있었거나, 혹은 포함되었다고 판단되는 경우
			String[] files = b_files.split("/");
			String[] orgFiles = new String[files.length];
			String[] systemFiles = new String[files.length];

			for (int i = 0; i < files.length; i++) {
				orgFiles[i] = files[i].split(":")[0];
				systemFiles[i] = files[i].split(":")[1];
			}

			boolean[] isFiles = new boolean[files.length];
			for (int i = 0; i < systemFiles.length; i++) {
				isFiles[i] = b_contents.contains(systemFiles[i]);
			}

			b_files = "";
			for (int i = 0; i < isFiles.length; i++) {
				if (isFiles[i]) {
					b_files += orgFiles[i] + ":" + systemFiles[i] + "/";
				} else {
					// 파일삭제
					String filePath = req.getServletContext().getRealPath("upload") + "\\images\\free_board\\"
							+ systemFiles[i];
					File delete_file = new File(filePath);
					delete_file.delete();
				}
			}

			b_contents = b_contents.replaceAll("/temp", "/upload/images/free_board");

			orgName = orgName.substring(0, orgName.lastIndexOf(","));
			sysName = sysName.substring(0, sysName.lastIndexOf(","));
			System.out.println(sysName);
			String[] orgNames = orgName.split(",");
			String[] sysNames = sysName.split(",");
			boolean[] fileCheck = new boolean[sysNames.length];

			for (int i = 0; i < sysNames.length; i++) {
				
				if (b_contents.contains(sysNames[i])) {
					b_files += orgNames[i] + ":" + sysNames[i] + "/";
					fileCheck[i] = true;
				} else {
					fileCheck[i] = false;
				}
			}

			b_files = b_files.substring(0, b_files.lastIndexOf("/"));
			post.setB_files(b_files);
			post.setB_contents(b_contents);
			if (bdao.updatePost(post)) {
				// DB에 데이터 삽입 성공 시
				// 실제로 저장할 파일만 분류
				// 저장할 파일은 temp->upload/images/free_board 폴더로 이동
				// 저장할 필요 없는 파일은 삭제
				for (int i = 0; i < sysNames.length; i++) {
					String tempPath = req.getServletContext().getRealPath("temp") + "\\" + sysNames[i];
					String uploadPath = req.getServletContext().getRealPath("upload") + "\\images\\free_board\\"
							+ sysNames[i];
					File temp_file = new File(tempPath);
					File new_file = new File(uploadPath);
					if (fileCheck[i]) {

						if (!new_file.exists()) {
							// 파일 복사
							Files.copy(temp_file.toPath(), new_file.toPath(), StandardCopyOption.REPLACE_EXISTING);
							System.out.println("파일 복사 성공 : "+sysNames[i]);

							// 임시 파일 삭제
							temp_file.delete();
							System.out.println("임시 파일 삭제 성공"+tempPath);
						}
					} else {
						temp_file.delete();
						System.out.println("저장할 필요 없는 파일("+sysNames[i]+ ")삭제 성공");
					}
				}
				out.print("<script>");
				out.print("alert('게시글이 수정되었습니다');");
				

			} else {
				// DB에 데이터 삽입 실패 시
				// temp에 저장된 파일 삭제
				for (int i = 0; i < sysNames.length; i++) {
					String filePath = req.getServletContext().getRealPath("upload") + "\\temp\\" + systemFiles[i];
					File delete_file = new File(filePath);
					delete_file.delete();
				}
				out.print("<script>");
				out.print("alert('게시글이 수정에 실패했습니다');");
				
				
			}
		}
		out.print("location.href='" + req.getContextPath() + "/board/free_board/view.bo?b_index=" + b_index
				+ "&page=" + page + "';");
		out.print("</script>");
		out.close();
		return null;
	}

}
