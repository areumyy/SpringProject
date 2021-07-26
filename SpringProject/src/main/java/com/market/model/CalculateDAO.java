package com.market.model;

import java.util.List;

public interface CalculateDAO {

	public int getCountAll(int mem_num);
	
	public List<CalculateDTO> getListAll(List<ClassDTO> list);
	
	public int requestCal(int target);
}
