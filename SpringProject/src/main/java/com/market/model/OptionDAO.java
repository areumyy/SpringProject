package com.market.model;

import java.util.HashMap;
import java.util.List;

public interface OptionDAO {

	public int insertOption(OptionDTO dto);
	public List<OptionDTO> getOptionList(int num);
	public int getOptionCount(int num);
	public int deleteOption(int num);
	public int getmaxoptionNum(int num);
	public int getcountoption(int num);
	public int optionNumdown(HashMap<String, Integer> map);
	
}
