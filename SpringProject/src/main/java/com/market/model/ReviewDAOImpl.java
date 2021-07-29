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

	@Override
	public int insert_review(ReviewDTO dto) {
		return this.sqlSession.insert("insert_review", dto);
	}
	
	@Override
	public ReviewDTO get_review(int review_num) {
		return this.sqlSession.selectOne("get_review", review_num);
	}
	
	@Override
	public int update_review(ReviewDTO dto) {
		return this.sqlSession.update("update_review", dto);

	}
}
