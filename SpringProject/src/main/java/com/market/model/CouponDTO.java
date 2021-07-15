package com.market.model;

import lombok.Data;

@Data
public class CouponDTO {

	private int coupon_num;
	private int coupon_memNum;
	private String coupon_code;
	private String coupon_title;
	private String coupon_cont;
	private int coupon_price;
}
