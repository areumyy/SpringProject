package com.market.model;

import java.util.List;

public interface QnaDAO {

	public int getListCount(int flag);
	
	public List<QnaDTO> getQnaList(PageDTO dto);
}
