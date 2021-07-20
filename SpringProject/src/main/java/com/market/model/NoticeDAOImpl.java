package com.market.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDAOImpl implements NoticeDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int getListCount(int flag) {
		return this.sqlSession.selectOne("notice_list_count", flag);
	}

	@Override
	public List<NoticeDTO> getNoticeList(PageDTO dto) {
		return this.sqlSession.selectList("notice_list", dto);
	}
}
