package com.market.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ClassDAOImpl implements ClassDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
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
	public int insertClass(ClassDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ClassDTO classCont(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateClass(ClassDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteClass(int num) {
		// TODO Auto-generated method stub
		return 0;
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

	
}
