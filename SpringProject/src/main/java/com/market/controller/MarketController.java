package com.market.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.market.model.MemberDAO;
import com.market.model.MemberDTO;
import com.market.model.NoticeDAO;
import com.market.model.NoticeDTO;
import com.market.model.PageDTO;
import com.market.model.QnaDAO;
import com.market.model.QnaDTO;

import net.sf.json.JSONObject;

@Controller
public class MarketController {

	@Autowired
	private MemberDAO memberDao;
	@Autowired
	private QnaDAO qnaDao;
	@Autowired
	private NoticeDAO NoticeDao;

	@RequestMapping("main.do")
	public String main() {
		return "home";
	}

	@RequestMapping("join.do")
	public String join() {
		return "joinForm";
	}

	@RequestMapping(value = "/emailCheck", method = RequestMethod.POST)
	@ResponseBody
	public void emailCheck(HttpServletResponse response, @RequestParam("mem_email") String mem_email)
			throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		String res = null;
		int state = 0;

		int result = this.memberDao.checkEmail(mem_email);
		if (result > 0) {
			res = "사용 불가능합니다.";
			state = 2;
		} else {
			res = "사용 가능합니다.";
			state = 1;
		}

		JSONObject obj = new JSONObject();
		obj.put("res", res);
		obj.put("state", state);

		response.getWriter().print(obj);
	}

	@RequestMapping(value = "/nickCheck", method = RequestMethod.POST)
	@ResponseBody
	public void nickCheck(HttpServletResponse response, @RequestParam("mem_nick") String mem_nick) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		String res = null;
		int state = 0;

		int result = this.memberDao.checkNick(mem_nick);
		if (result > 0) {
			res = "사용 불가능합니다.";
			state = 2;
		} else {
			res = "사용 가능합니다.";
			state = 1;
		}

		JSONObject obj = new JSONObject();
		obj.put("res", res);
		obj.put("state", state);

		response.getWriter().print(obj);
	}

	@RequestMapping("join_ok.do")
	public void joinOk(MemberDTO dto, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();

		int insertCheck = this.memberDao.insertMember(dto);
		if (insertCheck > 0) {
			out.println("<script>");
			out.println("alert('회원가입이 완료되었습니다.')");
			out.println("location.href='login.do'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('회원가입 실패.')");
			out.println("history.back()");
			out.println("</script>");
		}
	}

	@RequestMapping("pwd_search.do")
	public String pwdSearch() {
		return "pwdSearch";
	}

	@RequestMapping(value = "/pwd_search_ok.do", method = RequestMethod.POST)
	@ResponseBody
	public void pwdSearch(HttpServletResponse response, @RequestParam("mem_email") String mem_email,
			@RequestParam("mem_name") String mem_name) throws IOException {
		String pwd = "일치하는 계정이 없습니다.";
		int state = 0;
		int checkEmail = this.memberDao.checkEmail(mem_email);

		if (checkEmail > 0) { // 아이디가 존재할때
			MemberDTO dto = this.memberDao.getMember(mem_email);
			if (dto.getMem_name().equals(mem_name)) { // 이름이 일치할때
				pwd = dto.getMem_pwd();
				state = 1;
			}
		}
		JSONObject obj = new JSONObject();
		obj.put("find_pwd", pwd);
		obj.put("state", state);

		response.getWriter().print(obj);

	}

	@RequestMapping("login.do")
	public String login() {
		return "loginForm";
	}

	@RequestMapping("login_ok.do")
	public void loginOk(@RequestParam("mem_email") String mem_email, @RequestParam("mem_pwd") String mem_pwd,
			HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();

		int result = this.memberDao.loginCheck(mem_email, mem_pwd);

		if (result == 1) { // 로그인 성공
			HttpSession session = request.getSession();

			MemberDTO dto = this.memberDao.getMember(mem_email);
			System.out.println("로그인한 계정 >>> " + dto.getMem_num());
			session.setAttribute("loginDto", dto);
			if (dto.getMem_num() == 9999) {
				session.setAttribute("loginType", "admin");
			} else {
				session.setAttribute("loginType", "member");
			}

			out.println("<script>");
			out.println("location.href='main.do'");
			out.println("</script>");
		} else if (result == 2) { // 비밀번호 틀림
			out.println("<script>");
			out.println("alert('비밀번호가 틀립니다. 다시 확인해 주세요.')");
			out.println("history.back()");
			out.println("</script>");
		} else if (result == -1) { // 존재하지 않는 아이디
			out.println("<script>");
			out.println("alert('존재하지 않는 아이디입니다.')");
			out.println("history.back()");
			out.println("</script>");
		}
	}

	@RequestMapping("logout.do")
	public String logOut(HttpServletRequest request) {
		HttpSession session = request.getSession();
		System.out.println("로그아웃한 계정 >>>" + session.getAttribute("loginDto"));
		session.invalidate();

		return "home";
	}

	@RequestMapping("qna_list.do")
	public String qnaList(HttpServletRequest request, Model model) {
		int totalRecord = 0;
		int rowsize = 5;
		int page = 0; // 현재 페이지 변수

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		} else {
			page = 1; // 처음으로 "게시물 전체 목록" 태그를 클릭한 경우
		}

		// DB 상의 전체 게시물의 수를 확인하는 작업.
		totalRecord = this.qnaDao.getListCount(0);

		PageDTO dto = new PageDTO(page, rowsize, totalRecord, 3);

		// 페이지에 해당하는 게시물을 가져오는 메서드 호출
		List<QnaDTO> pageList = this.qnaDao.getQnaList(dto);

		model.addAttribute("list", pageList);
		model.addAttribute("Paging", dto);

		return "qna_list";
	}

	@RequestMapping("qna_search.do")
	public String qnaSearchList(@RequestParam("keyword") String keyword, HttpServletRequest request, Model model) {
		int totalRecord = 0;
		int rowsize = 5;
		int page = 0; // 현재 페이지 변수

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		} else {
			page = 1; // 처음으로 "게시물 전체 목록" 태그를 클릭한 경우
		}

		// DB 상의 전체 게시물의 수를 확인하는 작업.
		totalRecord = this.qnaDao.getSearchListCount(keyword, 0);

		PageDTO dto = new PageDTO(page, rowsize, totalRecord, 3, "0", keyword);

		// 페이지에 해당하는 게시물을 가져오는 메서드 호출
		List<QnaDTO> pageList = this.qnaDao.getQnaSearchList(dto);

		model.addAttribute("list", pageList);
		model.addAttribute("Paging", dto);

		return "qna_list";
	}

	@RequestMapping("notice_list.do")
	public String noticeList(HttpServletRequest request, Model model) {
		int totalRecord = 0;
		int rowsize = 8;
		int page = 0; // 현재 페이지 변수

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		} else {
			page = 1; // 처음으로 "게시물 전체 목록" 태그를 클릭한 경우
		}

		// DB 상의 전체 게시물의 수를 확인하는 작업.
		totalRecord = this.NoticeDao.getListCount(0);

		PageDTO dto = new PageDTO(page, rowsize, totalRecord, 3);

		// 페이지에 해당하는 게시물을 가져오는 메서드 호출
		List<NoticeDTO> pageList = this.NoticeDao.getNoticeList(dto);

		model.addAttribute("list", pageList);
		model.addAttribute("Paging", dto);

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

	@RequestMapping("frip_content.do")
	public String fripContent() {
		return "frip_content";
	}
}
