package com.market.model;

import lombok.Data;

@Data
public class ReviewDTO {

	private int review_num;
	private int review_writer;
	private int review_classNum;
	private int review_like;
	private float review_score; 			// 평점: 1,2,3,4,5
	private String review_cont;
	private String review_regdate;
	private String review_image;
	private String review_reply;		
	private String mem_name;			// 추가 (회원명)
	private String mem_profileImg;		// 추가 (회원 프로필)
	private String class_startDate;		// 추가 (시작날짜)
	private String class_endDate;		// 추가 (끝날짜)
	private String class_title;			// 추가 (클래스명)
	private String option_name;			// 추가 (옵션명)
}
