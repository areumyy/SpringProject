package com.market.model;

import lombok.Data;

@Data
public class QnaDTO {

	private int qna_number;
	private String qna_title;
	private String qna_cont;
	private int qna_flag; // 0: 회원, 1: 호스트
}
