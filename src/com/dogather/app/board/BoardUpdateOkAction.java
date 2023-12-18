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

public class BoardUpdateOkAction implements Action {

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp, String b_name, String r_name)
			throws ServletException, IOException {
		boolean result = false;

		// 데이터 수집
		BoardDAO bdao = new BoardDAO();
		BoardDTO post = new BoardDTO();

		String page = req.getParameter("page");
		String keyword=req.getParameter("keyword");
		String subject=req.getParameter("subject");
		int b_index = Integer.parseInt(req.getParameter("b_index"));
		String b_title = req.getParameter("b_title");
		String b_subject = req.getParameter("b_subject");
		String b_contents = req.getParameter("b_contents");

		String orgName = req.getParameter("orgName");
		System.out.println("원본 파일들 : " + orgName);
		String sysName = req.getParameter("sysName");
		System.out.println("사본 파일들 : " + sysName);

		String b_files = req.getParameter("b_files");
		System.out.println("b_files : " + b_files + "(" + b_files.length() + ")");
		post.setB_name(b_name);
		post.setB_index(b_index);
		post.setB_title(b_title);
		post.setB_subject(b_subject);

		String imgCheck = b_files + sysName;
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();

		String b_path = b_name.substring(2);
		if (imgCheck.equals("") || imgCheck == null) {
			// 게시글에 사진이 포함되지 않은 경우
			post.setB_contents(b_contents);
			if (bdao.updatePost(post)) {
				result = true;
			} else {
				result = false;
			}
		} else {
			// 게시글에 사진이 있었거나, 혹은 포함되었다고 판단되는 경우

			String[] orgFiles = null;
			String[] systemFiles = null;


			//기존 이미지가 있었다면
			if (b_files.length() != 0) {
				String[] files = b_files.split("/");
				orgFiles = new String[files.length];
				systemFiles = new String[files.length];
				boolean[] isFiles = new boolean[files.length];
				for (int i = 0; i < files.length; i++) {
					orgFiles[i] = files[i].split(":")[0];
					systemFiles[i] = files[i].split(":")[1];
					isFiles[i]=b_contents.contains(systemFiles[i]);
				}

				b_files = "";
				for (int i = 0; i < isFiles.length; i++) {
					if (isFiles[i]) {
						b_files += orgFiles[i] + ":" + systemFiles[i] + "/";
					} else {
						// 파일삭제(기존의 등록한 이미지를 업데이트에서 삭제한 이미지만)
						String filePath = req.getServletContext().getRealPath("upload") + "\\images\\"+b_path+"\\"
								+ systemFiles[i];
						File delete_file = new File(filePath);
						delete_file.delete();
					}
				}
			}
			
			String[] orgNames = null;
			String[] sysNames = null;
			boolean[] fileCheck = null;
			
			//새로운 이미지를 추가 했다면
			if(sysName.length()!=0) {
				
				b_contents = b_contents.replaceAll("/temp", "/upload/images/"+b_path);

				orgName = orgName.substring(0, orgName.lastIndexOf(","));
				sysName = sysName.substring(0, sysName.lastIndexOf(","));

				orgNames = orgName.split(",");
				sysNames = sysName.split(",");
				
				fileCheck = new boolean[sysNames.length];
				for (int i = 0; i < sysNames.length; i++) {

					if (b_contents.contains(sysNames[i])) {
						b_files += orgNames[i] + ":" + sysNames[i] + "/";
						fileCheck[i] = true;
					} else {
						fileCheck[i] = false;
					}
				}
				b_files = b_files.substring(0, b_files.lastIndexOf("/"));
			}
			
			post.setB_files(b_files);
			post.setB_contents(b_contents);
			if (bdao.updatePost(post)) {
				// DB에 데이터 삽입 성공 시
				// 실제로 저장할 파일만 분류
				// 저장할 파일은 temp->upload/images/**_board 폴더로 이동
				// 저장할 필요 없는 파일은 삭제
				
				
				//임시 폴더에서 upload폴더로 이동
				if(sysName.length()!=0) {
					for (int i = 0; i < sysNames.length; i++) {
						String tempPath = req.getServletContext().getRealPath("temp") + "\\" + sysNames[i];
						String uploadPath = req.getServletContext().getRealPath("upload") + "\\images\\"+b_path+"\\"
								+ sysNames[i];
						File temp_file = new File(tempPath);
						File new_file = new File(uploadPath);
						if (fileCheck[i]) {
							if(temp_file.exists()) {
								if (!new_file.exists()) {
									// 파일 복사
									Files.copy(temp_file.toPath(), new_file.toPath(), StandardCopyOption.REPLACE_EXISTING);

									// 임시 파일 삭제
									temp_file.delete();
								}else {
									temp_file.delete();
								}
							}
							
						} 
					}
				}	
				result = true;

			} else {
				// DB에 데이터 업데이트 실패 시
				// temp에 저장된 파일 삭제
				if(sysName.length()!=0) {
					for (int i = 0; i < sysNames.length; i++) {
						String filePath = req.getServletContext().getRealPath("temp") + "\\" + systemFiles[i];
						File delete_file = new File(filePath);
						if(delete_file.exists())
						delete_file.delete();
					}
					result = false;

				}
				
			}
		}

		if (result) {
			out.print("<script>");
			out.print("alert('게시글이 수정되었습니다');");
		} else {
			out.print("<script>");
			out.print("alert('게시글이 수정에 실패했습니다');");
		}
		out.print("location.href='" + req.getContextPath() + "/board/"+b_path+"/post_view.bo?b_index=" + b_index
				+ "&page=" + page + "&keyword="+keyword+"&subject="+subject+"';");
		out.print("</script>");
		out.close();
		return null;
	}
	
}
