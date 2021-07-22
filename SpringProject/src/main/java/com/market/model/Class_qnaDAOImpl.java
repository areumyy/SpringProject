package com.market.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Class_qnaDAOImpl implements Class_qnaDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int getCount(int mem_num) {
		return this.sqlSession.selectOne("getClassQnaCount", mem_num);
	}

	@Override
	public List<Class_qnaDTO> getQnaList(HashMap<String, Object> map) {
		return this.sqlSession.selectList("getQnaList", map);
	}

	@Override
	public List<Class_qnaDTO> getQnaCompleteList(HashMap<String, Object> map) {
		return this.sqlSession.selectList("getQnaCompleteList", map);
	}

	@Override
	public Class_qnaDTO getContent(int qna_num) {
		return this.sqlSession.selectOne("getContent", qna_num);
	}

	@Override
	public int insertAnswer(HashMap<String, Object> map) {
		return this.sqlSession.update("insertAnswer", map);
	}
}
