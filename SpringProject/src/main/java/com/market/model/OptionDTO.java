package com.market.model;

import lombok.Data;

@Data
public class OptionDTO {

	private int option_num;
	private int option_classNum;
	private String option_name;
	private int option_price;
	private int option_editPrice;
	private String option_startDate;
	private String option_endDate;
}
