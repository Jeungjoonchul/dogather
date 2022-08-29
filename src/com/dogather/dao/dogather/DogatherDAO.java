package com.dogather.dao.dogather;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dogather.dto.dogather.DogatherDTO;
import com.dogather.dto.dogather.DogatherPostDTO;
import com.dogather.dto.dogather.DogatherReplyDTO;
import com.dogather.dto.dogather.DogatherUserDTO;
import com.dogather.dto.dogather.DogatherUserInfoDTO;
import com.dogather.dto.dogather.DogatherUserTargetDTO;
import com.dogather.mybatis.SqlMapConfig;

public class DogatherDAO {
SqlSession sqlSession;
	
	public DogatherDAO() {
		sqlSession = SqlMapConfig.getFactory().openSession(true);
	}

	public boolean dgDupCheck(String dg_title) {
		return (Integer)sqlSession.selectOne("Dogather.dgDupCheck",dg_title)==0;
	}

	public boolean dgCreate(DogatherDTO dg) {
		return sqlSession.insert("Dogather.dgCreate", dg)==1;
	}

	public int getDgIndexWithDgTitle(String dg_title) {
		return sqlSession.selectOne("Dogather.getDgIndexWithDgTitle", dg_title);
	}

	public boolean dgJoin(int dg_index, int user_index) {
		HashMap<String, Integer> datas = new HashMap<String, Integer>();
		datas.put("dg_index",dg_index);
		datas.put("user_index", user_index);
		
		return sqlSession.insert("Dogather.dgJoin", datas)==1;
	}

	public List<DogatherDTO> getDgList(int dg_startRow,int dg_pageSize,String criteria, String align,String keyword,String category_index) {
		HashMap<String, Object> datas = new HashMap<String, Object>();
		datas.put("dg_startRow",dg_startRow);
		datas.put("dg_pageSize", dg_pageSize);
		datas.put("align", align);
		datas.put("criteria", criteria);
		datas.put("keyword", keyword);
		datas.put("category_index", category_index);
		
		return sqlSession.selectList("Dogather.getDgList", datas);
	}

	public int getDgCnt(String keyword, String category_index) {
		HashMap<String, String> datas = new HashMap<String, String>();
		datas.put("keyword",keyword);
		datas.put("category_index", category_index);
		
		return sqlSession.selectOne("Dogather.getDgCnt", datas);
	}

	public List<DogatherDTO> getDgListOnMain(String criteria) {
		return sqlSession.selectList("Dogather.getDgListOnMain", criteria);
	}

	public DogatherDTO getDetail(int dg_index) {
		return sqlSession.selectOne("Dogather.getDetail", dg_index);
	}

	public List<Integer> getDgMembers(int dg_index) {
		return sqlSession.selectList("Dogather.getDgMembers", dg_index);
	}

	public void setDgUserTarget(int dg_index, int user_index, String dg_user_target, String dg_user_target_date) {
		HashMap<String, Object> datas = new HashMap<String, Object>();

		datas.put("dg_index",dg_index);
		datas.put("user_index", user_index);
		datas.put("dg_user_target", dg_user_target);
		datas.put("dg_user_target_date", dg_user_target_date);

		sqlSession.insert("Dogather.setDgUserTarget",datas);
	}

	public boolean dgPostOn(DogatherPostDTO dp) {
		return sqlSession.insert("Dogather.dgPostOn", dp)==1;
	}

	public List<DogatherDTO> getDpList(int dp_startRow,int dp_pageSize,int dg_index,String user_index,String dp_type,String dp_align) {
		HashMap<String, Object> datas = new HashMap<String, Object>();
		datas.put("dp_startRow",dp_startRow);
		datas.put("dp_pageSize", dp_pageSize);
		datas.put("dg_index",dg_index);
		datas.put("user_index",user_index);
		datas.put("dp_type", dp_type);
		datas.put("dp_align", dp_align);
		return sqlSession.selectList("Dogather.getDpList", datas);
	}

	public int getDpCnt(int dg_index,String dp_type,String user_index) {
		HashMap<String, Object> datas = new HashMap<String, Object>();
		datas.put("dg_index",dg_index);
		datas.put("dp_type",dp_type);
		datas.put("user_index", user_index);
		return sqlSession.selectOne("Dogather.getDpCnt",datas);
	}

//	public List<String> getLikeUserListByDP(int dg_index) {
//		return sqlSession.selectList("Dogather.getLikeUserListByDP", dg_index);
//	}

