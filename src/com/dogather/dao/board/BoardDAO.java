package com.dogather.dao.board;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dogather.dto.board.BoardDTO;
import com.dogather.mybatis.SqlMapConfig;

public class BoardDAO {

		SqlSession sqlSession;

		public BoardDAO() {
			sqlSession = SqlMapConfig.getFactory().openSession(true);
		}
		
		//전체 게시글 개수
		public int getBoardCnt() {
			return sqlSession.selectOne("Board.getBoardCnt");
			
		}

		public List<BoardDTO> getBoardList(int startRow, int pageSize) {
			HashMap<String, Integer> datas = new HashMap<String, Integer>();
			datas.put("startRow", startRow);
			datas.put("pageSize", pageSize);
			
			return sqlSession.selectList("Board.getBoardList", datas);
		}
}
