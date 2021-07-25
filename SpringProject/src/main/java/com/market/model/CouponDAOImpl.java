package com.market.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CouponDAOImpl implements CouponDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
}