	public boolean dgQuit(int user_index, int dg_index) {
		HashMap<String, Integer> datas = new HashMap<String, Integer>();
		datas.put("user_index",user_index);
		datas.put("dg_index",dg_index);
		return sqlSession.delete("Dogather.dgQuit",datas)==1;
	}

	public List<DogatherUserDTO> getDgMembersInfo(int dg_index) {

		return sqlSession.selectList("Dogather.getDgMembersInfo", dg_index);
	}

	public boolean dgReJoin(int dg_index, int user_index) {
		HashMap<String, Integer> datas = new HashMap<String, Integer>();
		datas.put("user_index",user_index);
		datas.put("dg_index",dg_index);
		return sqlSession.update("Dogather.dgReJoin",datas)==1;
	}

	public void updateDgUserTarget(int dg_index, int user_index, String dg_user_target, String dg_user_target_date) {
		HashMap<String, Object> datas = new HashMap<String, Object>();

		datas.put("dg_index",dg_index);
		datas.put("user_index", user_index);
		datas.put("dg_user_target", dg_user_target);
		datas.put("dg_user_target_date", dg_user_target_date);
		sqlSession.update("Dogather.updateDgUserTarget",datas);
		
	}

	public DogatherPostDTO getPostDetail(int dp_index) {
		return sqlSession.selectOne("Dogather.getPostDetail", dp_index);
	}

	public List<DogatherReplyDTO> getReplyList(int startRow, int pageSize,int dp_index) {
		HashMap<String, Integer> datas = new HashMap<String, Integer>();
		datas.put("startRow",startRow);
		datas.put("pageSize", pageSize);
		datas.put("dp_index",dp_index);
		return sqlSession.selectList("Dogather.getReplyList",datas);
	}

	public int getReplyTotalCnt(int dp_index) {
		return sqlSession.selectOne("Dogather.getReplyTotalCnt", dp_index);
	}

	public boolean dpReplyOn(DogatherReplyDTO dr) {
		return sqlSession.insert("Dogather.dpReplyOn", dr)==1;
	}

	public DogatherReplyDTO getReplyLastOn(int dp_index, int user_index) {
		HashMap<String, Integer> datas = new HashMap<String, Integer>();
		datas.put("dp_index",dp_index);
		datas.put("user_index", user_index);
		return sqlSession.selectOne("Dogather.getReplyLastOn",datas);
	}

	public void dgHitUp(int dg_index) {
		sqlSession.update("Dogather.dgHitUp", dg_index);
	}

	public boolean updateReply(int dpr_index, String dpr_contents) {
		HashMap<String, Object> datas = new HashMap<String, Object>();
		datas.put("dpr_index",dpr_index);
		datas.put("dpr_contents", dpr_contents);
		return sqlSession.update("Dogather.updateReply", datas)==1;
	}

	public boolean deleteReply(int dpr_index) {
		return sqlSession.delete("Dogather.deleteReply", dpr_index)==1;
	}

	public String getLikeUsersByDP(int dp_index) {
		return sqlSession.selectOne("Dogather.getLikeUsersByDP", dp_index);
	}

	public boolean setLikeUserIndexByDP(int dp_index, String dp_like_user_index) {
		HashMap<String, Object> datas = new HashMap<String, Object>();
		datas.put("dp_index",dp_index);
		datas.put("dp_like_user_index", dp_like_user_index);
		return sqlSession.update("Dogather.setLikeUserIndex", datas)==1;
	}

	public String getLikeCntByDP(int dp_index) {
		return sqlSession.selectOne("Dogather.getLikeCntByDP", dp_index);
	}

	public DogatherUserInfoDTO getDgUserInfo(int dg_index, int user_index) {
		HashMap<String, Integer> datas = new HashMap<String, Integer>();
		datas.put("dg_index",dg_index);
		datas.put("user_index", user_index);
		return sqlSession.selectOne("Dogather.getDgUserInfo", datas);
	}

	public List<DogatherPostDTO> getDgCertPostList(int dg_index, int user_index,String year, String month) {
		HashMap<String, Object> datas = new HashMap<String, Object>();
		datas.put("dg_index",dg_index);
		datas.put("user_index", user_index);
		datas.put("year", year);
		datas.put("month", month);
		return sqlSession.selectList("Dogather.getDgCertPostList", datas);
	}

	public boolean dgPostDelete(int dp_index) {
		return sqlSession.delete("Dogather.dgPostDelete", dp_index)==1;
	}
}
