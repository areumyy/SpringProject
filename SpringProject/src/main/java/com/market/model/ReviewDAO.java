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
	
	public List<ReviewDTO> getReviewList_memnum(int mem_num);
	
	public int insert_review(ReviewDTO dto);
	
	public List<ReviewDTO> class_reviewList(int class_num);				// 호스트가 운영하는 클래스 모든 리뷰 가져오는 메서드2 (클래스명/시작날짜/끝날짜)
	public List<ReviewDTO> class_reviewList2(int class_num);			// 호스트가 운영하는 클래스 모든 리뷰 가져오는 메서드3 (옵션명)
	public List<Integer> reviewLike_list(HashMap<String, Integer> map);	// 좋아요 누른 리뷰 리스트
	public List<LikeDTO> getTarget(int mem_num);

	public ReviewDTO get_review(int review_num);
	
	public int update_review(ReviewDTO dto);
}
