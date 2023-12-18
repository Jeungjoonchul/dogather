package com.dogather.dao.terms;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dogather.dto.terms.TermsDTO;
import com.dogather.mybatis.SqlMapConfig;

public class TermsDAO {
	SqlSession sqlSession;
	
	public TermsDAO() {
		sqlSession = SqlMapConfig.getFactory().openSession(true);
	}

	public List<TermsDTO> selectList() {
		return sqlSession.selectList("Terms.selectList");
	}

	public void setTerms(TermsDTO termsDTO) {
		sqlSession.update("Terms.setTerms",termsDTO);
	}
}
