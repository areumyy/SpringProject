package com.market.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDAOImpl implements ReviewDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
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
