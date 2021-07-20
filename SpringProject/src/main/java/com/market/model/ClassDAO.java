package com.market.model;

import java.util.List;

public interface ClassDAO {

	public int insertClass(ClassDTO dto);
	public int countClass();
	public List<ClassDTO> getList_MemNum(int mem_num);
}
