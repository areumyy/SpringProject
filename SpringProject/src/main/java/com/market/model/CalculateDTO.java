package com.market.model;

import lombok.Data;

@Data
public class CalculateDTO {

	private int cal_num; 				// 정산 번호
	private int cal_classNum; 			// 정산 대상 클래스 번호
	private String cal_startDate; 		// 정산 프립 시작날
	private String cal_endDate; 		// 정산 프립 끝나는 날
	private String cal_name; 			// 정산 프립 이름
	private int cal_buyCount; 			// 정산 프립 구매수
	private int cal_enterCount; 		// 정산 프립 참석 수
	private int cal_enterNoCount; 		// 정산 프립 불참석 수
	private int cal_sal; 				// 정산 프립 매출액
	private int cal_total; 				// 매출액 * 0.9
	private int cal_status; 			// 0: 정산신청 전, 1: 정산신청 중, 2: 정산완료
	private String cal_regdate; 		// 정산 프립 신청일자
	private String cal_okdate; 			// 정산 프립 완료일자
}
