package com.market.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDAOImpl implements ReviewDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int getCount_memnum(int mem_num) {
		return this.sqlSession.selectOne("getCount_memnum", mem_num);
	}

	@Override
	public List<ReviewDTO> getList_memnum(HashMap<String, Object> map) {
		return this.sqlSession.selectList("getList_memnum", map);
	}

	@Override
	public int insertReply(HashMap<String, Object> map) {
		return this.sqlSession.update("insertReply", map);
	}

	public ReviewDTO reviewInfo(int num) {
		
		return this.sqlSession.selectOne("reviewInfo", num);
	}

	@Override
	public int reviewPercent(int num) {
		
		return this.sqlSession.selectOne("reviewPercent", num);
	}

	@Override
	public List<ReviewDTO> getReviewList(int num) {
		
		return this.sqlSession.selectList("reviewlist", num);
	}
}
