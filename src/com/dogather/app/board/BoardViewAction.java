package com.dogather.app.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dogather.action.Action;
import com.dogather.action.ActionTo;
import com.dogather.dao.board.BoardDAO;
import com.dogather.dto.board.BoardDTO;

public class BoardViewAction implements Action {

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int tb_index = Integer.parseInt(req.getParameter("tb_index"));
		System.out.println(tb_index);
		BoardDAO bdao = new BoardDAO();

		
		int loginUser = Integer.parseInt((String)req.getSession().getAttribute("loginUser"));
		System.out.println(loginUser);
		BoardDTO tb = bdao.selectOne(tb_index);
		System.out.println(tb.getUser_index());
		System.out.println(tb.getTb_contents());

		boolean flag = true;
		// 쿠기가 있다면
		if(tb.getUser_index()!=loginUser) {
			
				// 쿠키들을 cookies에 저장
				Cookie[] cookies = req.getCookies();

				// cookies를 하나씩 확인
				for (Cookie cookie : cookies) {
					
					//"tb-게시판번호-유저 인덱스" 쿠키가 있다면 flag를 false로 변경
					if (cookie.getName().equals("tb-" + tb_index+"-"+loginUser)) {
						flag = false;
					}
				}
			
			//flag==true : cookie가 없다는 뜻이므로 조회수 1 증가 및 db에 저장 후 쿠키 생성(1일뒤 자동 삭제됨)
			//flag==false : 이미 조회수를 증가 시켰으므로 조회수 증가 없음
			if (flag) {
				tb.setTb_hits(tb.getTb_hits()+1);
				bdao.updateHits(tb_index);
				Cookie hits = new Cookie("tb-" + tb_index+"-"+loginUser, "hit");
				hits.setMaxAge(60*60*24);
				resp.addCookie(hits);
			}
		}

		
		req.setAttribute("tb", tb);
		
		ActionTo transfer = new ActionTo();
		transfer.setRedirect(false);
		transfer.setPath("/app/board/board_view.jsp");
		return transfer;
	}

}
