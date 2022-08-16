package com.dogather.dao.dogather;

import org.apache.ibatis.session.SqlSession;

import com.dogather.dto.dogather.DogatherDTO;
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
}
