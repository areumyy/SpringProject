package com.market.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ClassDAOImpl implements ClassDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertClass(ClassDTO dto) {	
		return this.sqlSession.insert("insertClass", dto);
	}

	@Override
	public int countClass() {
		return this.sqlSession.selectOne("countClass");
	}

	@Override
	public List<ClassDTO> getList_MemNum(HashMap<String, Integer> map) {
		return this.sqlSession.selectList("getList_MemNum", map);
	}

	@Override
	public List<ClassDTO> getList_endClass(HashMap<String, Integer> map) {
		return this.sqlSession.selectList("getList_endClass", map);
	}

	@Override
	public ClassDTO getList_classNum(int class_num) {
		
		return this.sqlSession.selectOne("getList_classNum", class_num);
	}

	@Override
	public int UpdateClass(ClassDTO dto) {
		return this.sqlSession.update("updateClass", dto);
	}

	@Override
	public int countClass(int mem_num) {
		return this.sqlSession.selectOne("countClass_memnum", mem_num);
	}

	@Override
	public List<ClassDTO> getList(HashMap<String, Object> map) {
		return this.sqlSession.selectList("getList", map);
	}

	@Override
	public int requestCal(int target) {
		return this.sqlSession.update("class_req_cal", target);
	}

}
