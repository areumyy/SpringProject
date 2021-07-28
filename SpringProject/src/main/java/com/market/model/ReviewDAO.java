package com.market.model;

import java.util.HashMap;
import java.util.List;

public interface ReviewDAO {

	public int getCount_memnum(int mem_num);

	public List<ReviewDTO> getList_memnum(HashMap<String, Object> map);

	public int insertReply(HashMap<String, Object> map);
	
	public int insert_review(ReviewDTO dto);

	public ReviewDTO get_review(int review_num);
}
