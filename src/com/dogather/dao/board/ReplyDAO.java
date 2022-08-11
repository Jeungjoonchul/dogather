package com.dogather.dao.board;

import java.util.HashMap;
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

	public List<ReplyDTO> getReplies(int startRow,int pageSize,String r_name, int b_index) {
		HashMap<String, Object> datas = new HashMap<String, Object>();
		datas.put("startRow", startRow);
		datas.put("pageSize", pageSize);
		datas.put("r_name", r_name);
		datas.put("b_index", b_index);
		return sqlSession.selectList("Reply.getReplies", datas);
	}

	public int getReplyCntOnPost(String r_name, int b_index) {
		HashMap<String, Object> datas = new HashMap<String, Object>();
		datas.put("r_name", r_name);
		datas.put("b_index", b_index);
		return sqlSession.selectOne("Reply.getReplyCntOnPost", datas);
	}
	
}
