package com.market.model;

import java.util.HashMap;
import java.util.List;

public interface Class_qnaDAO {

	public int getCount(int mem_num);
	public int getCountComplete(int mem_num);
	public List<Class_qnaDTO> getQnaList(HashMap<String, Object> map);
	public List<Class_qnaDTO> getQnaCompleteList(HashMap<String, Object> map);
	public Class_qnaDTO getContent(int qna_num);
	public int insertAnswer(HashMap<String, Object> map);
	// 답변안한 문의 검색
	public int getNameSearchCount(HashMap<String, Object> map);
	public int getTitleSearchCount(HashMap<String, Object> map);
	public List<Class_qnaDTO> getNamesearchList(HashMap<String, Object> map);
	public List<Class_qnaDTO> getTitlesearchList(HashMap<String, Object> map);
	
	//답변 한 문의 검색
	public int CgetNameSearchCount(HashMap<String, Object> map);
	public int CgetTitleSearchCount(HashMap<String, Object> map);
	public List<Class_qnaDTO> CgetNamesearchList(HashMap<String, Object> map);
	public List<Class_qnaDTO> CgetTitlesearchList(HashMap<String, Object> map);
	
	public int getallCount(int mem_num);
}
