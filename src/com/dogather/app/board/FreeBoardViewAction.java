package com.dogather.app.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dogather.action.Action;
import com.dogather.action.ActionTo;
import com.dogather.dao.board.BoardDAO;
import com.dogather.dao.board.ReplyDAO;
import com.dogather.dto.board.BoardDTO;
import com.dogather.dto.board.ReplyDTO;
import com.dogather.dto.user.UserDTO;
import com.dogather.util.ReplyPaging;

public class FreeBoardViewAction implements Action {

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int b_index = Integer.parseInt(req.getParameter("b_index"));
		String b_name = "t_free_board";
		String r_name = "t_fb_reply";

		
		//게시글 가져오기
		BoardDAO bdao = new BoardDAO();
		BoardDTO fb = bdao.getPost(b_index, b_name);
		
		//조회수
		UserDTO loginUser = (UserDTO) req.getSession().getAttribute("loginUser");
		int user_index = loginUser != null ? loginUser.getUser_index() : 0;
		if (user_index != 0) {
			if (fb.getUser_index() != user_index) {
				fb.setB_hits(fb.getB_hits() + 1);
				bdao.updateHits(b_index, b_name);

			}
		}
		
		//댓글 가져오기
		
		ReplyDAO rdao = new ReplyDAO();
		ReplyPaging r = new ReplyPaging("", rdao.getReplyCntOnPost(r_name,b_index));
		List<ReplyDTO> fb_replies = rdao.getReplies(r.getStartRow(),r.getPageSize(),r_name,b_index);
		
		req.setAttribute("fb", fb);
		req.setAttribute("fb_replies", fb_replies);
		req.setAttribute("totalPage", r.getTotalPage());
		req.setAttribute("totalCnt", r.getTotalCnt());
		req.setAttribute("startPage", r.getStartPage());
		req.setAttribute("endPage", r.getEndPage());
		req.setAttribute("page", r.getPage());
		ActionTo transfer = new ActionTo();
		transfer.setRedirect(false);
		transfer.setPath("/app/board/free_board/view.jsp");
		return transfer;

	}
}
