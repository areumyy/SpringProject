package com.market.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
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

	@RequestMapping("like_frip.do")
	public String likeFrip() {
		return "like_frip";
	}

	@RequestMapping("like_host.do")
	public String likeHost() {
		return "like_host";
	}
	
	@RequestMapping("host_info.do")
	public String hostInfo() {
		return "host_info";
	}

	@RequestMapping("category_list.do")
	public String cateList() {
		return "category_list";

	}

	@RequestMapping("option_select.do")
	public String optionSel() {
		return "option_select";
	}

	@RequestMapping("payment.do")
	public String pay() {
		return "payment";
	}
	
	@RequestMapping("payment_ok.do")
	public String payOk() {
		return "payment_ok";
	}
	
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
	@RequestMapping("hostMyFrip.do")
	public String hostMyFrip() {
		return "host/hostMyFrip";
	}
	@RequestMapping("hostAttendance.do")
	public String hostAttendance() {
		return "host/hostAttendance";
	}
	@RequestMapping("hostAttendance_member.do")
	public String hostAttendance_member() {
		return "host/hostAttendance_member";
	}
	@RequestMapping("hostAsk.do")
	public String hostAsk() {
		return "host/hostAsk";
	}
	@RequestMapping("hostAsk_answer.do")
	public String hostAsk_answer() {
		return "host/hostAsk_answer";
	}
	
	@RequestMapping("hostReviewManagement.do")
	public String hostReviewManagement() {
		return "host/hostReviewManagement";
	}
	
	@RequestMapping("hostUpdateFrip.do")
	public String hostUpdateFrip() {
		return "host/hostUpdateFrip";
	}
}

