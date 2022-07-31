package com.dogather.dao.user;

import org.apache.ibatis.session.SqlSession;

import com.dogather.mybatis.SqlMapConfig;

public class UserDAO {
	SqlSession sqlSession;
	
	public UserDAO() {
		sqlSession = SqlMapConfig.getFactory().openSession(true);
	}

	public int selectUser(String user_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("User.selectUser",user_id);
	}
	
	
}
