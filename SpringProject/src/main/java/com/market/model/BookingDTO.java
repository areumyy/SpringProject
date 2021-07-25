package com.market.model;

import lombok.Data;

@Data
public class BookingDTO {

	private int booking_num;
	private int booking_writer;
	private int booking_classNum;
	private int booking_option;
	private String booking_enterCheck; // 출석여부 디폴트:'no'
	private String booking_regdate; // 예약신청을 한 날짜
	private String mem_name;
	private String mem_phone;
	private String option_name;
}
