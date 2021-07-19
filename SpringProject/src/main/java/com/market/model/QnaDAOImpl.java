package com.market.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class QnaDAOImpl implements QnaDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int getListCount(int flag) {
		return this.sqlSession.selectOne("qna_list_count", flag);
	}
	
	@Override
	public List<QnaDTO> getQnaList(PageDTO dto) {
		return this.sqlSession.selectList("qna_list", dto);
	}
}
