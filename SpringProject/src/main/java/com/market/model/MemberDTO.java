package com.market.model;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MemberDTO {

	private int mem_num;
	private String mem_name;
	private String mem_email;
	private String mem_pwd;
	private String mem_nick;
	private String mem_phone;
	private int mem_point;
	private String mem_regdate;
	private int mem_status;
	private String mem_profileimg;
	private MultipartFile mem_profileimg2;
}
