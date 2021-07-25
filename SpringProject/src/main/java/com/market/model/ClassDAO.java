package com.market.model;

import java.util.HashMap;
import java.util.List;

public interface ClassDAO {

	public int insertClass(ClassDTO dto);
	public int UpdateClass(ClassDTO dto);
	public int countClass();
	public List<ClassDTO> getList_MemNum(HashMap<String, Integer> map);
	public List<ClassDTO> getList_endClass(HashMap<String, Integer> map);
	public ClassDTO getList_classNum(int class_num);
	public int countClass(int mem_num);
	public List<ClassDTO> getList(HashMap<String, Object> map);
	
	public int getCount_endClass(int mem_num);
} 
