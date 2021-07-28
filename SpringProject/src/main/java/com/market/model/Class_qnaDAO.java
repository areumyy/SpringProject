package com.market.model;

import java.util.HashMap;
import java.util.List;

public interface Class_qnaDAO {

	public int getCount(int mem_num);
	public List<Class_qnaDTO> getQnaList(HashMap<String, Object> map);
	public List<Class_qnaDTO> getQnaCompleteList(HashMap<String, Object> map);
	public Class_qnaDTO getContent(int qna_num);
	public int insertAnswer(HashMap<String, Object> map);
	public List<Class_qnaDTO> getclassQnaList(int num);
}
