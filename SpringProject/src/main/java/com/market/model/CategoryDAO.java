package com.market.model;

import java.util.List;

public interface CategoryDAO {

	public List<CategoryDTO> getCate_oneList();
	public List<CategoryDTO> getCate_two(String cate_one);
	
	public CategoryDTO getCategoryCont(int category_num);
}
