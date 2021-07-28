package com.market.model;

import java.util.HashMap;
import java.util.List;

public interface ReviewDAO {
	
	public ReviewDTO reviewInfo(int num);			// 프립 리뷰 평점 평균 / 리뷰 갯수
	public int reviewPercent(int num);				// 최고평점 비율(%)
	public List<ReviewDTO> getReviewList(int num);		// 프립후기 리스트를 가져오는 메서드

	public int getCount_memnum(int mem_num);
	public List<ReviewDTO> getList_memnum(HashMap<String, Object> map);
	public int insertReply(HashMap<String, Object> map);
}
