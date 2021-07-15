package com.market.model;

import lombok.Data;

@Data
public class ReviewDTO {

	private int review_num;
	private int review_writer;
	private int review_classNum;
	private int review_like;
	private int review_score; // 평점: 1,2,3,4,5
	private String review_cont;
	private String review_regdate;
	private String review_image;
}
