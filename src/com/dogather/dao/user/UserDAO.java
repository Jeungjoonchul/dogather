package com.dogather.dao.user;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.dogather.dao.user.UserDTO;
import com.dogather.mybatis.SqlMapConfig;

public class UserDAO {
	SqlSession sqlsession;
	
	public UserDAO() {
		sqlsession = SqlMapConfig.getFactory().openSession(true);
	}
	
	public boolean join(UserDTO user) {
		return sqlsession.insert("User.join",user) == 1;
	}

	public boolean check(String user_email) {
		return (Integer)sqlsession.selectOne("User.checkEmail",user_email) == 0;
	}

	public boolean login(String user_email, String user_password) {
		HashMap<String, String> datas = new HashMap<String, String>();
		datas.put("user_email", user_email);
		datas.put("user_password", user_password);
		return (Integer)sqlsession.selectOne("User.login",datas) == 1;
	}
}








