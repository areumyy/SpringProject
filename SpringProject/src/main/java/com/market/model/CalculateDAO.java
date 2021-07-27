package com.market.model;

import java.util.List;

public interface CalculateDAO {

	public List<CalculateDTO> calPass_wait();		// 정산 승인대기 목록
	public List<ClassDTO> calPass_wait_host();		// 승인대기 목록 호스트명
	public int calPass_wait_count();				// 승인대기 건수
	public List<CalculateDTO> calPass_finish();		// 정산 승인완료 목록
	public List<ClassDTO> calPass_finish_host();	// 승인완료 목록 호스트명
	public int calPass_finish_count();				// 승인완료 건수
	public int calPass_result(int class_num);		// 클래스 테이블 class_cal = '1' -> '2' 로 변경
	public int calPass_result2(int class_num);		// 정산 테이블 cal_status = '1' -> '2' 로 변경 + 승일일자 업데이트
	
}
