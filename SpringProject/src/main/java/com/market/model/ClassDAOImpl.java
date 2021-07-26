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
	public List<ClassDTO> getList_classNum(int class_num) {
		
		return this.sqlSession.selectList("getList_classNum", class_num);
	}

	// 프립 승인대기 리스트
	@Override
	public List<ClassDTO> fripPass_wait() {
		
		return this.sqlSession.selectList("fripPass_wait");
	}

	// 승인대기 수
	@Override
	public int fripPass_wait_count() {
		
		return this.sqlSession.selectOne("fripPass_wait_count");
	}
	
	// 프립 승인완료 리스트
	@Override
	public List<ClassDTO> fripPass_finish() {
		
		return this.sqlSession.selectList("fripPass_finish");
	}
	
	// 승인완료 수
	@Override
	public int fripPass_finish_count() {
		
		return this.sqlSession.selectOne("fripPass_finish_count");
	}

	// 프립승인 시 class_pass= '0' => '1' 상태 변경 + 승일일자 업데이트
	@Override
	public int fripPass_result(int class_num) {
		
		return this.sqlSession.update("fripPass_result", class_num);
	}

	
	
	
}
