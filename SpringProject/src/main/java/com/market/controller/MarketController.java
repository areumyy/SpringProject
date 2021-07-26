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
import org.springframework.web.bind.annotation.RequestParam;

import com.market.model.ClassDAO;
import com.market.model.ClassDTO;
import com.market.model.MemberDAO;
import com.market.model.MemberDTO;

@Controller
public class MarketController {

	@Autowired
	private MemberDAO memberDao;
	
	@Autowired
	private ClassDAO classDao;

	@RequestMapping("main.do")
	public String main() {
		return "home";
	}

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
		if (emailCheck > 0) { // 입력한 아이디가 이미 있을때
			out.println("<script>");
			out.println("alert('중복된 아이디(이메일)입니다.')");
			out.println("history.back()");
			out.println("</script>");
		} else { // 입력한 아이디가 없을때
			if (dto.getMem_pwd().equals(mem_pwd_check)) { // 비밀번호 확인 성공

			} else { // 비밀번호 확인 실패
				out.println("<script>");
				out.println("alert('비밀번호를 다시 확인해주세요.')");
				out.println("history.back()");
				out.println("</script>");
			}
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

	@RequestMapping("login_ok.do")
	public void loginOk(@RequestParam("mem_email") String mem_email, @RequestParam("mem_pwd") String mem_pwd,
			HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();

		int result = this.memberDao.loginCheck(mem_email, mem_pwd);

		if (result == 1) { // 로그인 성공
			HttpSession session = request.getSession();

			MemberDTO dto = this.memberDao.getMember(mem_email);

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
		session.invalidate();

		return "home";
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

	/*
	 * @RequestMapping("category_list.do") public String cateList() { return
	 * "category_list"; }
	 */

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
	
	// 선택 카테고리 전체 리스트 
	@RequestMapping("category_all_list.do")
	public String category_all_list(@RequestParam("num") int category_num, Model model) {
		
		// 카테고리의 전체 프립 수
		int totalallcount = this.classDao.getAllListCount(category_num);
		// 카테고리의 금주의 프립 수
		int weekallcount = this.classDao.getWeekAllListCount(category_num);
		// 카테고리의 신규 프립 수
		int newallcount = this.classDao.getNewAllListCount(category_num);
		
		model.addAttribute("TotalAllCount", totalallcount);
		model.addAttribute("WeekAllCount", weekallcount);
		model.addAttribute("NewAllCount", newallcount);
		
		// 카테고리 이름
		ClassDTO categoryname = this.classDao.getCategoryName(category_num);
		// 하위카테고리 이름 리스트 가져오기
		List<ClassDTO> categorynameList = this.classDao.getCategoryNameList(category_num);
		
		model.addAttribute("CategoryName", categoryname);
		model.addAttribute("CategoryNameList", categorynameList);
		
		// 인기 프립 리스트 가져오기
		List<ClassDTO> bestclassallList = this.classDao.getBestClassAllList(category_num);
		// 금주의 프립 리스트 가져오기
		List<ClassDTO> weekclassallList = this.classDao.getWeekClassAllList(category_num);
		// 신규 프립 리스트 가져오기
		List<ClassDTO> newclassallList = this.classDao.getNewClassAllList(category_num);
		
		model.addAttribute("BestAllList", bestclassallList);
		model.addAttribute("WeekAllList", weekclassallList);
		model.addAttribute("NewAllList", newclassallList);
		
		return "category_all_list";
	}
	
	
	// 선택 카테고리 리스트 
	@RequestMapping("category_list.do")
	public String category_list(@RequestParam("num") int category_num, Model model) {
		
		// 카테고리의 전체 프립 수
		int totalcount = this.classDao.getListCount(category_num);
		// 카테고리의 금주의 프립 수
		int weekcount = this.classDao.getWeekListCount(category_num);
		// 카테고리의 신규 프립 수
		int newcount = this.classDao.getNewListCount(category_num);
		
		model.addAttribute("TotalCount", totalcount);
		model.addAttribute("WeekCount", weekcount);
		model.addAttribute("NewCount", newcount);
		
		// 카테고리 이름
		ClassDTO categoryname = this.classDao.getCategoryName(category_num);
		// 하위카테고리 이름 리스트 가져오기
		List<ClassDTO> categorynameList = this.classDao.getCategoryNameList(category_num);
		
		model.addAttribute("CategoryName", categoryname);
		model.addAttribute("CategoryNameList", categorynameList);
		
		// 인기 프립 리스트 가져오기
		List<ClassDTO> bestclassList = this.classDao.getBestClassList(category_num);
		// 금주의 프립 리스트 가져오기
		List<ClassDTO> weekclassList = this.classDao.getWeekClassList(category_num);
		// 신규 프립 리스트 가져오기
		List<ClassDTO> newclassList = this.classDao.getNewClassList(category_num);
		
		model.addAttribute("BestList", bestclassList);
		model.addAttribute("WeekList", weekclassList);
		model.addAttribute("NewList", newclassList);
		
		return "category_list";
	}
	
	//////////////////
	// 선택 카테고리 전체 리스트
	@RequestMapping("category_more_all_list.do")
	public String category_more_all_list(@RequestParam("num") int category_num, 
			@RequestParam("title1") String title1, @RequestParam("title2") String title2, Model model) {

		model.addAttribute("Title1", title1);
		model.addAttribute("Title2", title2);
		
		// 카테고리의 전체 프립 수
		int totalallcount = this.classDao.getAllListCount(category_num);
		
		model.addAttribute("TotalAllCount", totalallcount);
		
		// 카테고리 이름
		ClassDTO categoryname = this.classDao.getCategoryName(category_num);
		// 하위카테고리 이름 리스트 가져오기
		List<ClassDTO> categorynameList = this.classDao.getCategoryNameList(category_num);
		
		model.addAttribute("CategoryName", categoryname);
		model.addAttribute("CategoryNameList", categorynameList);
		
		// 프립 리스트 가져오기
		List<ClassDTO> classAllList = this.classDao.getClassAllList(category_num);
		
		model.addAttribute("AllList", classAllList);

		return "category_more_all_list";
	}
	
	
	
	// 선택 카테고리 인기 프립 전체 리스트
	@RequestMapping("category_more_all_bestlist.do")
	public String category_more_all_bestlist(@RequestParam("num") int category_num, 
			@RequestParam("title1") String title1, @RequestParam("title2") String title2, Model model) {
		
		model.addAttribute("Title1", title1);
		model.addAttribute("Title2", title2);
		
		model.addAttribute("category_num", category_num);

		// 카테고리의 전체 프립 수
		int totalallcount = this.classDao.getAllListCount(category_num);
		
		model.addAttribute("TotalAllCount", totalallcount);
		
		// 카테고리 이름
		ClassDTO categoryname = this.classDao.getCategoryName(category_num);
		// 하위카테고리 이름 리스트 가져오기
		List<ClassDTO> categorynameList = this.classDao.getCategoryNameList(category_num);

		model.addAttribute("CategoryName", categoryname);
		model.addAttribute("CategoryNameList", categorynameList);

		// 인기 프립 리스트 가져오기
		List<ClassDTO> bestclassallList = this.classDao.getBestClassAllList(category_num);
		
		model.addAttribute("BestAllList", bestclassallList);
		
		return "category_more_all_list";
	}
	
	
	// 선택 카테고리 금주의 프립 전체 리스트
	@RequestMapping("category_more_all_weeklist.do")
	public String category_more_all_weeklist(@RequestParam("num") int category_num,
			@RequestParam("title1") String title1, @RequestParam("title2") String title2, Model model) {

		model.addAttribute("Title1", title1);
		model.addAttribute("Title2", title2);

		model.addAttribute("category_num", category_num);
		
		// 카테고리의 금주의 프립 수
		int weekallcount = this.classDao.getWeekAllListCount(category_num);
		
		model.addAttribute("WeekAllCount", weekallcount);
		
		// 카테고리 이름
		ClassDTO categoryname = this.classDao.getCategoryName(category_num);
		// 하위카테고리 이름 리스트 가져오기
		List<ClassDTO> categorynameList = this.classDao.getCategoryNameList(category_num);

		model.addAttribute("CategoryName", categoryname);
		model.addAttribute("CategoryNameList", categorynameList);
		
		// 금주의 프립 리스트 가져오기
		List<ClassDTO> weekclassallList = this.classDao.getWeekClassAllList(category_num);
		
		model.addAttribute("WeekAllList", weekclassallList);
		
		return "category_more_all_list";
	}
	
	
	// 선택 카테고리 신규 프립 전체 리스트
	@RequestMapping("category_more_all_newlist.do")
	public String category_more_all_newlist(@RequestParam("num") int category_num,
			@RequestParam("title1") String title1, @RequestParam("title2") String title2, Model model) {
		
		model.addAttribute("Title1", title1);
		model.addAttribute("Title2", title2);

		model.addAttribute("category_num", category_num);
		
		// 카테고리의 신규 프립 수
		int newallcount = this.classDao.getNewAllListCount(category_num);
		
		model.addAttribute("NewAllCount", newallcount);

		// 카테고리 이름
		ClassDTO categoryname = this.classDao.getCategoryName(category_num);
		// 하위카테고리 이름 리스트 가져오기
		List<ClassDTO> categorynameList = this.classDao.getCategoryNameList(category_num);

		model.addAttribute("CategoryName", categoryname);
		model.addAttribute("CategoryNameList", categorynameList);
		
		// 신규 프립 리스트 가져오기
		List<ClassDTO> newclassallList = this.classDao.getNewClassAllList(category_num);
		
		model.addAttribute("NewAllList", newclassallList);

		return "category_more_all_list";
	}
	
	////////////////////////////
	// 선택 카테고리 리스트
	@RequestMapping("category_more_list.do")
	public String category_more_list(@RequestParam("num") int category_num, 
			@RequestParam("title1") String title1, @RequestParam("title2") String title2, Model model) {

		model.addAttribute("Title1", title1);
		model.addAttribute("Title2", title2);
		
		// 카테고리의 전체 프립 수
		int totalcount = this.classDao.getListCount(category_num);
		
		model.addAttribute("TotalCount", totalcount);
		
		// 카테고리 이름
		ClassDTO categoryname = this.classDao.getCategoryName(category_num);
		// 하위카테고리 이름 리스트 가져오기
		List<ClassDTO> categorynameList = this.classDao.getCategoryNameList(category_num);

		model.addAttribute("CategoryName", categoryname);
		model.addAttribute("CategoryNameList", categorynameList);
		
		// 프립 리스트 가져오기
		List<ClassDTO> classAllList = this.classDao.getClassList(category_num);
		
		model.addAttribute("AllList", classAllList);

		return "category_more_list";
	}
	
	
	// 선택 카테고리 인기프립 전체 리스트 
	@RequestMapping("category_more_bestlist.do")
	public String category_more_bestlist(@RequestParam("num") int category_num, 
			@RequestParam("title1") String title1, @RequestParam("title2") String title2, Model model) {
		
		model.addAttribute("Title1", title1);
		model.addAttribute("Title2", title2);
		
		// 카테고리의 전체 프립 수
		int totalcount = this.classDao.getListCount(category_num);
		
		model.addAttribute("TotalCount", totalcount);
		
		// 카테고리 이름
		ClassDTO categoryname = this.classDao.getCategoryName(category_num);
		// 하위카테고리 이름 리스트 가져오기
		List<ClassDTO> categorynameList = this.classDao.getCategoryNameList(category_num);
		
		model.addAttribute("CategoryName", categoryname);
		model.addAttribute("CategoryNameList", categorynameList);
		
		// 인기 프립 리스트 가져오기
		List<ClassDTO> bestclassList = this.classDao.getBestClassList(category_num);
		
		model.addAttribute("BestList", bestclassList);
		
		return "category_more_list";
	}
	
	
	// 선택 카테고리 금주의 프립 전체 리스트
	@RequestMapping("category_more_weeklist.do")
	public String category_more_weeklist(@RequestParam("num") int category_num, 
			@RequestParam("title1") String title1, @RequestParam("title2") String title2, Model model) {

		model.addAttribute("Title1", title1);
		model.addAttribute("Title2", title2);
		
		// 카테고리의 금주의 프립 수
		int weekcount = this.classDao.getWeekListCount(category_num);
		
		model.addAttribute("WeekCount", weekcount);

		// 카테고리 이름
		ClassDTO categoryname = this.classDao.getCategoryName(category_num);
		// 하위카테고리 이름 리스트 가져오기
		List<ClassDTO> categorynameList = this.classDao.getCategoryNameList(category_num);

		model.addAttribute("CategoryName", categoryname);
		model.addAttribute("CategoryNameList", categorynameList);
		
		// 금주의 프립 리스트 가져오기
		List<ClassDTO> weekclassList = this.classDao.getWeekClassList(category_num);
		
		model.addAttribute("WeekList", weekclassList);

		return "category_more_list";
	}
	

	// 선택 카테고리 신규 프립 전체 리스트
	@RequestMapping("category_more_newlist.do")
	public String category_more_newlist(@RequestParam("num") int category_num, 
			@RequestParam("title1") String title1, @RequestParam("title2") String title2, Model model) {
		
		model.addAttribute("Title1", title1);
		model.addAttribute("Title2", title2);
		
		// 카테고리의 신규 프립 수
		int newcount = this.classDao.getNewListCount(category_num);
		
		model.addAttribute("NewCount", newcount);

		// 카테고리 이름
		ClassDTO categoryname = this.classDao.getCategoryName(category_num);
		// 하위카테고리 이름 리스트 가져오기
		List<ClassDTO> categorynameList = this.classDao.getCategoryNameList(category_num);

		model.addAttribute("CategoryName", categoryname);
		model.addAttribute("CategoryNameList", categorynameList);
		
		// 신규 프립 리스트 가져오기
		List<ClassDTO> newclassList = this.classDao.getNewClassList(category_num);
		
		model.addAttribute("NewList", newclassList);

		return "category_more_list";
	}
	
}
