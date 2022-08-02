package com.dogather.dao.user;

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
	
	public UserDTO selectUser(String user_email) {
		return sqlSession.selectOne("User.selectUser", user_email);
	}

	public boolean insertUser(UserDTO user) {
		if(sqlSession.insert("User.insertUser",user)==1) {
			int user_index=selectUser(user.getUser_email()).getUser_index();
			user.setUser_index(user_index);
			boolean result1=insertUserTermsAgreement(user);
			boolean result2=insertUserInfo(user);
			boolean result3=insertUserAddress(user);
			if(!(result1&&result2&&result3)) {
				deleteUser(user.getUser_email());
				deleteUserTermsAgreement(user.getUser_email());
				deleteUserInfo(user.getUser_email());
				deleteUserAddress(user.getUser_email());
				return false;
			}
		}else {
			return false;
		}
		return true;
	}
	public boolean insertUserTermsAgreement(UserDTO user) {
		return sqlSession.insert("User.insertUserTermsAgreement",user)==1;
	}
	public boolean insertUserInfo(UserDTO user) {
		return sqlSession.insert("User.insertUserInfo",user)==1;
	}
	public boolean insertUserAddress(UserDTO user) {
		return sqlSession.insert("User.insertUserAddress",user)==1;
	}
	

	
	public boolean deleteUser(String user_email) {
		return sqlSession.delete("User.deleteUserTermsAgreement",user_email)==1;
	}
	public boolean deleteUserTermsAgreement(String user_email) {
		return sqlSession.delete("User.deleteUserTermsAgreement",user_email)==1;
	}
	public boolean deleteUserInfo(String user_email) {
		return sqlSession.delete("User.deleteUserInfo",user_email)==1;
	}
	public boolean deleteUserAddress(String user_email) {
		return sqlSession.delete("User.deleteUserAddress",user_email)==1;
	}
	
}
