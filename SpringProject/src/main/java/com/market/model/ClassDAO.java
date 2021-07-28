package com.market.model;

import java.util.HashMap;
import java.util.List;

public interface ClassDAO {

	public int insertClass(ClassDTO dto);
	public int UpdateClass(ClassDTO dto);
	public int countClass();
	public List<ClassDTO> getList_MemNum(HashMap<String, Integer> map);
	public List<ClassDTO> getList_endClass(HashMap<String, Integer> map);
	public List<ClassDTO> getList_endOkAll(HashMap<String, Integer> map);
	public List<ClassDTO> getList_endOk(HashMap<String, Integer> map);
	
	public List<ClassDTO> fripPass_wait();		// 프립 승인대기 리스트
	public int fripPass_wait_count();			// 승인대기 수
	public List<ClassDTO> fripPass_finish();	// 프립 승인완료 리스트
	public int fripPass_finish_count();			// 승인완료 수
	public int fripPass_result(int class_num);	// 프립승인 시 '대기' => '완료'로 상태 변경 + 승일일자 업데이트

	public ClassDTO getList_classNum(int class_num);
	public int countClass(int mem_num);
	public List<ClassDTO> getList(HashMap<String, Object> map);
	public int countclass_myfrip(HashMap<String, Object> map);
	public int countclass_end(HashMap<String, Object> map);
	public List<ClassDTO> getList_myFrip(HashMap<String, Object> map);
	public List<ClassDTO> getList_end(HashMap<String, Object> map);
	public int changeCalState(int class_num);
	
	public int requestCal(int target);
	
	// 카테고리 전체 프립
	public int getAllListCount(int num);					// 카테고리의 프립 수를 확인하는 메서드.
	public int getWeekAllListCount(int num);				// 카테고리의 금주의 프립 수를 확인하는 메서드.
	public int getNewAllListCount(int num);					// 카테고리의 신규 프립 수를 확인하는 메서드.
	public List<ClassDTO> getClassAllList(int num);			// 프립 리스트 호출 메서드.
	public List<ClassDTO> getBestClassAllList(int num);		// 인기프립 리스트 호출 메서드.
	public List<ClassDTO> getWeekClassAllList(int num);		// 금주의프립 리스트 호출 메서드.
	public List<ClassDTO> getNewClassAllList(int num);		// 신규프립 리스트 호출 메서드.
	
	// 카테고리의 하위 카테고리 프립
	public int getListCount(int num);						// 카테고리의 프립 수를 확인하는 메서드.
	public int getWeekListCount(int num);					// 카테고리의 금주의 프립 수를 확인하는 메서드.
	public int getNewListCount(int num);					// 카테고리의 신규 프립 수를 확인하는 메서드.
	public List<ClassDTO> getClassList(int num);			// 프립 리스트 호출 메서드.
	public List<ClassDTO> getBestClassList(int num);		// 인기프립 리스트 호출 메서드.
	public List<ClassDTO> getWeekClassList(int num);		// 금주의프립 리스트 호출 메서드.
	public List<ClassDTO> getNewClassList(int num);			// 신규프립 리스트 호출 메서드.
	
	public ClassDTO getCategoryName(int num);				// 카테고리의 이름을 가져오는 메서드.
	public List<ClassDTO> getCategoryNameList(int num);		// 하위카테고리의 이름 리스트를 가져오는 메서드.
	
	public ClassDTO getclassCont(int num);						// 프립 상세 내용 호출 추상메서드.
	
	public int getMonthFrip(int mem_num); 					// 이번달 진행프립

}
