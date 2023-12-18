package com.dogather.app.dogather;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dogather.action.Action;
import com.dogather.action.ActionTo;
import com.dogather.dao.dogather.DogatherDAO;
import com.dogather.dto.dogather.DogatherDTO;
import com.dogather.dto.user.UserDTO;
import com.dogather.util.DogatherPaging;

public class DogatherDetailAction implements Action {

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		DogatherDAO ddao = new DogatherDAO();
		
		int dg_index = Integer.parseInt(req.getParameter("dg_index"));
		System.out.println("dg_index : "+dg_index);
		String dp_page = req.getParameter("dp_page");
		System.out.println("dp_page : "+dp_page);
//		String criteria_key = req.getParameter("criteria_key");
//		String align = req.getParameter("align");
//		String keyword = req.getParameter("keyword");
//		String category_index = req.getParameter("category_index");

		// dogather post 검색 유형(전체, 피드, 인증)
		String dp_type = req.getParameter("dp_type");
		dp_type = dp_type == null ? "" : dp_type.equals("all") ? "" : dp_type;
		System.out.println("dp_type : " + dp_type);

		// dogather post 정렬 기준(좋아요순, 최신순)
		String dp_align = req.getParameter("dp_align");
		dp_align = dp_align == null ? "dp_reg_date" : dp_align;
		System.out.println("dp_align : " + dp_align);

		// dogather post 내가 쓴글 보기
		String dp_mine = req.getParameter("dp_mine");
		String user_index = null;
		boolean uif = false;
		if (req.getSession().getAttribute("loginUser") != null) {
			if (dp_mine != null) {
				if (dp_mine.equals("on")) {
					uif = true;
				}
			}
		}
		user_index = uif ? ((UserDTO) req.getSession().getAttribute("loginUser")).getUser_index() + "" : "%%";
		System.out.println("user_index : " + user_index);
		System.out.println("dp_mine : " + dp_mine);

		// dg_index에 해당하는 dogather
		DogatherDTO dg = ddao.getDetail(dg_index);
		boolean flag=true;
		UserDTO dg_user=(UserDTO)req.getSession().getAttribute("loginUser");
		if(dg_user!=null) {
			if(dg.getUser_index()==dg_user.getUser_index()) {
				flag=false;
			}
		}
		if(flag) {
			ddao.dgHitUp(dg.getDg_index());
			dg.setDg_hits(dg.getDg_hits()+1);
		}
		req.setAttribute("dg", dg);

		// dg에 가입한 사람 List
		List<Integer> members = ddao.getDgMembers(dg_index);
		req.setAttribute("members", members);

		// dg Post
		DogatherPaging paging = new DogatherPaging(dp_page, ddao.getDpCnt(dg_index, dp_type, user_index));
		List<DogatherDTO> dpList = ddao.getDpList(paging.getStartRow(), paging.getPageSize(), dg_index, user_index,
				dp_type, dp_align);
		req.setAttribute("dpList", dpList);
		req.setAttribute("dg_index", dg_index);
		req.setAttribute("dp_totalPage", paging.getTotalPage());
		req.setAttribute("dp_totalCnt", paging.getTotalCnt());
		req.setAttribute("dp_startPage", paging.getStartPage());
		req.setAttribute("dp_endPage", paging.getEndPage());
		req.setAttribute("dp_page", paging.getPage());
		req.setAttribute("dp_type", dp_type);
		req.setAttribute("dp_align", dp_align);
		req.setAttribute("dp_mine", dp_mine);

		ActionTo transfer = new ActionTo();
		transfer.setRedirect(false);
		transfer.setPath("/app/dg/detail.jsp");
		return transfer;
	}

}
