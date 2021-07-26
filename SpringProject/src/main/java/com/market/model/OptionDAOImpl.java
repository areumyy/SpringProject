package com.market.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OptionDAOImpl implements OptionDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertOption(OptionDTO dto) {
		return this.sqlSession.insert("insertOption", dto);
	}

	@Override
	public List<OptionDTO> getOptionList(int num) {
		return this.sqlSession.selectList("getOptionList", num);
	}

	@Override
	public int getOptionCount(int num) {
		return this.sqlSession.selectOne("getOptionCount", num);
	}

	@Override
	public int deleteOption(int num) {
		return this.sqlSession.delete("deleteOption", num);
	}

	@Override
	public int getmaxoptionNum(int num) {
		return this.sqlSession.selectOne("getmaxoptionNum",num);
	}

	@Override
	public int getcountoption(int num) {
		return this.sqlSession.selectOne("getcountoption", num);
	}

	@Override
	public int optionNumdown(HashMap<String, Integer> map) {
		return this.sqlSession.update("optionNumdown", map);
	}

}
