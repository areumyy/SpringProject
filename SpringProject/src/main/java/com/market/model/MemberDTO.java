package com.market.model;

import lombok.Data;

@Data
public class MemberDTO {

	private int mem_num;
	private int mem_name;
	private String mem_email;
	private String mem_pwd;
	private String mem_nick;
	private String mem_phone;
	private int mem_point;
	private String mem_delCheck;
}
