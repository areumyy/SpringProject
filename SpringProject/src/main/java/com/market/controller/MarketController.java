package com.market.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.servlet.ModelAndView;

import com.market.model.CategoryDAO;
import com.market.model.CategoryDTO;
import com.market.model.ClassDAO;
import com.market.model.ClassDTO;
import com.market.model.HostDAO;
import com.market.model.HostDTO;
import com.market.model.LikeDAO;
import com.market.model.LikeDTO;
import com.market.model.MemberDAO;
import com.market.model.MemberDTO;
import com.market.model.OptionDAO;
import com.market.model.OptionDTO;
import com.market.model.ReviewDTO;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class MarketController {

	@Autowired
	private MemberDAO memberDao;
	
	@Autowired
	private LikeDAO likeDao;

	@RequestMapping("main.do")
	public String main() {
		return "home";
	}

	@RequestMapping("join.do")
	public String join() {
		return "joinForm";
	}

	@RequestMapping("join_ok.do")
	public void joinOk(MemberDTO dto, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();

		int emailCheck = this.memberDao.checkEmail(dto.getMem_email());
		if (emailCheck > 0) { // 입력한 아이디가 이미 있을때
			out.println("<script>");
			out.println("alert('중복된 아이디(이메일)입니다.')");
			out.println("history.back()");
			out.println("</script>");
		} else { // 입력한 아이디가 없을때
			int insertCheck = this.memberDao.insertMember(dto);
			if (insertCheck > 0) {
				out.println("<script>");
				out.println("alert('회원가입이 완료되었습니다.')");
				out.println("location.href='login.do'");
				out.println("</script>");
			}
		}
	}

	@RequestMapping("pwd_search.do")
	public String pwdSearch() {
		return "pwdSearch";
	}

	@RequestMapping(value = "/pwd_search_ok.do", method = RequestMethod.POST)
	@ResponseBody
	public void cate_two(HttpServletResponse response, @RequestParam("mem_email") String mem_email,
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
	public String likeFrip(HttpServletRequest request, Model model) {
		
		// 세션값 가져오기
		HttpSession session = request.getSession();
		MemberDTO dto = (MemberDTO)session.getAttribute("loginDto");
		
		System.out.println("로그인 세션 mem_num 값 확인 >>> " + dto.getMem_num());
		
		// 찜 클래스 목록 가져오는 메서드
		List<ClassDTO> likeClass = this.likeDao.getLikeClassList(dto.getMem_num());
		
		// 찜 클래스 별 옵션 상세정보  가져오는 메서드
		List<OptionDTO> optionCont = this.likeDao.getOption(dto.getMem_num());
		
		// 찜 클래스 별 별점
		List<Integer> classScore = this.likeDao.class_score(dto.getMem_num());
		
		model.addAttribute("likeClassList", likeClass);
		model.addAttribute("optionCont", optionCont);
		model.addAttribute("classScore", classScore);
		
		return "like_frip";
	}

	@RequestMapping("like_host.do")
	public String likeHost(HttpServletRequest request, Model model) {
		
		// 세션값 가져오기
		HttpSession session = request.getSession();
		MemberDTO dto = (MemberDTO)session.getAttribute("loginDto");
		
		// 찜 호스트 목록 가져오는 메서드
		List<HostDTO> likeHost = this.likeDao.getLikeHostList(dto.getMem_num());
		
		// 찜 호스트 별 상세정보 가져오는 메서드
		List<MemberDTO> hostInfo = this.likeDao.getHostInfo(dto.getMem_num());
		
		// 찜 호스트가 운영하는 클래스 개수 가져오는 메서드
		List<Integer> classCount = this.likeDao.host_classCount(dto.getMem_num());
		
		// 찜 호스트 후기 개수 가져오는 메서드
		List<Integer> reviewCount = this.likeDao.host_reivewCount(dto.getMem_num());
		
		// 찜 호스트 찜 개수 가져오는 메서드
		List<Integer> likeCount = this.likeDao.host_reivewCount(dto.getMem_num());
		
		model.addAttribute("likeHostList", likeHost);
		model.addAttribute("hostInfo", hostInfo);
		model.addAttribute("classCount", classCount);
		model.addAttribute("reviewCount", reviewCount);
		model.addAttribute("likeCount", likeCount);
		
		return "like_host";
	}

	@RequestMapping("host_info.do")
	public String hostInfo(@RequestParam("hostMemNum") int host_memNum, HttpServletRequest request, Model model) {
		
		// 세션값 가져오기
		HttpSession session = request.getSession();
		MemberDTO dto = (MemberDTO)session.getAttribute("loginDto");
		
		// 호스트 상세정보 가져오는 메서드
		MemberDTO hostInfo = this.likeDao.hostInfo(host_memNum);
		
		// 호스트 소개 가져오는 메서드
		HostDTO hostCont = this.likeDao.hostCont(host_memNum);
		
		// 호스트가 운영하는 클래스 개수 가져오는 메서드
		int classCount = this.likeDao.class_count(host_memNum);
		
		// 호스트 후기 개수 가져오는 메서드
		int reviewCount = this.likeDao.review_count(host_memNum);
		
		// 호스트 찜 개수 가져오는 메서드
		int likeCount = this.likeDao.like_count(host_memNum);
		
		// 호스트가 운영하는 클래스 목록 가져오는 메서드
		List<ClassDTO> hostClass = this.likeDao.host_classList(host_memNum);
		
		// 호스트가 운영하는 클래스 옵션 상세정보 가져오는 메서드
		List<OptionDTO> hostClassOption = this.likeDao.host_classOption(host_memNum);

		// 호스트가 운영하는 클래스 모든 리뷰 가져오는 메서드1 (회원이름/회원프로필/리뷰내용/리뷰작성일)
		List<ReviewDTO> classReview1 = this.likeDao.class_review1(host_memNum);
		
		// 호스트가 운영하는 클래스 모든 리뷰 가져오는 메서드2 (클래스명)
		List<ReviewDTO> classReview2 = this.likeDao.class_review2(host_memNum);
		
		// 호스트가 운영하는 클래스 모든 리뷰 가져오는 메서드3 (옵션명/시작날짜/끝날짜)
		List<ReviewDTO> classReview3 = this.likeDao.class_review3(host_memNum);
		
		model.addAttribute("hostCont", hostCont);
		model.addAttribute("hostInfo", hostInfo);
		model.addAttribute("classCount", classCount);
		model.addAttribute("reviewCount", reviewCount);
		model.addAttribute("likeCount", likeCount);
		model.addAttribute("hostClass", hostClass);
		model.addAttribute("hostClassOption", hostClassOption);
		model.addAttribute("classReview1", classReview1);
		model.addAttribute("classReview2", classReview2);
		model.addAttribute("classReview3", classReview3);
		
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
