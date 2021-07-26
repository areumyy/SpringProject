package com.market.model;

import java.util.HashMap;
import java.util.List;

public interface ClassDAO {

	public int insertClass(ClassDTO dto);
	public int countClass();
	public List<ClassDTO> getList_MemNum(HashMap<String, Integer> map);
	public List<ClassDTO> getList_endClass(HashMap<String, Integer> map);
	public List<ClassDTO> getList_classNum(int class_num);
	
	public List<ClassDTO> fripPass_wait();		// 프립 승인대기 리스트
	public int fripPass_wait_count();			// 승인대기 수
	public List<ClassDTO> fripPass_finish();	// 프립 승인완료 리스트
	public int fripPass_finish_count();			// 승인완료 수
	public int fripPass_result(int class_num);	// 프립승인 시 '대기' => '완료'로 상태 변경 + 승일일자 업데이트
	
}
