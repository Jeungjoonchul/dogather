package com.dogather.dao.user;

import org.apache.ibatis.session.SqlSession;

import com.dogather.mybatis.SqlMapConfig;

public class UserDAO {
	SqlSession sqlsession;
	
	public UserDAO() {
		sqlsession = SqlMapConfig.getFactory().openSession(true);
	}
}
