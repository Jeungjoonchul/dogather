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

		public List<BoardDTO> selectList(int startRow, int pageSize) {
			HashMap<String, Integer> datas = new HashMap<String, Integer>();
			datas.put("startRow", startRow);
			datas.put("pageSize", pageSize);
			
			return sqlSession.selectList("Board.selectList", datas);
		}

		public int getLastIndex(int user_index) {
			return sqlSession.selectOne("Board.getLastIndex",user_index);
		}

		public boolean insert(BoardDTO newPost) {
			return sqlSession.insert("Board.insert",newPost)==1;
		}

		public void delete(int tb_index) {
			sqlSession.delete("Board.delete",tb_index);			
		}

		public BoardDTO selectOne(int tb_index) {
			return sqlSession.selectOne("Board.selectOne", tb_index);
		}

		public void updateHits(int tb_index) {
			sqlSession.update("Board.updateHits",tb_index);
		}
}
