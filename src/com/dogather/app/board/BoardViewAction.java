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

public class BoardViewAction implements Action {

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp,String b_name,String r_name) throws ServletException, IOException {
		int b_index = Integer.parseInt(req.getParameter("b_index"));
		
		//게시글 가져오기
		BoardDAO bdao = new BoardDAO();
		BoardDTO b = bdao.getPost(b_index, b_name,r_name);
		
		//조회수
		UserDTO loginUser = (UserDTO) req.getSession().getAttribute("loginUser");
		int user_index = loginUser != null ? loginUser.getUser_index() : 0;
		if (user_index != 0) {
			if (b.getUser_index() != user_index) {
				b.setB_hits(b.getB_hits() + 1);
				bdao.updateHits(b_index, b_name);

			}
		}
		
		//댓글 가져오기
		
		ReplyDAO rdao = new ReplyDAO();
		ReplyPaging r = new ReplyPaging("", rdao.getReplyCntOnPost(r_name,b_index));
		List<ReplyDTO> b_replies = rdao.getReplies(r.getStartRow(),r.getPageSize(),r_name,b_index);
		
		req.setAttribute("b", b);
		req.setAttribute("b_replies", b_replies);
		req.setAttribute("totalPage", r.getTotalPage());
		req.setAttribute("totalCnt", r.getTotalCnt());
		req.setAttribute("startPage", r.getStartPage());
		req.setAttribute("endPage", r.getEndPage());
		req.setAttribute("page", r.getPage());
		ActionTo transfer = new ActionTo();
		transfer.setRedirect(false);
		String b_path=b_name.substring(2);
		transfer.setPath("/app/board/"+b_path+"/view.jsp");
		return transfer;

	}
}
