package com.market.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CategoryDAOImpl implements CategoryDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<CategoryDTO> getCate_oneList() {
		return this.sqlSession.selectList("cate_list");
	}

	@Override
	public List<CategoryDTO> getCate_two(String cate_one) {
		return this.sqlSession.selectList("cate_two_list", cate_one);
	}
}
