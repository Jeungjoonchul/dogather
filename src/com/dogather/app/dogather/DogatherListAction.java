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
import com.dogather.util.DogatherPaging;

public class DogatherListAction implements Action {

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		DogatherDAO ddao = new DogatherDAO();
		
		//정렬 기준(등록순, 회원순, 조회순)
		String criteria = req.getParameter("criteria");
		criteria = criteria==null?"dg_index":criteria;
		System.out.println("criteria : "+criteria);

		//정렬 방법(내림차순, 오름차순)
		String align = req.getParameter("align");
		align = align==null?"desc":align;
		System.out.println("align : "+align);
		
		//키워드(제목, 설명, 짧은설명, 카테고리)
		String keyword=req.getParameter("keyword");
		keyword=keyword==null?"":keyword;
		System.out.println("keyword : "+keyword);
		
		String category_index=req.getParameter("category_index");
		category_index=category_index==null?"":keyword;
		System.out.println("category_index : "+category_index);
		
		//페이징 처리
		String page = req.getParameter("page");
		int totalCnt=ddao.getDgCnt(keyword,category_index);
		DogatherPaging paging = new DogatherPaging(page, totalCnt);
		System.out.println("Page : "+paging.getPage());
		System.out.println("TotalCnt : "+paging.getTotalCnt());
		System.out.println("TotalPage : "+paging.getTotalPage());
		System.out.println("StartRow : "+paging.getStartRow());
		System.out.println("PageSize : "+paging.getPageSize());
		System.out.println("StartPage : "+paging.getStartPage());
		System.out.println("EndPage : "+paging.getEndPage());
		
		List<DogatherDTO> list = ddao.getDgList(paging.getStartRow(),paging.getPageSize(),criteria,align,keyword,category_index);
		System.out.println("list.size() : "+list.size());
		req.setAttribute("list", list);
		req.setAttribute("criteria", criteria);
		req.setAttribute("align", align);
		req.setAttribute("keyword", keyword);
		req.setAttribute("category_index", category_index);
		req.setAttribute("totalPage", paging.getTotalPage());
		req.setAttribute("totalCnt", paging.getTotalCnt());
		req.setAttribute("startPage", paging.getStartPage());
		req.setAttribute("endPage", paging.getEndPage());
		req.setAttribute("page", paging.getPage());

		
		ActionTo transfer = new ActionTo();
		transfer.setRedirect(false);
		transfer.setPath("/app/dg/list.jsp");
		
		return transfer;
	}
}
