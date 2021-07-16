package com.market.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.market.model.MemberDAO;
import com.market.model.MemberDTO;

@Controller
public class MarketController {

	@Autowired
	private MemberDAO memberDao;

	@RequestMapping("join.do")
	public String join() {
		return "joinForm";
	}

	@RequestMapping("join_ok.do")
	public void joinOk(MemberDTO dto, HttpServletResponse response, @RequestParam("mem_pwd_check") String mem_pwd_check)
			throws IOException {
		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();

		int emailCheck = this.memberDao.checkEmail(dto.getMem_email());
		if (emailCheck > 1) {
			out.println("<script>");
			out.println("alert('중복된 아이디(이메일)입니다.')");
			out.println("history.back()");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('아이디 사용 가능')");
			out.println("history.back()");
			out.println("</script>");
		}
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

	@RequestMapping("admin_frip_pass.do")
	public String fripPass() {
		return "admin_frip_pass";
	}

	@RequestMapping("admin_cal_pass.do")
	public String calPass() {
		return "admin_cal_pass";
	}

	@RequestMapping("payment.do")
	public String pay() {
		return "payment";
	}

	@RequestMapping("payment_ok.do")
	public String payOk() {
		return "payment_ok";
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

	@RequestMapping("hostCalculateReq.do")
	public String hostCalReq() {
		return "host/hostCalculateReq";
	}

	@RequestMapping("hostNotice_list.do")
	public String hostNotice() {
		return "host/hostNotice_list";
	}

	@RequestMapping("hostQna_list.do")
	public String hostQna() {
		return "host/hostQna_list";
	}

	@RequestMapping("hostReview.do")
	public String hostReview() {
		return "host/hostReview";
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

	@RequestMapping("admin_notice.do")
	public String adminNotice() {
		return "admin_notice";
	}

	@RequestMapping("admin_member_list.do")
	public String adminMember() {
		return "admin_member_list";
	}

	@RequestMapping("hostSideBar.do")
	public String hostSideBar() {
		return "hostInclude/hostSideBar";
	}

	@RequestMapping("hostFooter.do")
	public String hostFooter() {
		return "hostInclude/hostFooter";
	}

	@RequestMapping("hostAsk_answer.do")
	public String hostAsk_answer() {
		return "host/hostAsk_answer";
	}

	@RequestMapping("hostUpdateFrip.do")
	public String hostUpdateFrip() {
		return "host/hostUpdateFrip";
	}
}
