package com.market.model;

import java.util.List;

public interface CalculateDAO {

	public int getCountAll(int mem_num);
	public int getCountBefore(int mem_num);
	public int getCountIng(int mem_num);
	public int getCountAfter(int mem_num);
	
	
	public List<CalculateDTO> getListAll(List<ClassDTO> list);
	
	public List<CalculateDTO> getListBefore(List<ClassDTO> list);
	
	public List<CalculateDTO> getListIng(List<ClassDTO> list);
	
	public List<CalculateDTO> getListAfter(List<ClassDTO> list);
	
	public int requestCal(int target);
	
}
