package com.dogather.dao.user;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.dogather.dto.user.UserDTO;
import com.dogather.mybatis.SqlMapConfig;

public class UserDAO {
	SqlSession sqlSession;
	
	public UserDAO() {
		sqlSession = SqlMapConfig.getFactory().openSession(true);
	}

	public boolean checkEmail(String user_email) {
		return (Integer)sqlSession.selectOne("User.checkEmail",user_email)==0;
	}
	
	public boolean checkNickname(String user_nickname) {
		return (Integer)sqlSession.selectOne("User.checkNickname",user_nickname)==0;
	}
	
	public UserDTO selectUserWithUserEmail(String user_email) {
		return sqlSession.selectOne("User.selectUserWithUserEmail", user_email);
	}
	
	public UserDTO selectUserWithUserInfo(String user_email, String user_password) {
		HashMap<String, String> datas = new HashMap<String, String>();
		datas.put("user_email", user_email);
		datas.put("user_password", user_password);
		return sqlSession.selectOne("User.selectUserWithUserInfo", datas);
	}

	public UserDTO loginUser(String user_email, String user_password) {
		HashMap<String, String> datas = new HashMap<String, String>();
		datas.put("user_email", user_email);
		datas.put("user_password", user_password);
		return sqlSession.selectOne("User.loginUser", datas);
	}
	
	public boolean insertUser(UserDTO user) {
		return sqlSession.insert("User.insertUser", user)==1;
	}
	




	public void updateLastLogin(int user_index) {
		sqlSession.update("User.updateLastLogin",user_index);
	}

	public boolean updatePassword(int user_index, String user_new_password) {
		HashMap<String, Object> values = new HashMap<String, Object>();
		values.put("user_index", user_index);
		values.put("user_new_password", user_new_password);
		return sqlSession.update("User.updatePassword", values) == 1;
	}

	public String selectUserPassword(int user_index) {
		return (String)sqlSession.selectOne("User.selectUserPassword", user_index);
		
	}
 
	



	
	
}
