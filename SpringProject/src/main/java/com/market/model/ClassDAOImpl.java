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
	public ClassDTO classCont(int num) {
		// TODO Auto-generated method stub
		return null;
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
}
