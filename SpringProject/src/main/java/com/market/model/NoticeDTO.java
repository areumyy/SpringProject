package com.market.model;

import lombok.Data;

@Data
public class NoticeDTO {

	private int notice_num;
	private String notice_title;
	private String notice_cont;
	private String notice_regdate;
	private int notice_flag; // 0: 회원, 1: 호스트
}
