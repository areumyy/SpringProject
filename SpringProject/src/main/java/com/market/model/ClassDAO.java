package com.market.model;

import java.util.List;

public interface ClassDAO {
	
	// 카테고리 전체 프립
	public int getAllListCount(int num);					// 카테고리의 프립 수를 확인하는 메서드.
	public int getWeekAllListCount(int num);				// 카테고리의 금주의 프립 수를 확인하는 메서드.
	public int getNewAllListCount(int num);					// 카테고리의 신규 프립 수를 확인하는 메서드.
	public List<ClassDTO> getBestClassAllList(int num);		// 인기프립 리스트 호출 메서드.
	public List<ClassDTO> getWeekClassAllList(int num);		// 금주의프립 리스트 호출 메서드.
	public List<ClassDTO> getNewClassAllList(int num);		// 신규프립 리스트 호출 메서드.
	
	// 카테고리의 하위 카테고리 프립
	public int getListCount(int num);						// 카테고리의 프립 수를 확인하는 메서드.
	public int getWeekListCount(int num);					// 카테고리의 금주의 프립 수를 확인하는 메서드.
	public int getNewListCount(int num);					// 카테고리의 신규 프립 수를 확인하는 메서드.
	public List<ClassDTO> getBestClassList(int num);		// 인기프립 리스트 호출 메서드.
	public List<ClassDTO> getWeekClassList(int num);		// 금주의프립 리스트 호출 메서드.
	public List<ClassDTO> getNewClassList(int num);			// 신규프립 리스트 호출 메서드.
	
	public ClassDTO getCategoryName(int num);				// 카테고리의 이름을 가져오는 메서드.
	public List<ClassDTO> getCategoryNameList(int num);		// 하위카테고리의 이름 리스트를 가져오는 메서드.
	public int insertClass(ClassDTO dto);					// 프립 추가 호출 메서드.
	public ClassDTO classCont(int num);						// 프립 상세 내용 호출 추상메서드.
	public int updateClass(ClassDTO dto);					// 프립 수정 호출 추상메서드.
	public int deleteClass(int num);						// 프립 삭제 호출 추상메서드.
	
}
