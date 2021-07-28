package com.market.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class HostDAOImpl implements HostDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertHost(HostDTO dto) {
		return this.sqlSession.insert("insert_host", dto);
	}

	@Override
	public HostDTO getInfo_memnum(int mem_num) {
		return this.sqlSession.selectOne("getInfo_memnum", mem_num);
	}

	@Override
	public int updateHostInfo(HostDTO dto) {
		return this.sqlSession.update("updateHostInfo", dto);
	}
}
