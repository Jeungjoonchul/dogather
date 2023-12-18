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

public class DogatherCatalogAction implements Action {

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		DogatherDAO ddao = new DogatherDAO();
		
		//정렬 기준(등록순, 회원순, 조회순)
		String criteria_key = req.getParameter("criteria_key");
		criteria_key = criteria_key==null?"dg_index":criteria_key;
		String criteria = criteria_key.equals("dg_member_cnt")?"du."+criteria_key:"d."+criteria_key;
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
		category_index=category_index==null?"":category_index;
		System.out.println("category_index : "+category_index+"("+category_index.length()+")");
		
		//페이징 처리
		String dg_page = req.getParameter("dg_page");
		int totalCnt=ddao.getDgCnt(keyword,category_index);
		DogatherPaging paging = new DogatherPaging(dg_page, totalCnt);
		
		List<DogatherDTO> list = ddao.getDgList(paging.getStartRow(),paging.getPageSize(),criteria,align,keyword,category_index);
		System.out.println("list.size() : "+list.size());
		req.setAttribute("list", list);
		req.setAttribute("criteria_key", criteria_key);
		req.setAttribute("align", align);
		req.setAttribute("keyword", keyword);
		req.setAttribute("category_index", category_index);
		req.setAttribute("dg_totalPage", paging.getTotalPage());
		req.setAttribute("dg_totalCnt", paging.getTotalCnt());
		req.setAttribute("dg_startPage", paging.getStartPage());
		req.setAttribute("dg_endPage", paging.getEndPage());
		req.setAttribute("dg_page", paging.getPage());

		
		ActionTo transfer = new ActionTo();
		transfer.setRedirect(false);
		transfer.setPath("/app/dg/catalog.jsp");
		
		return transfer;
	}
}
