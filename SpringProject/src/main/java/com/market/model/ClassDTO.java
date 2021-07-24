package com.market.model;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ClassDTO {

	private int class_num;
	private int class_memNum;
	private String class_category1;
	private String class_category2;
	private String class_hash;
	private String class_title;
	private MultipartFile class_image2;
	private String class_image;
	private String class_startDate;
	private String class_endDate;
	private int class_count;
	private String class_startArea;
	private String class_endArea;
	private String class_cont;
	private String class_plan;
	private String class_include;
	private String class_exclude;
	private String class_supply;
	private String class_notice;
	private int class_pass; // 디폴트 0: 등록신청, 1: 등록승인
	private String class_regdate;
	private String class_cal; // 디폴트 0: 미정산, 1: 정산신청, 2: 정산완료
}
