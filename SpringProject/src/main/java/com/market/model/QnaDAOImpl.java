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

	@Override
	public int getSearchListCount(String keyword, int flag) {
		String target = null;
		if (flag == 0) {
			target = "member";
		}

		return this.sqlSession.selectOne("qna_search_list_count_" + target, keyword);
	}

	@Override
	public List<QnaDTO> getQnaSearchList(PageDTO dto) {
		return this.sqlSession.selectList("qna_search_list_member", dto);
	}

}
