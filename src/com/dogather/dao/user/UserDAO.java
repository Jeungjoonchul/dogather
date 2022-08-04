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
	
	public UserDTO selectUser(String user_email) {
		return sqlSession.selectOne("User.selectUser", user_email);
	}
	
	public UserDTO loginUser(String user_email, String user_password) {
		//user_email = dbrlgus@naver.com
		//user_password = asdf1234!
		HashMap<String, String> datas = new HashMap<String, String>();
		datas.put("user_email", user_email);
		datas.put("user_password", user_password);
		return sqlSession.selectOne("User.loginUser", datas);
	}
	public boolean insertUser(UserDTO user) {
		if(sqlSession.insert("User.insertUser",user)==1) {
			int user_index=selectUser(user.getUser_email()).getUser_index();
			user.setUser_index(user_index);
			boolean result1=insertUserTermsAgreement(user);
			boolean result2=insertUserInfo(user);
			boolean result3=insertUserAddress(user);
			boolean result4=insertUserBuddies(user);
			boolean result5=insertUserBlock(user);
			boolean result6=insertUserNoteScope(user);
			if(!(result1&&result2&&result3&&result4&&result5&&result6)) {
				deleteUser(user.getUser_index());
				deleteUserTermsAgreement(user.getUser_index());
				deleteUserInfo(user.getUser_index());
				deleteUserAddress(user.getUser_index());
				deleteUserBuddies(user.getUser_index());
				deleteUserBlock(user.getUser_index());
				deleteUserNoteScope(user.getUser_index());
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
	public boolean insertUserBuddies(UserDTO user) {
		return sqlSession.insert("User.insertUserBuddies",user)==1;
	}
	public boolean insertUserBlock(UserDTO user) {
		return sqlSession.insert("User.insertUserBlock",user)==1;
	}
	public boolean insertUserNoteScope(UserDTO user) {
		return sqlSession.insert("User.insertUserNoteScope",user)==1;
	}

	
	public boolean deleteUser(int user_index) {
		return sqlSession.delete("User.deleteUserTermsAgreement",user_index)==1;
	}
	public boolean deleteUserTermsAgreement(int user_index) {
		return sqlSession.delete("User.deleteUserTermsAgreement",user_index)==1;
	}
	public boolean deleteUserInfo(int user_index) {
		return sqlSession.delete("User.deleteUserInfo",user_index)==1;
	}
	public boolean deleteUserAddress(int user_index) {
		return sqlSession.delete("User.deleteUserAddress",user_index)==1;
	}
	public boolean deleteUserBuddies(int user_index) {
		return sqlSession.delete("User.deleteUserBuddies",user_index)==1;
	}
	public boolean deleteUserBlock(int user_index) {
		return sqlSession.delete("User.deleteUserBlock",user_index)==1;
	}
	public boolean deleteUserNoteScope(int user_index) {
		return sqlSession.delete("User.deleteUserNoteScope",user_index)==1;
	}

	
	
	
}
