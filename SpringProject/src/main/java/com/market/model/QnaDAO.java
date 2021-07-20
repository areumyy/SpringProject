package com.market.model;

import java.util.List;

public interface QnaDAO {

	public int getListCount(int flag);
	
	public int getSearchListCount(String keyword, int flag);
	
	public List<QnaDTO> getQnaList(PageDTO dto);
	
	public List<QnaDTO> getQnaSearchList(PageDTO dto);
	
}
