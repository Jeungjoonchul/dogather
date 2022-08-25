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
		public int getBoardCnt(String b_name,String keyword, String subject) {
			HashMap<String, String> datas = new HashMap<String, String>();
			datas.put("b_name", b_name);
			datas.put("keyword", keyword);
			datas.put("subject", subject);
			
			return sqlSession.selectOne("Board.getBoardCnt",datas);
		}

		public List<BoardDTO> getBoard(int startRow, int pageSize,String keyword,String subject,String b_name,String r_name) {
			HashMap<String, Object> datas = new HashMap<String, Object>();
			datas.put("startRow", startRow);
			datas.put("pageSize", pageSize);
			datas.put("keyword", keyword);
			datas.put("subject", subject);
			datas.put("b_name",b_name);
			datas.put("r_name",r_name);
			
			return sqlSession.selectList("Board.getBoard", datas);
		}

		public int getLastIndex(int user_index) {
			return sqlSession.selectOne("Board.getLastIndex",user_index);
		}

		public boolean postOn(BoardDTO newPost) {
			return sqlSession.insert("Board.postOn",newPost)==1;
		}

		public boolean postOff(int b_index,String b_name) {
			HashMap<String, Object> datas = new HashMap<String, Object>();
			datas.put("b_index",b_index);
			datas.put("b_name",b_name);
			return sqlSession.delete("Board.postOff",datas)==1;			
		}

		public BoardDTO getPost(int b_index, String b_name,String r_name) {
			HashMap<String, Object> datas = new HashMap<String, Object>();
			datas.put("b_index",b_index);
			datas.put("b_name",b_name);
			datas.put("r_name",r_name);
			return sqlSession.selectOne("Board.getPost", datas);
		}

		public boolean updateHits(int b_index,String b_name) {
			HashMap<String, Object> datas = new HashMap<String, Object>();
			datas.put("b_index",b_index);
			datas.put("b_name",b_name);
			return sqlSession.update("Board.updateHits",datas) ==1;
		}
		
		
		public List<BoardDTO> getBoardListOnMain(String b_name,String r_name){
			HashMap<String, String> datas = new HashMap<String, String>();
			datas.put("b_name",b_name);
			datas.put("r_name",r_name);
			return sqlSession.selectList("Board.getBoardListOnMain",datas);
		}

		public boolean updatePost(BoardDTO post) {
			return sqlSession.update("Board.updatePost", post)==1;
		}

		public int getLastIndexWithUserIndex(String b_name, int user_index) {
			HashMap<String, Object> datas = new HashMap<String, Object>();
			datas.put("b_name",b_name);
			datas.put("user_index",user_index);
			return sqlSession.selectOne("Board.getLastIndexWithUserIndex",datas);
		}

		public String getLikeUsers(int b_index,String b_name) {
			HashMap<String, Object> datas = new HashMap<String, Object>();
			datas.put("b_name",b_name);
			datas.put("b_index",b_index);
			return sqlSession.selectOne("Board.getLikeUsers", datas);
		}

		public boolean setLikeUserIndex(int b_index, String b_name, String b_like_user_index) {
			HashMap<String, Object> datas = new HashMap<String, Object>();
			datas.put("b_name",b_name);
			datas.put("b_index",b_index);
			datas.put("b_like_user_index",b_like_user_index);
			return sqlSession.update("Board.setLikeUserIndex", datas)==1;
		}

		public String getLikeCnt(int b_index, String b_name) {
			HashMap<String, Object> datas = new HashMap<String, Object>();
			datas.put("b_name",b_name);
			datas.put("b_index",b_index);
			return sqlSession.selectOne("Board.getLikeCnt", datas);
		}
}