package com.market.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MarketController {

	@RequestMapping("join.do")
	public String join() {
		return "../views/joinForm";
	}

	@RequestMapping("pwd_search.do")
	public String pwdSearch() {
		return "../views/pwdSearch";
	}

	@RequestMapping("login.do")
	public String login() {
		return "../views/loginForm";
	}
}
