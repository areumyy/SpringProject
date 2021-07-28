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
	public List<ClassDTO> getList_endOkAll(HashMap<String, Integer> map) {
		return this.sqlSession.selectList("getList_endOkAll", map);
	}
	
	@Override
	public List<ClassDTO> getList_endOk(HashMap<String, Integer> map) {
		return this.sqlSession.selectList("getList_endOk", map);
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

	public int getAllListCount(int num) {

		return this.sqlSession.selectOne("totalallcount", num);
	}

	@Override
	public int getWeekAllListCount(int num) {

		return this.sqlSession.selectOne("weekallcount", num);
	}

	@Override
	public int getNewAllListCount(int num) {

		return this.sqlSession.selectOne("newallcount", num);
	}

	@Override
	public List<ClassDTO> getBestClassAllList(int num) {

		return this.sqlSession.selectList("bestalllist", num);
	}

	@Override
	public List<ClassDTO> getWeekClassAllList(int num) {

		return this.sqlSession.selectList("weekalllist", num);
	}

	@Override
	public List<ClassDTO> getNewClassAllList(int num) {

		return this.sqlSession.selectList("newalllist", num);
	}

	@Override
	public ClassDTO getCategoryName(int num) {

		return this.sqlSession.selectOne("categoryname", num);
	}

	@Override
	public List<ClassDTO> getCategoryNameList(int num) {

		return this.sqlSession.selectList("categorynamelist", num);
	}

	@Override
	public List<ClassDTO> getClassAllList(int num) {

		return this.sqlSession.selectList("alllist1", num);
	}

	@Override
	public List<ClassDTO> getClassList(int num) {

		return this.sqlSession.selectList("alllist2", num);
	}

	@Override
	public ClassDTO getclassCont(int num) {
		
		return this.sqlSession.selectOne("fripInfo", num);
	}

	@Override
	public int getListCount(int num) {

		return this.sqlSession.selectOne("totalcount", num);
	}

	@Override
	public int getWeekListCount(int num) {

		return this.sqlSession.selectOne("weekcount", num);
	}

	@Override
	public int getNewListCount(int num) {

		return this.sqlSession.selectOne("newcount", num);
	}

	@Override
	public List<ClassDTO> getBestClassList(int num) {

		return this.sqlSession.selectList("bestlist", num);
	}

	@Override
	public List<ClassDTO> getWeekClassList(int num) {

		return this.sqlSession.selectList("weeklist", num);
	}

	@Override
	public List<ClassDTO> getNewClassList(int num) {

		return this.sqlSession.selectList("newlist", num);
	}
	
	@Override
	public int countclass_myfrip(HashMap<String, Object> map) {
		return this.sqlSession.selectOne("countclass_myfrip", map);
	}

	@Override
	public List<ClassDTO> getList_myFrip(HashMap<String, Object> map) {
		return this.sqlSession.selectList("getList_myFrip", map);
	}

	@Override
	public int countclass_end(HashMap<String, Object> map) {
		return this.sqlSession.selectOne("countclass_end", map);
	}

	@Override
	public List<ClassDTO> getList_end(HashMap<String, Object> map) {
		return this.sqlSession.selectList("getList_end", map);
	}

	@Override
	public int changeCalState(int class_num) {
		return this.sqlSession.update("changeCalState", class_num);
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

	@Override
	public int getMonthFrip(int mem_num) {
		return this.sqlSession.selectOne("getMonthFrip", mem_num);
	}

	
	
	
}
