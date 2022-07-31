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
import com.dogather.dao.user.UserDAO;
import com.dogather.dto.board.BoardDTO;

public class BoardWriteOkAction implements Action {

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BoardDTO newPost = new BoardDTO();
		BoardDAO bdao = new BoardDAO();
		UserDAO udao = new UserDAO();
		
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		
		String user_id = req.getParameter("user_id");
		int user_index = udao.selectUser(user_id);
		newPost.setUser_index(user_index);
		System.out.println("작성자 : " + user_id + "(유저 인덱스 : " + user_index + ")");

		String tb_title = req.getParameter("tb_title");
		
		newPost.setTb_title(tb_title);
		System.out.println("게시글 제목 : " + tb_title);

		String tb_contents = req.getParameter("tb_contents");
		tb_contents = tb_contents.replaceAll("/temp", "/upload/images");
		newPost.setTb_contents(tb_contents);
		System.out.println("게시글 내용 : " + tb_contents);

		String img_sysName = req.getParameter("img_sysName");
		System.out.println(img_sysName);
		img_sysName = img_sysName.substring(0, img_sysName.lastIndexOf(","));
		String[] img_sysNames = img_sysName.split(",");
		System.out.println("파일 임시 저장 경로 : " + req.getServletContext().getRealPath("temp") + "\\");
		System.out.println("파일 최종 저장 경로 : " + req.getServletContext().getRealPath("upload") + "\\images\\");

		ActionTo transfer = new ActionTo();
		transfer.setRedirect(true);
		
		// db에 게시글 저장 성공 시
		if (bdao.insert(newPost)) {
			// 게시글에 등록한 파일 하나씩 꺼내기
			System.out.println("게시글 db 등록 성공");
			for (int i = 0; i < img_sysNames.length; i++) {

				// 임시 폴더에 저장한 파일 객체 생성
				File temp_file = new File(req.getServletContext().getRealPath("temp") + "\\" + img_sysNames[i]);

				// images폴더에 저장할 파일 객체 생성
				File new_file = new File(
						req.getServletContext().getRealPath("upload") + "\\images\\" + img_sysNames[i]);

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
			transfer.setPath(req.getContextPath()+"/board/board_list.bo?page=1");
		} else {
			out.write("<script>");	
			out.write("alert('게시글 등록에 실패했습니다')");
			out.write("location.href='"+req.getContextPath()+"/';");			
			out.write("</script>");
			out.close();
			return null;
		}

		return transfer;
	}

}
