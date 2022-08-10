package com.dogather.dao.board;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dogather.dto.board.ReplyDTO;
import com.dogather.mybatis.SqlMapConfig;

public class ReplyDAO {
	SqlSession sqlSession;

	public ReplyDAO() {
		sqlSession = SqlMapConfig.getFactory().openSession(true);
	}

	public boolean replyOn(ReplyDTO reply) {
		return sqlSession.insert("Reply.replyOn", reply)==1;		
	}

	public List<ReplyDTO> getReplies(String r_name) {
		return sqlSession.selectList("Reply.getReplies", r_name);
	}
	
}
