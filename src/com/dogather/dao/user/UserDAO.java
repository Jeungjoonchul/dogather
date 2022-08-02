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

	public boolean insertUser(UserDTO user) {
		if(sqlSession.insert("User.insertUser",user)==1){
			int user_index = selectUser(user.getUser_email()).getUser_index();
			user.setUser_index(user_index);
			int result1 = sqlSession.insert("User.insertUserTermsAgreement",user);
			int result2 = sqlSession.insert("User.insertUserInfo",user);
			int result3 = sqlSession.insert("User.insertUserAddress",user);	
			if(!(result1==1&&result2==1&&result3==1)) {
				return false;
			}
		}
		return true;
	}
	public UserDTO selectUser(String user_email) {
		return sqlSession.selectOne("User.selectUser", user_email);
	}
	

	
}
