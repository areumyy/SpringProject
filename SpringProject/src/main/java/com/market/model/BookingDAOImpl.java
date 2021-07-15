package com.market.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BookingDAOImpl implements BookingDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
}
