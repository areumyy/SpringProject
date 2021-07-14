package com.market.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MarketController {

	@RequestMapping("join.do")
	public String join() {
		return "joinForm";
	}

	@RequestMapping("pwd_search.do")
	public String pwdSearch() {
		return "pwdSearch";
	}

	@RequestMapping("login.do")
	public String login() {
		return "loginForm";
	}

	@RequestMapping("qna_list.do")
	public String qnaList() {
		return "qna_list";
	}

	@RequestMapping("notice_list.do")
	public String noticeList() {
		return "notice_list";
	}
	
	@RequestMapping("category_list.do")
	public String cateList() {
		return "category_list";
	}
	
	@RequestMapping("mypage.do")
	public String myPage() {
		return "mypage";
	}
	
	@RequestMapping("mypage_edit.do")
	public String myPageEdit() {
		return "mypage_edit";
	}
	
	@RequestMapping("mypage_coupon.do")
	public String myPageCoupon() {
		return "mypage_coupon";
	}
	
	@RequestMapping("mypage_purchases.do")
	public String myPagePurchases() {
		return "mypage_purchases";
	}
	
	@RequestMapping("mypage_energy.do")
	public String myPageEnergy() {
		return "mypage_energy";
	}
	
	
}
