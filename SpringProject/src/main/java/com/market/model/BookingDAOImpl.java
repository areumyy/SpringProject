package com.market.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BookingDAOImpl implements BookingDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int getCount(int class_num) {
		return this.sqlSession.selectOne("getBookingCount", class_num);
	}

	@Override
	public List<BookingDTO> getList(HashMap<String, Object> map) {
		return this.sqlSession.selectList("getBookingList", map);
	}

	@Override
	public int entercheck(int booking_num) {
		return this.sqlSession.update("entercheck", booking_num);
	}

	@Override
	public int entercancel(int booking_num) {
		return this.sqlSession.update("entercancel", booking_num);
	}

	@Override
	public int getCountEnter(int class_num) {
		return this.sqlSession.selectOne("count_class_enter", class_num);
	}

	@Override
	public int getcount_option_num(int option_num) {
		return this.sqlSession.selectOne("getcount_option_num", option_num);
	}

	@Override
	public void insertBooking(BookingDTO dto) {
		this.sqlSession.insert("insert_booking", dto);
	}
}
