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
	public int getCountComplete(int mem_num) {
		return this.sqlSession.selectOne("getClassQnaCountComplete", mem_num);
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

	//답변 안한 문의 검색
	@Override
	public int getNameSearchCount(HashMap<String, Object> map) {
		return this.sqlSession.selectOne("getNameSearchCount", map);
	}
	
	@Override
	public int getTitleSearchCount(HashMap<String, Object> map) {
		return this.sqlSession.selectOne("getTitleSearchCount", map);
	}

	@Override
	public List<Class_qnaDTO> getNamesearchList(HashMap<String, Object> map) {
		return this.sqlSession.selectList("getNamesearchList", map);
	}

	@Override
	public List<Class_qnaDTO> getTitlesearchList(HashMap<String, Object> map) {
		return this.sqlSession.selectList("getTitlesearchList", map);
	}
	
	//답변 한 문의 검색
	@Override
	public int CgetNameSearchCount(HashMap<String, Object> map) {
		return this.sqlSession.selectOne("CgetNameSearchCount", map);
	}

	@Override
	public int CgetTitleSearchCount(HashMap<String, Object> map) {
		return this.sqlSession.selectOne("CgetTitleSearchCount", map);
	}

	@Override
	public List<Class_qnaDTO> CgetNamesearchList(HashMap<String, Object> map) {
		return this.sqlSession.selectList("CgetNamesearchList", map);
	}

	@Override
	public List<Class_qnaDTO> CgetTitlesearchList(HashMap<String, Object> map) {
		return this.sqlSession.selectList("CgetTitlesearchList", map);
	}

	@Override
	public int getallCount(int mem_num) {
		return this.sqlSession.selectOne("getallCount", mem_num);
	}

	@Override
	public List<Class_qnaDTO> getclassQnaList(int num) {
		
		return this.sqlSession.selectList("classqnalist", num);
	}

	@Override
	public int insertQna(Class_qnaDTO dto) {
		return this.sqlSession.insert("qna_insert1", dto);
	}

	@Override
	public int deleteQna(int class_qna_num) {
		return this.sqlSession.delete("qna_delete", class_qna_num);
	}

	@Override
	public void setQnaNum(int class_qna_num) {
		this.sqlSession.update("setQnaNum", class_qna_num);
	}
}
