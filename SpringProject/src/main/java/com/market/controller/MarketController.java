package com.market.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MarketController {

	@RequestMapping("hostSideBar.do")
	public String hostSideBar() {
		return "hostInclude/hostSideBar";
	}
	
	@RequestMapping("hostFooter.do")
	public String hostFooter() {
		return "hostInclude/hostFooter";
	}
	
	@RequestMapping("hostMain.do")
	public String hostMain() {
		return "host/hostMain";
	}
	@RequestMapping("hostMakeFrip.do")
	public String hostMakeFrip() {
		return "host/hostMakeFrip";
	}
}
