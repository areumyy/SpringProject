package com.market.model;

import java.util.HashMap;
import java.util.List;

public interface ClassDAO {

	public int insertClass(ClassDTO dto);
	public int countClass();
	public List<ClassDTO> getList_MemNum(HashMap<String, Integer> map);
	public List<ClassDTO> getList_endClass(HashMap<String, Integer> map);
	public List<ClassDTO> getList_classNum(int class_num);
}
