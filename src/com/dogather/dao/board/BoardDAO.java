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
		public int getBoardCnt(String boardName) {
			return sqlSession.selectOne("Board.getBoardCnt",boardName);
		}

		public List<BoardDTO> getBoardList(int startRow, int pageSize,String boardName) {
			HashMap<String, Object> datas = new HashMap<String, Object>();
			datas.put("startRow", startRow);
			datas.put("pageSize", pageSize);
			datas.put("boardName",boardName);
			
			return sqlSession.selectList("Board.getBoardList", datas);
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
		
		
		public List<BoardDTO> getFreeBoardListOnMain(){
			return sqlSession.selectList("Board.getFreeBoardListOnMain");
		}		
}
