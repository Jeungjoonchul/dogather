package com.dogather.dao.dogather;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dogather.dto.dogather.DogatherDTO;
import com.dogather.dto.dogather.DogatherPostDTO;
import com.dogather.mybatis.SqlMapConfig;

public class DogatherDAO {
SqlSession sqlSession;
	
	public DogatherDAO() {
		sqlSession = SqlMapConfig.getFactory().openSession(true);
	}

	public boolean dgDupCheck(String dg_title) {
		return (Integer)sqlSession.selectOne("Dogather.dgDupCheck",dg_title)==0;
	}

	public boolean dgCreate(DogatherDTO dg) {
		return sqlSession.insert("Dogather.dgCreate", dg)==1;
	}

	public int getDgIndexWithDgTitle(String dg_title) {
		return sqlSession.selectOne("Dogather.getDgIndexWithDgTitle", dg_title);
	}

	public boolean dgJoin(int dg_index, int user_index) {
		HashMap<String, Integer> datas = new HashMap<String, Integer>();
		datas.put("dg_index",dg_index);
		datas.put("user_index", user_index);
		
		return sqlSession.insert("Dogather.dgJoin", datas)==1;
	}

	public List<DogatherDTO> getDgList(int startRow,int pageSize,String criteria, String align,String keyword,String category_index) {
		HashMap<String, Object> datas = new HashMap<String, Object>();
		datas.put("startRow",startRow);
		datas.put("pageSize", pageSize);
		datas.put("align", align);
		datas.put("criteria", criteria);
		datas.put("keyword", keyword);
		datas.put("category_index", category_index);
		
		return sqlSession.selectList("Dogather.getDgList", datas);
	}

	public int getDgCnt(String keyword, String category_index) {
		HashMap<String, String> datas = new HashMap<String, String>();
		datas.put("keyword",keyword);
		datas.put("category_index", category_index);
		
		return sqlSession.selectOne("Dogather.getDgCnt", datas);
	}

	public List<DogatherDTO> getDgListOnMain(String criteria) {
		return sqlSession.selectList("Dogather.getDgListOnMain", criteria);
	}

	public DogatherDTO getDetail(int dg_index) {
		return sqlSession.selectOne("Dogather.getDetail", dg_index);
	}

	public List<Integer> getDgMembers(int dg_index) {
		return sqlSession.selectList("Dogather.getDgMembers", dg_index);
	}

	public void setDgUserTarget(int dg_index, int user_index, String dg_user_target, String dg_user_target_date) {
		HashMap<String, Object> datas = new HashMap<String, Object>();
		datas.put("dg_index",dg_index);
		datas.put("user_index", user_index);
		datas.put("dg_user_target", dg_user_target);
		datas.put("dg_user_target_date", dg_user_target_date);

		sqlSession.insert("Dogather.setDgUserTarget",datas);
	}

	public boolean dgPostOn(DogatherPostDTO dp) {
		return sqlSession.insert("Dogather.dgPostOn", dp)==1;
	}
}
