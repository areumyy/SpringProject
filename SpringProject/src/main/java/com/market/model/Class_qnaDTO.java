package com.market.model;

import lombok.Data;

@Data
public class Class_qnaDTO {

	private int class_qna_num;
	private int class_qna_classNum;
	private int class_qna_writer;
	private String class_qna_cont;
	private String class_qna_regdate;
	private String class_ans_cont;
	private String class_ans_regdate;
	private int class_qna_pri; // 0: 비공개, 1: 공개
	private String mem_name;
	private String class_title;
}
