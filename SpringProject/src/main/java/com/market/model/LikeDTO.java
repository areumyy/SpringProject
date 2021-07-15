package com.market.model;

import lombok.Data;

@Data
public class LikeDTO {

	private int like_writer;
	private int like_target;
	private int like_flag; // 1: 클래스, 2: 호스트, 3: 댓글 
}
