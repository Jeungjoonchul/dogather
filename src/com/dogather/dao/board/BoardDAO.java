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
		public int getBoardCnt(String b_name) {
			return sqlSession.selectOne("Board.getBoardCnt",b_name);
		}

		public List<BoardDTO> getBoard(int startRow, int pageSize,String b_name) {
			HashMap<String, Object> datas = new HashMap<String, Object>();
			datas.put("startRow", startRow);
			datas.put("pageSize", pageSize);
			datas.put("b_name",b_name);
			
			return sqlSession.selectList("Board.getBoard", datas);
		}

		public int getLastIndex(int user_index) {
			return sqlSession.selectOne("Board.getLastIndex",user_index);
		}

		public boolean postOn(BoardDTO newPost) {
			return sqlSession.insert("Board.postOn",newPost)==1;
		}

		public void postOff(int b_index,String b_name) {
			HashMap<String, Object> datas = new HashMap<String, Object>();
			datas.put("b_index",b_index);
			datas.put("b_name",b_name);
			sqlSession.delete("Board.postOff",datas);			
		}

		public BoardDTO getPost(int b_index, String b_name) {
			HashMap<String, Object> datas = new HashMap<String, Object>();
			datas.put("b_index",b_index);
			datas.put("b_name",b_name);
			return sqlSession.selectOne("Board.getPost", datas);
		}

		public void updateHits(int b_index,String b_name) {
			HashMap<String, Object> datas = new HashMap<String, Object>();
			datas.put("b_index",b_index);
			datas.put("b_name",b_name);
			sqlSession.update("Board.updateHits",datas);
		}
		
		
		public List<BoardDTO> getBoardListOnMain(String b_name){
			return sqlSession.selectList("Board.getBoardListOnMain",b_name);
		}
}
