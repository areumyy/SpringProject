package com.market.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.JsonObject;
import com.market.model.BookingDAO;
import com.market.model.BookingDTO;
import com.market.model.CalculateDAO;
import com.market.model.CalculateDTO;
import com.market.model.CategoryDAO;
import com.market.model.CategoryDTO;
import com.market.model.ClassDAO;
import com.market.model.ClassDTO;
import com.market.model.Class_qnaDAO;
import com.market.model.Class_qnaDTO;
import com.market.model.HostDAO;
import com.market.model.HostDTO;
import com.market.model.LikeDAO;
import com.market.model.LikeDTO;
import com.market.model.MemberDAO;
import com.market.model.MemberDTO;
import com.market.model.NoticeDAO;
import com.market.model.NoticeDTO;
import com.market.model.OptionDAO;
import com.market.model.OptionDTO;
import com.market.model.PageDTO;
import com.market.model.QnaDAO;
import com.market.model.QnaDTO;
import com.market.model.ReviewDAO;
import com.market.model.ReviewDTO;
import com.market.model.Upload;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class MarketController {

	@Autowired
	private MemberDAO memberDao;
	@Autowired
	private LikeDAO likeDao;
	@Autowired
	private NoticeDAO noticeDao;
	@Autowired
	private CategoryDAO categoryDao;
	@Autowired
	private Upload upload;
	@Autowired
	private ClassDAO classDao;
	@Autowired
	private OptionDAO optionDao;
	@Autowired
	private QnaDAO qnaDao;
	@Autowired
	private HostDAO hostDao;
	@Autowired
	private BookingDAO bookingDao;
	@Autowired
	private Class_qnaDAO class_qnaDao;
	@Autowired
	private CalculateDAO calculateDao;
	@Autowired
	private ReviewDAO reviewDao;

	@RequestMapping("main.do")
	public String main(Model model, HttpServletRequest request) {
		int mem_num = 0;
		HttpSession session = request.getSession();
		
		if(session.getAttribute("loginDto") != null) {
			MemberDTO dto = (MemberDTO)session.getAttribute("loginDto");
			mem_num= dto.getMem_num();
		}
		
		List<ClassDTO> likeList = this.likeDao.getLikeClassList(mem_num);
		List<ClassDTO> nolikeList = this.likeDao.getNoLikeClassList(mem_num);
		List<ClassDTO> weekBestList = this.classDao.getBestListAll();
		List<ClassDTO> newList = this.classDao.getNewListAll();
		List<ClassDTO> saleList = this.classDao.getSaleListAll();
		
		model.addAttribute("likeList", likeList);
		model.addAttribute("nolikeList", nolikeList);
		model.addAttribute("weekBestList", weekBestList);
		model.addAttribute("newList", newList);
		model.addAttribute("saleList", saleList);
		
		return "main";
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
	@RequestMapping(value = "/updateNickCheck", method = RequestMethod.POST)
	@ResponseBody
	public void UpdateNickCheck(HttpServletResponse response, @RequestParam("mem_nick") String mem_nick, HttpServletRequest request) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		
		int mem_num = getMem_num(request);
		String res = null;
		int state = 0;
		
		 
		int result = this.memberDao.checkNick(mem_nick);
		
		int mem_num2 = this.memberDao.getMember_memNick(mem_nick); // 닉네임으로 가져온 넘버
		
		if (result == 0) {
			res = "사용 가능합니다.";
			state = 1;
		}else if(mem_num2 == mem_num) {
			res = "사용 가능합니다.";
			state = 1;
		}else {
			res = "사용 불가능합니다.";
			state = 2;
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
		} else if (result == -2) { // 탈퇴한 아이디
			out.println("<script>");
			out.println("alert('탈퇴한 아이디입니다.')");
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
		List<QnaDTO> pageList = this.qnaDao.getQnaListMember(dto);

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
		totalRecord = this.noticeDao.getListCount(0);

		PageDTO dto = new PageDTO(page, rowsize, totalRecord, 3);

		// 페이지에 해당하는 게시물을 가져오는 메서드 호출
		List<NoticeDTO> pageList = this.noticeDao.getMemberNoticeList(dto);

		model.addAttribute("list", pageList);
		model.addAttribute("Paging", dto);

		return "notice_list";
	}

	// 저장페이지 - 프립 찜 매핑
	@RequestMapping("like_frip.do")
	public String likeFrip(HttpServletRequest request, Model model) {

		// 세션값 가져오기
		HttpSession session = request.getSession();
		MemberDTO dto = (MemberDTO) session.getAttribute("loginDto");

		// 찜 클래스 목록 가져오는 메서드
		List<ClassDTO> likeClass = this.likeDao.getLikeClassList(dto.getMem_num());
		// List<ClassDTO> likeClass = this.likeDao.getLikeClassList(map);

		// 찜 클래스 별 옵션 상세정보 가져오는 메서드
		List<OptionDTO> optionCont = this.likeDao.getOption(dto.getMem_num());

		// 찜 클래스 별 별점
		List<Integer> classScore = this.likeDao.class_score(dto.getMem_num());

		model.addAttribute("likeClassList", likeClass);
		model.addAttribute("optionCont", optionCont);
		model.addAttribute("classScore", classScore);

		return "like_frip";
	}

	// 저장페이지 - 호스트 찜 매핑
	@RequestMapping("like_host.do")
	public String likeHost(HttpServletRequest request, Model model) {

		// 세션값 가져오기
		HttpSession session = request.getSession();
		MemberDTO dto = (MemberDTO) session.getAttribute("loginDto");

		// 찜 호스트 목록 가져오는 메서드
		List<HostDTO> likeHost = this.likeDao.getLikeHostList(dto.getMem_num());

		// 찜 호스트 별 상세정보 가져오는 메서드
		List<MemberDTO> hostInfo = this.likeDao.getHostInfo(dto.getMem_num());

		// 찜 호스트가 운영하는 클래스 개수 가져오는 메서드
		List<Integer> classCount = this.likeDao.host_classCount(dto.getMem_num());

		// 찜 호스트 후기 개수 가져오는 메서드
		List<Integer> reviewCount = this.likeDao.host_reivewCount(dto.getMem_num());

		// 찜 호스트 찜 개수 가져오는 메서드
		List<Integer> likeCount = this.likeDao.host_likeCount(dto.getMem_num());

		model.addAttribute("likeHostList", likeHost);
		model.addAttribute("hostInfo", hostInfo);
		model.addAttribute("classCount", classCount);
		model.addAttribute("reviewCount", reviewCount);
		model.addAttribute("likeCount", likeCount);

		return "like_host";
	}

	// 저장페이지 - 호스트 상세페이지 매핑
	@RequestMapping("host_info.do")
	public String hostInfo(@RequestParam("hostMemNum") int host_memNum, HttpServletRequest request, Model model) {

		// 세션값 가져오기
		HttpSession session = request.getSession();
		MemberDTO dto = (MemberDTO) session.getAttribute("loginDto");

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

		// 호스트가 운영하는 클래스 별 별점
		List<Integer> hosfClassScore = this.likeDao.host_class_score(host_memNum);

		// 호스트가 운영하는 클래스 모든 리뷰 가져오는 메서드1 (회원이름/회원프로필/리뷰내용/리뷰작성일)
		List<ReviewDTO> classReview1 = this.likeDao.class_review1(host_memNum);

		// 호스트가 운영하는 클래스 모든 리뷰 가져오는 메서드2 (클래스명/시작날짜/끝날짜)
		List<ReviewDTO> classReview2 = this.likeDao.class_review2(host_memNum);

		// 호스트가 운영하는 클래스 모든 리뷰 가져오는 메서드3 (옵션명)
		List<ReviewDTO> classReview3 = this.likeDao.class_review3(host_memNum);

		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("mem_num", dto.getMem_num()); // 로그인한 멤버 번호
		map.put("host_memNum", host_memNum); // 호스트 번호

		// 좋아요 누른 리뷰번호 리스트 가져오기
		List<Integer> like_list = this.likeDao.review_like_list(map);

		model.addAttribute("hostCont", hostCont);
		model.addAttribute("hostInfo", hostInfo);
		model.addAttribute("classCount", classCount);
		model.addAttribute("reviewCount", reviewCount);
		model.addAttribute("likeCount", likeCount);
		model.addAttribute("hostClass", hostClass);
		model.addAttribute("hostClassOption", hostClassOption);
		model.addAttribute("hosfClassScore", hosfClassScore);
		model.addAttribute("classReview1", classReview1);
		model.addAttribute("classReview2", classReview2);
		model.addAttribute("classReview3", classReview3);
		model.addAttribute("like_list", like_list);

		return "host_info";
	}

	// 저장페이지 - 리뷰 좋아요 매핑
	@RequestMapping(value = "/like_status.do", method = RequestMethod.POST)
	@ResponseBody
	public void likeStatus(HttpServletResponse response, @RequestParam("reviewNum") int reviewNum,
			HttpServletRequest request) throws IOException {

		response.setContentType("text/html; charset=UTF-8");

		// 세션값 가져오기
		HttpSession session = request.getSession();
		MemberDTO dto = (MemberDTO) session.getAttribute("loginDto");

		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("like_writer", dto.getMem_num()); // 로그인한 멤버 번호
		map.put("like_target", reviewNum); // 좋아요 누른 리뷰 번호

		// 해당 리뷰에 대한 좋아요 상태 체크하는 메서드 (0: 안 누른 상태 / 1: 누른 상태)
		int like_status = this.likeDao.review_status(map);

		int state = 0;
		int likeCount = 0;

		if (like_status > 0) { // 좋아요 누른 상태

			// 리뷰 좋아요 취소 (-1)
			int like_minus = this.likeDao.review_like_minus(reviewNum);

			// 좋아요 DB 삭제
			this.likeDao.review_like_del(map);

			// 리뷰 좋아요 개수 가져오는 메서드
			int like_count = this.likeDao.review_like_count(reviewNum);

			if (like_minus > 0) {
				state = 1;
				likeCount = like_count;
			}

		} else if (like_status == 0) { // 좋아요 안 누른 상태

			// 리뷰 좋아요 (+1)
			int like_plus = this.likeDao.review_like_plus(reviewNum);

			// 좋아요 DB 추가
			this.likeDao.review_like_add(map);

			// 리뷰 좋아요 개수 가져오는 메서드
			int like_count = this.likeDao.review_like_count(reviewNum);

			if (like_plus > 0) {
				state = 2;
				likeCount = like_count;
			}
		}

		JSONObject obj = new JSONObject();
		obj.put("state", state);
		obj.put("likeCount", likeCount);

		response.getWriter().print(obj);
	}

	// 저장페이지 - 호스트 리뷰 기준별 조회 매핑 (평점 높은순/평점 낮은순/최신순/추천순)
	@RequestMapping("review_sort.do")
	public String reviewSort(@RequestParam("sort") String sort, @RequestParam("hostMemNum") int host_memNum,
			HttpServletRequest request, Model model) {

		// 세션값 가져오기
		HttpSession session = request.getSession();
		MemberDTO dto = (MemberDTO) session.getAttribute("loginDto");

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

		// 호스트가 운영하는 클래스 별 별점
		List<Integer> hosfClassScore = this.likeDao.host_class_score(host_memNum);

		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("mem_num", dto.getMem_num()); // 로그인한 멤버 번호
		map.put("host_memNum", host_memNum); // 호스트 멤버 번호

		// 평점 높은순
		List<ReviewDTO> review_highScore1 = this.likeDao.review_highScore1(host_memNum); // 호스트가 운영하는 클래스 모든 리뷰 가져오는
																							// 메서드1
																							// (회원이름/회원프로필/리뷰내용/리뷰작성일)
		List<ReviewDTO> review_highScore2 = this.likeDao.review_highScore2(host_memNum); // 호스트가 운영하는 클래스 모든 리뷰 가져오는
																							// 메서드2 (클래스명/시작날짜/끝날짜)
		List<ReviewDTO> review_highScore3 = this.likeDao.review_highScore3(host_memNum); // 호스트가 운영하는 클래스 모든 리뷰 가져오는
																							// 메서드3 (옵션명)
		List<Integer> highScore_like_list = this.likeDao.highScore_like_list(map); // 좋아요 누른 리뷰번호 리스트 가져오기

		// 평점 낮은순
		List<ReviewDTO> review_lowScore1 = this.likeDao.review_lowScore1(host_memNum);
		List<ReviewDTO> review_lowScore2 = this.likeDao.review_lowScore2(host_memNum);
		List<ReviewDTO> review_lowScore3 = this.likeDao.review_lowScore3(host_memNum);
		List<Integer> lowScore_like_list = this.likeDao.lowScore_like_list(map);

		// 최신순
		List<ReviewDTO> review_newScore1 = this.likeDao.review_newScore1(host_memNum);
		List<ReviewDTO> review_newScore2 = this.likeDao.review_newScore2(host_memNum);
		List<ReviewDTO> review_newScore3 = this.likeDao.review_newScore3(host_memNum);
		List<Integer> newScore_like_list = this.likeDao.newScore_like_list(map);

		// 추천순
		List<ReviewDTO> review_likeScore1 = this.likeDao.review_likeScore1(host_memNum);
		List<ReviewDTO> review_likeScore2 = this.likeDao.review_likeScore2(host_memNum);
		List<ReviewDTO> review_likeScore3 = this.likeDao.review_likeScore3(host_memNum);
		List<Integer> likeScore_like_list = this.likeDao.likeScore_like_list(map);

		model.addAttribute("hostCont", hostCont);
		model.addAttribute("hostInfo", hostInfo);
		model.addAttribute("classCount", classCount);
		model.addAttribute("reviewCount", reviewCount);
		model.addAttribute("likeCount", likeCount);
		model.addAttribute("hostClass", hostClass);
		model.addAttribute("hostClassOption", hostClassOption);
		model.addAttribute("hosfClassScore", hosfClassScore);
		model.addAttribute("sort", sort);

		if (sort.equals("score_high")) { // 평점 높은순
			model.addAttribute("classReview1", review_highScore1);
			model.addAttribute("classReview2", review_highScore2);
			model.addAttribute("classReview3", review_highScore3);
			model.addAttribute("like_list", highScore_like_list);

		} else if (sort.equals("score_low")) { // 평점 낮은순
			model.addAttribute("classReview1", review_lowScore1);
			model.addAttribute("classReview2", review_lowScore2);
			model.addAttribute("classReview3", review_lowScore3);
			model.addAttribute("like_list", lowScore_like_list);

		} else if (sort.equals("score_new")) { // 최신순
			model.addAttribute("classReview1", review_newScore1);
			model.addAttribute("classReview2", review_newScore2);
			model.addAttribute("classReview3", review_newScore3);
			model.addAttribute("like_list", newScore_like_list);

		} else if (sort.equals("score_like")) { // 추천순
			model.addAttribute("classReview1", review_likeScore1);
			model.addAttribute("classReview2", review_likeScore2);
			model.addAttribute("classReview3", review_likeScore3);
			model.addAttribute("like_list", likeScore_like_list);
		}
		return "host_info_reviewSort";
	}

	/*
	 * @RequestMapping("category_list.do") public String cateList() { return
	 * "category_list"; }
	 */

	@RequestMapping("option_select.do")
	public String optionSel(@RequestParam("class_num") int class_num, Model model) {
		
		ClassDTO cdto = this.classDao.getList_classNum(class_num);
		List<OptionDTO> odto = this.optionDao.getOptionList(class_num);
		int bookingCount = this.bookingDao.getCount(class_num);
		
		model.addAttribute("cdto", cdto);
		model.addAttribute("odto", odto);
		model.addAttribute("bookingCount", bookingCount);
		
		return "option_select";
	}

	@RequestMapping("admin_frip_pass.do")
	public String fripPass(Model model) {

		// 프립 승인대기 목록
		List<ClassDTO> fripPass_wait = this.classDao.fripPass_wait();

		// 승인대기 수
		int wait_count = this.classDao.fripPass_wait_count();

		// 프립 승인완료 목록
		List<ClassDTO> fripPass_finish = this.classDao.fripPass_finish();

		// 승인완료 수
		int finish_count = this.classDao.fripPass_finish_count();

		model.addAttribute("fripPass_wait", fripPass_wait);
		model.addAttribute("wait_count", wait_count);
		model.addAttribute("fripPass_finish", fripPass_finish);
		model.addAttribute("finish_count", finish_count);

		return "admin_frip_pass";
	}

	@RequestMapping("admin_frip_pass_ok.do")
	public void fripPass_ok(@RequestParam("class_num") int class_num, HttpServletRequest request,
			HttpServletResponse response) throws IOException {

		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();

		int result = this.classDao.fripPass_result(class_num);

		if (result == 1) { // 승인완료 성공
			out.println("<script>");
			out.println("alert('승인처리가 정상적으로 완료되었습니다.')");
			out.println("location.href='admin_frip_pass.do'");
			out.println("</script>");

		} else { // 승인완료 실패
			out.println("<script>");
			out.println("alert('승인처리가 실패하였습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}

	}

	@RequestMapping("admin_cal_pass.do")
	public String calPass(Model model) {

		// 프립 승인대기 목록
		List<CalculateDTO> calPass_wait = this.calculateDao.calPass_wait();

		// 승인대기 목록 호스트 이름
		List<ClassDTO> wait_host = this.calculateDao.calPass_wait_host();

		// 승인대기 수
		int wait_count = this.calculateDao.calPass_wait_count();

		// 프립 승인완료 목록
		List<CalculateDTO> calPass_finish = this.calculateDao.calPass_finish();

		// 승인완료 목록 호스트 이름
		List<ClassDTO> finish_host = this.calculateDao.calPass_finish_host();

		// 승인완료 수
		int finish_count = this.calculateDao.calPass_finish_count();

		model.addAttribute("calPass_wait", calPass_wait);
		model.addAttribute("wait_host", wait_host);
		model.addAttribute("wait_count", wait_count);
		model.addAttribute("calPass_finish", calPass_finish);
		model.addAttribute("finish_count", finish_count);
		model.addAttribute("finish_host", finish_host);

		return "admin_cal_pass";
	}

	@RequestMapping("admin_cal_pass_ok.do")
	public void calPass_ok(@RequestParam("class_num") int class_num, HttpServletRequest request,
			HttpServletResponse response) throws IOException {

		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();

		int result = this.calculateDao.calPass_result(class_num);
		int result2 = this.calculateDao.calPass_result2(class_num);

		if (result == 1) { // 승인완료 성공
			if (result2 == 1) {
				out.println("<script>");
				out.println("alert('승인처리가 정상적으로 완료되었습니다.')");
				out.println("location.href='admin_cal_pass.do'");
				out.println("</script>");
			}

		} else { // 승인완료 실패
			out.println("<script>");
			out.println("alert('승인처리가 실패하였습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}

	}

	@RequestMapping("payment.do")
	public String pay(HttpServletRequest request, Model model) {
		int mem_num = getMem_num(request);
		
		BookingDTO bdto = new BookingDTO();
		bdto.setBooking_classNum(Integer.parseInt(request.getParameter("class_num")));
		bdto.setBooking_option(Integer.parseInt(request.getParameter("option_num")));
		bdto.setBooking_enterCheck("no");
		bdto.setBooking_writer(mem_num);
		
		ClassDTO classDto = this.classDao.getclassCont(bdto.getBooking_classNum());
		OptionDTO optionDto = this.optionDao.getOptionCont(bdto.getBooking_option());

		model.addAttribute("bookDto", bdto);
		model.addAttribute("classDto", classDto);
		model.addAttribute("optionDto", optionDto);
		
		return "payment";
	}
	
	@RequestMapping("payment_ok.do")
	public String payOk(BookingDTO dto, Model model, HttpServletRequest request) {
		int usedPoint = Integer.parseInt(request.getParameter("usedPoint"));
		String payMethod = request.getParameter("payMethod");
		int option_price = Integer.parseInt(request.getParameter("option_price"));
		
		this.bookingDao.insertBooking(dto);

		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("mem_num", dto.getBooking_writer());
		map.put("usedPoint", usedPoint);
		map.put("addPoint", (int)Math.round((option_price * 0.1)));
		
		this.memberDao.usePoint(map);

		this.memberDao.addPoint(map);

		ClassDTO classDto = this.classDao.getclassCont(dto.getBooking_classNum());
		OptionDTO optionDto = this.optionDao.getOptionCont(dto.getBooking_option());
		model.addAttribute("usedPoint", usedPoint);
		model.addAttribute("payMethod", payMethod);
		model.addAttribute("classDto", classDto);
		model.addAttribute("optionDto", optionDto);
		model.addAttribute("option_price", option_price);
		
		return "payment_ok";
	}
	@RequestMapping("hostMain.do")
	public String hostMain(Model model, @RequestParam("loginNum") int loginNum) {
		String page = null;
		MemberDTO dto = this.memberDao.getMember(loginNum);

		if (dto.getMem_status() == 2) { // 호스트인 사람이 호스트페이지 접근했을때
			List<NoticeDTO> NList = this.noticeDao.getHostNoticeList();

			model.addAttribute("NList", NList);
			page = "host/hostMain";
		} else { // 호스트 아닌 사람이 호스트 페이지 접근했을때
			page = "host/hostInsert";
		}
		
		//총 진행 프립 & 슈퍼호스트 기준
		int classCount = this.classDao.countClass_memnum(loginNum);
		//이번 달 매출 구하h는 메서드
		int mSales = this.calculateDao.getMsales(loginNum);
		//총 매출 구하는 메서드 
		int Sales = this.calculateDao.getSales(loginNum);
		//이번달 진행 프립
		int mFrip = this.classDao.getMonthFrip(loginNum);
		// 전체 신청 완료
		int allBooking = this.bookingDao.getcount_memnum(loginNum);
		// 후기 
		List<ReviewDTO> rList = this.reviewDao.getReviewList_memnum(loginNum);
		// 남겨진 후기
		int review = rList.size();
		// 평균 평점
		int sum = 0;
		for(int i=0; i<review; i++) {
			sum += rList.get(i).getReview_score();
		}
		double average = (double)sum/rList.size();
		//Q&A응답률
		int allQna = this.class_qnaDao.getallCount(loginNum);
		int passQna = this.class_qnaDao.getCountComplete(loginNum);
		double QnaRate = (double)passQna/allQna * 100;
		
		model.addAttribute("classCount", classCount);
		model.addAttribute("mSales", mSales);
		model.addAttribute("Sales", Sales);
		model.addAttribute("mFrip", mFrip);
		model.addAttribute("allBooking", allBooking);
		model.addAttribute("review", review);
		model.addAttribute("average", average);
		model.addAttribute("QnaRate", QnaRate);
		
		return page;
	}

	@RequestMapping("host_insert.do")
	public void hostInsertOk(HostDTO dto, HttpServletResponse response, HttpServletRequest request) throws IOException {
		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();

		int res = this.hostDao.insertHost(dto);

		if (res > 0) {
			this.memberDao.changeHost(dto.getHost_memNum());

			out.println("<script>");
			out.println("location.href='hostMain.do?loginNum=" + dto.getHost_memNum() + "'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('호스트 등록 실패!')");
			out.println("history.back()");
			out.println("</script>");
		}

	}

	@RequestMapping("hostMakeFrip.do")
	public String hostMakeFrip(Model model) {

		List<CategoryDTO> cateList = this.categoryDao.getCate_oneList();

		model.addAttribute("cateList", cateList);

		return "host/hostMakeFrip";
	}

	@RequestMapping(value = "/cate_two.do", method = RequestMethod.POST)
	@ResponseBody
	public void cate_two(HttpServletResponse response, @RequestParam("cate_one") String cate_one) throws IOException {

		List<CategoryDTO> cate_twoList = this.categoryDao.getCate_two(cate_one);

		JSONObject obj = new JSONObject();

		JSONArray ja = JSONArray.fromObject(cate_twoList);

		obj.put("clist", ja);

		response.getWriter().print(obj);

	}

	@RequestMapping(value = "/summerCont.do", method = RequestMethod.POST)
	@ResponseBody
	public void summerCont(HttpServletResponse response, @RequestParam("class_num") int class_num) throws IOException {

		ClassDTO dto = this.classDao.getList_classNum(class_num);

		JSONObject obj = new JSONObject();

		obj.put("dto", dto);

		response.getWriter().print(obj);

	}

	@RequestMapping(value = "/uploadSummernoteImageFile", produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile,
			HttpServletRequest request) {
		JsonObject jsonObject = new JsonObject();

		String fileRoot = "C:\\Users\\sd020\\git\\SpringProject\\SpringProject\\src\\main\\webapp\\resources\\summerUpload\\";

		String originalFileName = multipartFile.getOriginalFilename(); // 오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); // 파일 확장자
		String savedFileName = UUID.randomUUID() + extension; // 저장될 파일 명

		File targetFile = new File(fileRoot + savedFileName);
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile); // 파일 저장
			jsonObject.addProperty("url", "/summernoteImage/" + savedFileName);
			jsonObject.addProperty("responseCode", "success");

		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile); // 저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		String a = jsonObject.toString();
		return a;
	}

	@RequestMapping("insertFrip.do")
	public void insertFrip(ClassDTO dto, OptionDTO odto, MultipartHttpServletRequest mRequest,
			HttpServletRequest request, HttpServletResponse response) throws Exception { // 파일 업로드 처리
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		MemberDTO loginDto = (MemberDTO) session.getAttribute("loginDto"); // 로그인정보

		int mem_num = loginDto.getMem_num(); // 로그인 회원 번호

		dto.setClass_memNum(mem_num); // 회원 번호 넣어주기
		dto.setClass_image(upload.fileUpload(mRequest)); // 파일 이름으로 변환

		if (request.getParameter("startArea") == null) {
			dto.setClass_startArea("null");
			dto.setClass_startAreaDetail("null");
		}
		if (request.getParameter("class_endDate").length() == 0) { // 끝나는날이 없으면 시작날로 설정
			dto.setClass_endDate(dto.getClass_startDate());
		}

		// 전체 클래스의 수 + 1구하기
		int count = this.classDao.countClass();
		dto.setClass_num(count);
		odto.setOption_classNum(count);

		int result = this.classDao.insertClass(dto);

		// 옵션
		int result2 = 0;
		// 옵션 개수
		int Qtt = Integer.parseInt(request.getParameter("optionQtt"));
		for (int i = 1; i <= Qtt; i++) {
			odto.setOption_name(request.getParameter("option_name" + i));
			odto.setOption_price(Integer.parseInt(request.getParameter("option_price" + i)));

			result2 = this.optionDao.insertOption(odto);
		}

		PrintWriter out = response.getWriter();
		if (result == 1 && result2 == 1) {
			out.println("<script>");
			out.println("alert('등록 성공!')");
			out.println("location.href='hostMain.do?loginNum=" + loginDto.getMem_num() + "'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('등록 실패!')");
			out.println("history.back()");
			out.println("</script>");
		}

	}

	@RequestMapping("hostMyFrip.do")
	public String hostMyFrip(HttpServletRequest request, Model model) {
		int mem_num = getMem_num(request);

		int totalRecord = 0;
		int rowsize = 8;
		int page = 0; // 현재 페이지 변수

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		} else {
			page = 1; // 처음으로 "게시물 전체 목록" 태그를 클릭한 경우
		}

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mem_num", mem_num);
		int class_pass = 1;

		map.put("class_pass", class_pass);

		// DB 상의 전체 게시물의 수를 확인하는 작업.
		totalRecord = this.classDao.countclass_myfrip(map);

		PageDTO dto = new PageDTO(page, rowsize, totalRecord, 3);
		map.put("dto", dto);

		List<ClassDTO> list = this.classDao.getList_myFrip(map);

		model.addAttribute("cList", list);
		model.addAttribute("Paging", dto);

		return "host/hostMyFrip";
	}

	@RequestMapping("hostMyFripWait.do")
	public String hostMyFripWait(HttpServletRequest request, Model model) {
		int mem_num = getMem_num(request);

		int totalRecord = 0;
		int rowsize = 8;
		int page = 0; // 현재 페이지 변수

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		} else {
			page = 1; // 처음으로 "게시물 전체 목록" 태그를 클릭한 경우
		}

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mem_num", mem_num);
		int class_pass = 0;

		map.put("class_pass", class_pass);

		// DB 상의 전체 게시물의 수를 확인하는 작업.
		totalRecord = this.classDao.countclass_myfripWait(map);

		PageDTO dto = new PageDTO(page, rowsize, totalRecord, 3);
		map.put("dto", dto);

		List<ClassDTO> list = this.classDao.getList_myFripWait(map);

		model.addAttribute("cList", list);
		model.addAttribute("Paging", dto);
		
		return "host/hostMyFripWait";
	}

	@RequestMapping("hostMyFripEnd.do")
	public String hostMyFripEnd(HttpServletRequest request, Model model) {
		int mem_num = getMem_num(request);

		int totalRecord = 0;
		int rowsize = 8;
		int page = 0; // 현재 페이지 변수

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		} else {
			page = 1; // 처음으로 "게시물 전체 목록" 태그를 클릭한 경우
		}

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mem_num", mem_num);
		int class_pass = 1;

		map.put("class_pass", class_pass);

		// DB 상의 전체 게시물의 수를 확인하는 작업.
		totalRecord = this.classDao.countclass_end(map);

		PageDTO dto = new PageDTO(page, rowsize, totalRecord, 3);
		map.put("dto", dto);

		List<ClassDTO> list = this.classDao.getList_end(map);

		model.addAttribute("cList", list);
		model.addAttribute("Paging", dto);

		return "host/hostMyFripEnd";
	}

	@RequestMapping("hostAttendance.do")
	public String hostAttendance(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();

		MemberDTO loginDto = (MemberDTO) session.getAttribute("loginDto"); // 로그인정보

		int mem_num = loginDto.getMem_num(); // 로그인 회원 번호

		int totalRecord = 0;
		int rowsize = 10;
		int page = 0; // 현재 페이지 변수

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		} else {
			page = 1; // 처음으로 "게시물 전체 목록" 태그를 클릭한 경우
		}

		// DB 상의 전체 게시물의 수를 확인하는 작업.
		totalRecord = this.classDao.countClass(mem_num);

		PageDTO dto = new PageDTO(page, rowsize, totalRecord, 3);

		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("dto", dto);
		map.put("mem_num", mem_num);
		// 페이지에 해당하는 게시물을 가져오는 메서드 호출
		List<ClassDTO> classList = this.classDao.getList(map);

		model.addAttribute("cList", classList);
		model.addAttribute("Paging", dto);
		return "host/hostAttendance";
	}

	@RequestMapping("hostAttendance_member.do")
	public String hostAttendance_member(HttpServletRequest request, Model model) {

		int class_num = Integer.parseInt(request.getParameter("class_num"));

		int totalRecord = 0;
		int rowsize = 10;
		int page = 0; // 현재 페이지 변수

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		} else {
			page = 1; // 처음으로 "게시물 전체 목록" 태그를 클릭한 경우
		}

		// DB 상의 전체 게시물의 수를 확인하는 작업.
		totalRecord = this.bookingDao.getCount(class_num);

		PageDTO dto = new PageDTO(page, rowsize, totalRecord, 3);

		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("dto", dto);
		map.put("class_num", class_num);
		// 페이지에 해당하는 게시물을 가져오는 메서드 호출
		List<BookingDTO> BookingList = this.bookingDao.getList(map);

		// 클래스 정보
		ClassDTO cdto = this.classDao.getList_classNum(class_num);

		model.addAttribute("cList", cdto);
		model.addAttribute("bList", BookingList);
		model.addAttribute("Paging", dto);

		return "host/hostAttendance_member";
	}

	@RequestMapping("hostAsk.do")
	public String hostAsk(HttpServletRequest request, Model model) {

		int mem_num = getMem_num(request);

		int totalRecord = 0;
		int rowsize = 10;
		int page = 0; // 현재 페이지 변수

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		} else {
			page = 1; // 처음으로 "게시물 전체 목록" 태그를 클릭한 경우
		}

		// DB 상의 전체 게시물의 수를 확인하는 작업.
		totalRecord = this.class_qnaDao.getCount(mem_num);

		PageDTO dto = new PageDTO(page, rowsize, totalRecord, 3);

		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("dto", dto);
		map.put("mem_num", mem_num);
		// 페이지에 해당하는 게시물을 가져오는 메서드 호출
		List<Class_qnaDTO> qnaList = this.class_qnaDao.getQnaList(map);

		model.addAttribute("qList", qnaList);
		model.addAttribute("Paging", dto);

		return "host/hostAsk";
	}

	@RequestMapping("hostAskComplete.do")
	public String hostAskComplete(HttpServletRequest request, Model model) {

		int mem_num = getMem_num(request);

		int totalRecord = 0;
		int rowsize = 10;
		int page = 0; // 현재 페이지 변수

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		} else {
			page = 1; // 처음으로 "게시물 전체 목록" 태그를 클릭한 경우
		}

		// DB 상의 전체 게시물의 수를 확인하는 작업.
		totalRecord = this.class_qnaDao.getCountComplete(mem_num);

		PageDTO dto = new PageDTO(page, rowsize, totalRecord, 3);

		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("dto", dto);
		map.put("mem_num", mem_num);
		// 페이지에 해당하는 게시물을 가져오는 메서드 호출
		List<Class_qnaDTO> qnaList = this.class_qnaDao.getQnaCompleteList(map);

		model.addAttribute("qList", qnaList);
		model.addAttribute("Paging", dto);

		return "host/hostAskComplete";
	}

	@RequestMapping("hostEndCheck.do")
	public String hostEndCheck(HttpServletRequest request, Model model, HttpServletResponse response) {

		int nowPage = Integer.parseInt(request.getParameter("page"));
		int class_num = Integer.parseInt(request.getParameter("class_num"));

		CalculateDTO cdto = new CalculateDTO();

		ClassDTO classdto = this.classDao.getList_classNum(class_num);

		int allCount = this.bookingDao.getCount(class_num);
		int enterCount = this.bookingDao.getCountEnter(class_num);
		int enterNoCount = allCount - enterCount;

		List<OptionDTO> odto = this.optionDao.getOptionList(class_num);

		int cal_sal = 0;

		for (int i = 0; i < odto.size(); i++) {
			// 옵션을 구매한 사람의 수를 구하기
			int optionCount = this.bookingDao.getcount_option_num(odto.get(i).getOption_num());
			if (odto.get(i).getOption_price() == odto.get(i).getOption_editPrice()) {
				cal_sal += (odto.get(i).getOption_price() * optionCount);
			} else if (odto.get(i).getOption_price() != odto.get(i).getOption_editPrice()) {
				cal_sal += (odto.get(i).getOption_editPrice() * optionCount);
			}
		}

		cdto.setCal_classNum(class_num);
		cdto.setCal_startDate(classdto.getClass_startDate().substring(0, 10));
		cdto.setCal_endDate(classdto.getClass_endDate().substring(0, 10));
		cdto.setCal_name(classdto.getClass_title());
		cdto.setCal_buyCount(allCount);
		cdto.setCal_enterCount(enterCount);
		cdto.setCal_enterNoCount(enterNoCount);
		cdto.setCal_sal(cal_sal);
		cdto.setCal_total((int) (cal_sal * 0.9));
		int res = this.calculateDao.insertData(cdto);

		if (res == 1) {
			this.classDao.changeCalState(class_num);
		}

		return "redirect:hostMyFripEnd.do?page=" + nowPage;
	}

	@RequestMapping("hostCalculateReq.do")
    public String hostCalReq(HttpServletRequest request, Model model, @RequestParam("type") String type) {
        HttpSession session = request.getSession();

        MemberDTO loginDto = (MemberDTO) session.getAttribute("loginDto"); // 로그인정보

        int mem_num = loginDto.getMem_num(); // 로그인 회원 번호

        int totalRecord = 0;
        int rowsize = 3;
        int page = 0; // 현재 페이지 변수

        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        } else {
            page = 1; // 처음으로 "게시물 전체 목록" 태그를 클릭한 경우
        }

        List<CalculateDTO> calList = new ArrayList<CalculateDTO>();

        if (type.equals("total")) {
            totalRecord = this.calculateDao.getCountAll(mem_num);
            PageDTO dto = new PageDTO(page, rowsize, totalRecord, 3);

            HashMap<String, Integer> map = new HashMap<String, Integer>();
            map.put("mem_num", mem_num);
            map.put("status", 0);

            List<ClassDTO> classList = this.classDao.getList_endOkAll(map); // 종료확인된 클래스 리스트
            calList = this.calculateDao.getListAll(classList);
            model.addAttribute("Paging", dto);
        } else if (type.equals("before")) {
            totalRecord = this.calculateDao.getCountBefore(mem_num);
            PageDTO dto = new PageDTO(page, rowsize, totalRecord, 3);

            HashMap<String, Integer> map = new HashMap<String, Integer>();
            map.put("mem_num", mem_num);
            map.put("status", 3);
            List<ClassDTO> classList = this.classDao.getList_endOk(map);
            calList = this.calculateDao.getListBefore(classList);
            model.addAttribute("Paging", dto);
        } else if (type.equals("ing")) {
            totalRecord = this.calculateDao.getCountIng(mem_num);
            PageDTO dto = new PageDTO(page, rowsize, totalRecord, 3);

            HashMap<String, Integer> map = new HashMap<String, Integer>();
            map.put("mem_num", mem_num);
            map.put("status", 1);
            List<ClassDTO> classList = this.classDao.getList_endOk(map); // 종료된 클래스 리스트
            calList = this.calculateDao.getListIng(classList);
            model.addAttribute("Paging", dto);
        } else if (type.equals("after")) {
            totalRecord = this.calculateDao.getCountAfter(mem_num);
            PageDTO dto = new PageDTO(page, rowsize, totalRecord, 3);

            HashMap<String, Integer> map = new HashMap<String, Integer>();
            map.put("mem_num", mem_num);
            map.put("status", 2);
            List<ClassDTO> classList = this.classDao.getList_endOk(map); // 종료된 클래스 리스트
            calList = this.calculateDao.getListAfter(classList);
            model.addAttribute("Paging", dto);
        }

        model.addAttribute("list", calList);
        model.addAttribute("type", type);

        return "host/hostCalculateReq";
    }

	@RequestMapping(value = "/cal_req", method = RequestMethod.POST)
	@ResponseBody
	public void calReq(HttpServletResponse response, @RequestParam("target") int target) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		int res = 0;

		int result1 = this.calculateDao.requestCal(target);
		int result2 = this.classDao.requestCal(target);

		if (result1 > 0 && result2 > 0) {
			res = 1;
		} else {
			res = -1;
		}

		JSONObject obj = new JSONObject();
		obj.put("res", res);

		response.getWriter().print(obj);
	}

	@RequestMapping("hostNotice_list.do")
	public String hostNotice(Model model, HttpServletRequest request) {
		int totalRecord = 0;
		int rowsize = 5;
		int page = 0; // 현재 페이지 변수

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		} else {
			page = 1; // 처음으로 "게시물 전체 목록" 태그를 클릭한 경우
		}

		// DB 상의 전체 게시물의 수를 확인하는 작업.
		totalRecord = this.noticeDao.getListCount(1);

		PageDTO dto = new PageDTO(page, rowsize, totalRecord, 3);

		// 페이지에 해당하는 게시물을 가져오는 메서드 호출
		List<NoticeDTO> pageList = this.noticeDao.getHostNoticeList(dto);

		model.addAttribute("list", pageList);
		model.addAttribute("Paging", dto);

		return "host/hostNotice_list";
	}

	@RequestMapping("hostQna_list.do")
	public String hostQna(Model model, HttpServletRequest request) {
		int totalRecord = 0;
		int rowsize = 5;
		int page = 0; // 현재 페이지 변수

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		} else {
			page = 1; // 처음으로 "게시물 전체 목록" 태그를 클릭한 경우
		}

		// DB 상의 전체 게시물의 수를 확인하는 작업.
		totalRecord = this.qnaDao.getListCount(1);

		PageDTO dto = new PageDTO(page, rowsize, totalRecord, 3);

		// 페이지에 해당하는 게시물을 가져오는 메서드 호출
		List<QnaDTO> pageList = this.qnaDao.getQnaListHost(dto);

		model.addAttribute("list", pageList);
		model.addAttribute("Paging", dto);

		return "host/hostQna_list";
	}

	@RequestMapping("hostReview.do")
	public String hostReview(HttpServletRequest request, Model model) {
		int mem_num = getMem_num(request);

		int totalRecord = 0;
		int rowsize = 5;
		int page = 0; // 현재 페이지 변수

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		} else {
			page = 1; // 처음으로 "게시물 전체 목록" 태그를 클릭한 경우
		}

		// DB 상의 전체 게시물의 수를 확인하는 작업.
		totalRecord = this.reviewDao.getCount_memnum(mem_num);

		PageDTO dto = new PageDTO(page, rowsize, totalRecord, 3);

		// 페이지에 해당하는 게시물을 가져오는 메서드 호출
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("dto", dto);
		map.put("mem_num", mem_num);

		List<ReviewDTO> rList = this.reviewDao.getList_memnum(map);

		int sum = 0;
		for (int i = 0; i < rList.size(); i++) {
			sum += rList.get(i).getReview_score();
		}
		double average = (double) sum / rList.size();

		model.addAttribute("total", totalRecord);
		model.addAttribute("average", average);
		model.addAttribute("rList", rList);
		model.addAttribute("Paging", dto);

		return "host/hostReview";
	}

	@RequestMapping("reviewReplyOk.do")
	public String reviewReplyOk(HttpServletRequest request) {
		int review_num = Integer.parseInt(request.getParameter("review_num"));
		int page = Integer.parseInt(request.getParameter("page"));
		String review_reply = request.getParameter("review_reply");

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("review_num", review_num);
		map.put("review_reply", review_reply);

		int res = this.reviewDao.insertReply(map);

		return "redirect:hostReview.do?page=" + page;
	}

	@RequestMapping("mypage.do")
	public String myPage(HttpServletRequest request, Model model) {

		HttpSession session = request.getSession();

		MemberDTO dto = (MemberDTO) session.getAttribute("loginDto");

		// 회원 번호에 맞는 회원의 정보를 받아오는 메서드
		MemberDTO list = this.memberDao.getMember(dto.getMem_num());
		
		// frip_booking 테이블에서 회원의 예약정보 받아옴.
		List<BookingDTO> blist = this.bookingDao.getBookingWorks(dto.getMem_num());
		
		// 클래스 번호에 맞는 정보를 받아오는 메서드 
		// ClassDTO clist = this.classDao.getList_classNum(blist.getBooking_classNum());
		List<ClassDTO> clist = this.classDao.getList_classNum(blist);
		
		List<OptionDTO> olist = this.optionDao.getOptionCheck(blist);

		
		
		List<Object> test = new ArrayList<Object>();
		test.add(list);
		test.add(blist);
		test.add(clist);
		test.add(olist);
		
		model.addAttribute("test",test);
		model.addAttribute("list", list);
		model.addAttribute("blist", blist);
		model.addAttribute("clist", clist);
		model.addAttribute("olist", olist);
		
		return "mypage";
	}

	@RequestMapping("mypage_edit.do")
	public String myPageEdit(HttpServletRequest request, Model model) {

		HttpSession session = request.getSession();

		MemberDTO dto = (MemberDTO) session.getAttribute("loginDto");

		MemberDTO list = this.memberDao.getMember(dto.getMem_num());

		model.addAttribute("list", list);

		return "mypage_edit";
	}

	@RequestMapping("mypage_edit_ok.do")
	public void myPageEditOk(MemberDTO dto, HttpServletResponse response, @RequestParam("mem_nick") String mem_nick,
			Model model) throws IOException {

		response.setContentType("text/html; charset-UTF-8");

		PrintWriter out = response.getWriter();

		int result = this.memberDao.checkNick(mem_nick);

		if (result > 0) { // 하나 이상 중복되는 닉네임이 있을 경우
			out.println("<script>");
			out.println("alert('이미 사용중인 닉네임입니다')");
			out.println("history.back()");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('닉네임이 변경되었습니다')");
			out.println("location.href='mypage_edit.do'");
			out.println("</script>");
			this.memberDao.updateMember(dto);
		}

	}

	@RequestMapping("mypage_coupon.do")
	public String myPageCoupon() {
		return "mypage_coupon";
	}

	/*
	 * @RequestMapping("mypage_purchases.do") public String
	 * myPagePurchases(HttpServletRequest request, Model model) {
	 * 
	 * HttpSession session = request.getSession();
	 * 
	 * MemberDTO dto = (MemberDTO) session.getAttribute("loginDto");
	 * 
	 * // 회원 번호에 맞는 회원의 정보를 받아오는 메서드 MemberDTO list =
	 * this.memberDao.getMember(dto.getMem_num());
	 * 
	 * // frip_booking 테이블에서 회원의 예약정보 받아옴. BookingDTO blist =
	 * this.bookingDao.getBookingWorks(dto.getMem_num());
	 * 
	 * // 클래스 번호에 맞는 정보를 받아오는 메서드 ClassDTO clist =
	 * this.classDao.getList_classNum(blist.getBooking_classNum());
	 * 
	 * OptionDTO olist = this.optionDao.getOptionCheck(clist.getClass_num());
	 * 
	 * model.addAttribute("list", list); model.addAttribute("blist", blist);
	 * model.addAttribute("clist", clist); model.addAttribute("olist", olist);
	 * 
	 * return "mypage_purchases"; }
	 */

	@RequestMapping("mypage_energy.do")
	public String myPageEnergy() {
		return "mypage_energy";
	}

	@RequestMapping("mypage_review.do")
	public String myPageReview() {
		return "mypage_review";
	}

	/*
	 * @RequestMapping("mypage_productDetail.do") public String
	 * myPageProductDetail(HttpServletRequest request, Model model) {
	 * 
	 * HttpSession session = request.getSession();
	 * 
	 * MemberDTO dto = (MemberDTO) session.getAttribute("loginDto");
	 * 
	 * // 회원 번호에 맞는 회원의 정보를 받아오는 메서드 MemberDTO list =
	 * this.memberDao.getMember(dto.getMem_num());
	 * 
	 * // frip_booking 테이블에서 회원의 예약정보 받아옴. BookingDTO blist =
	 * this.bookingDao.getBookingWorks(dto.getMem_num());
	 * 
	 * // 클래스 번호에 맞는 정보를 받아오는 메서드 ClassDTO clist =
	 * this.classDao.getList_classNum(blist.getBooking_classNum());
	 * 
	 * OptionDTO olist = this.optionDao.getOptionCheck(clist.getClass_num());
	 * 
	 * model.addAttribute("list", list); model.addAttribute("blist", blist);
	 * model.addAttribute("clist", clist); model.addAttribute("olist", olist);
	 * return "mypage_productDetail"; }
	 */

	/*
	 * @RequestMapping("mypage_reviewWrite.do") public String
	 * myPageReviewWrite(HttpServletRequest request, @RequestParam("no") int
	 * booking_num, Model model) {
	 * 
	 * HttpSession session = request.getSession();
	 * 
	 * MemberDTO dto = (MemberDTO) session.getAttribute("loginDto");
	 * 
	 * // 회원 번호에 맞는 회원의 정보를 받아오는 메서드 MemberDTO list =
	 * this.memberDao.getMember(dto.getMem_num());
	 * 
	 * // frip_booking 테이블에서 회원의 예약정보 받아옴. BookingDTO blist =
	 * this.bookingDao.getBookingWorks(dto.getMem_num());
	 * 
	 * // 클래스 번호에 맞는 정보를 받아오는 메서드 ClassDTO clist =
	 * this.classDao.getList_classNum(blist.getBooking_classNum());
	 * 
	 * model.addAttribute("clist", clist);
	 * 
	 * return "mypage_reviewWrite";
	 * 
	 * // booking_num = review_num }
	 */
	@RequestMapping("mypage_reviewWriteOk.do")
	public String myPageReviewWriteOk(ReviewDTO dto, OptionDTO odto, MultipartHttpServletRequest mRequest,
			HttpServletRequest request, HttpServletResponse response, @RequestParam("no") int booking_num, Model model) {
		
		
		
		return "mypage_reviewWrite";
	}

	@RequestMapping("admin_notice.do")
	public String adminNotice(HttpServletRequest request, Model model, @RequestParam("sort") String sort) {
		int totalRecord = 0;
		int rowsize = 5;
		int page = 0; // 현재 페이지 변수

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		} else {
			page = 1; // 처음으로 "게시물 전체 목록" 태그를 클릭한 경우
		}

		PageDTO dto = null;
		List<NoticeDTO> pageList = null;

		if (sort.equals("total")) {
			totalRecord = this.noticeDao.getListAllCount();

			dto = new PageDTO(page, rowsize, totalRecord, 3);

			pageList = this.noticeDao.getNoticeAllList(dto);
		} else if (sort.equals("host")) {
			totalRecord = this.noticeDao.getListCount(1);

			dto = new PageDTO(page, rowsize, totalRecord, 3);

			pageList = this.noticeDao.getHostNoticeList(dto);
		} else if (sort.equals("member")) {
			totalRecord = this.noticeDao.getListCount(0);

			dto = new PageDTO(page, rowsize, totalRecord, 3);

			pageList = this.noticeDao.getMemberNoticeList(dto);
		}
		model.addAttribute("list", pageList);
		model.addAttribute("Paging", dto);
		model.addAttribute("sort", sort);

		return "admin_notice";
	}

	@RequestMapping("admin_notice_insert.do")
	public String adminNoticeInsert() {
		return "admin_notice_insertForm";
	}

	@RequestMapping("admin_notice_insert_ok.do")
	public void adminNoticeInsertOk(NoticeDTO dto, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();

		int result = this.noticeDao.insertNotice(dto);

		if (result > 0) {
			out.println("<script>");
			out.println("location.href='admin_notice.do?sort=total'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('등록 실패!')");
			out.println("history.back()");
			out.println("</script>");
		}
	}

	@RequestMapping("notice_del.do")
	public void adminNoticeDel(@RequestParam("notice_num") int notice_num, HttpServletResponse response,
			@RequestParam("sort") String sort) throws IOException {
		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();

		int result = this.noticeDao.deleteNotice(notice_num);

		if (result > 0) {
			this.noticeDao.updateNoticeNum(notice_num);
			out.println("<script>");
			out.println("location.href='admin_notice.do?sort=" + sort + "'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('삭제 실패!')");
			out.println("history.back()");
			out.println("</script>");
		}
	}

	@RequestMapping("notice_edit.do")
	public String adminNoticeEdti(@RequestParam("notice_num") int notice_num, Model model,
			@RequestParam("sort") String sort, @RequestParam("page") int page) {
		NoticeDTO dto = this.noticeDao.getNoticeCont(notice_num);

		model.addAttribute("dto", dto);
		model.addAttribute("sort", sort);
		model.addAttribute("page", page);

		return "admin_notice_edit";
	}

	@RequestMapping("admin_notice_edit_ok.do")
	public void adminNoticeEdidOk(NoticeDTO dto, HttpServletResponse response, @RequestParam("page") int page)
			throws IOException {
		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();

		int result = this.noticeDao.editNotice(dto);

		if (result > 0) {

			String sort = null;
			if (dto.getNotice_flag() == 0) {
				sort = "member";
			} else if (dto.getNotice_flag() == 1) {
				sort = "host";
			}
			out.println("<script>");
			out.println("location.href='admin_notice.do?sort=" + sort + "&page=" + page + "'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('수정 실패!')");
			out.println("history.back()");
			out.println("</script>");
		}

	}

	@RequestMapping("admin_member_list.do")
	public String adminMember(Model model, HttpServletRequest request, @RequestParam("sort") String sort) {
		int totalRecord = 0;
		int rowsize = 5;
		int page = 0; // 현재 페이지 변수

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		} else {
			page = 1; // 처음으로 "게시물 전체 목록" 태그를 클릭한 경우
		}

		PageDTO dto = null;
		List<MemberDTO> memberList = null;

		if (sort.equals("total")) {
			totalRecord = this.memberDao.getAllCount();
			dto = new PageDTO(page, rowsize, totalRecord, 3);
			memberList = this.memberDao.getAllList(dto);
			List<MemberDTO> hostlist = this.memberDao.getMemberList(dto);
			model.addAttribute("hostlist", hostlist);

		} else if (sort.equals("host")) {
			totalRecord = this.memberDao.getHostCount();
			dto = new PageDTO(page, rowsize, totalRecord, 3);
			memberList = this.memberDao.getHostList(dto);

		} else if (sort.equals("member")) {
			totalRecord = this.memberDao.getAllCount() - this.memberDao.getHostCount();
			dto = new PageDTO(page, rowsize, totalRecord, 3);
			memberList = this.memberDao.getMemberList(dto);

		} else if (sort.equals("out")) {
			totalRecord = this.memberDao.getOutCount();
			dto = new PageDTO(page, rowsize, totalRecord, 3);
			memberList = this.memberDao.getOutList(dto);
		}

		model.addAttribute("list", memberList);
		model.addAttribute("Paging", dto);
		model.addAttribute("sort", sort);

		return "admin_member_list";
	}

	@RequestMapping("admin_member_del.do")
	public void adminMemDel(Model model, HttpServletResponse response, @RequestParam("sort") String sort,
			@RequestParam("page") String page, @RequestParam("check") int[] mem_num) throws IOException {
		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();

		this.memberDao.updateMemberDel(mem_num);

		out.println("<script>");
		out.println("location.href='admin_member_list.do?sort=" + sort + "&page=" + page + "'");
		out.println("</script>");
	}

	@RequestMapping("admin_member_search.do")
	public String adminMemSearch(Model model, HttpServletRequest request, @RequestParam("sort") String sort,
			@RequestParam("field") String field, @RequestParam("keyword") String keyword) {
		int totalRecord = 0;
		int rowsize = 5;
		int page = 0; // 현재 페이지 변수

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		} else {
			page = 1; // 처음으로 "게시물 전체 목록" 태그를 클릭한 경우
		}

		// DB 상의 전체 게시물의 수를 확인하는 작업.
		totalRecord = this.memberDao.getSearchCount(field, keyword);

		PageDTO dto = new PageDTO(page, rowsize, totalRecord, 3, field, keyword);

		// 페이지에 해당하는 게시물을 가져오는 메서드 호출
		List<MemberDTO> pageList = this.memberDao.getSearchMember(dto);

		model.addAttribute("list", pageList);
		model.addAttribute("Paging", dto);
		model.addAttribute("sort", "total");

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
	public String hostAsk_answer(HttpServletRequest request, Model model) {

		int qna_num = Integer.parseInt(request.getParameter("qna_num"));
		int page = Integer.parseInt(request.getParameter("page"));

		// qna_num으로 상세내역 구하기
		Class_qnaDTO dto = this.class_qnaDao.getContent(qna_num);

		model.addAttribute("dto", dto);
		model.addAttribute("page", page);

		return "host/hostAsk_answer";
	}

	@RequestMapping("hostAnswerWRiteOk.do")
	public String hostAnswerWRiteOk(HttpServletRequest request, Model model) {

		String ans_cont = request.getParameter("ans_cont");
		int page = Integer.parseInt(request.getParameter("page"));
		int qna_num = Integer.parseInt(request.getParameter("qna_num"));

		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("ans_cont", ans_cont);
		map.put("qna_num", qna_num);
		// 상세 내역 넣어주기
		int dto = this.class_qnaDao.insertAnswer(map);

		model.addAttribute("dto", dto);
		model.addAttribute("page", page);

		return "redirect:hostAsk.do?page=" + page;
	}

	@RequestMapping("hostAskAnswerUpdate.do")
	public String hostAskAnswerUpdate(HttpServletRequest request, Model model) {

		int qna_num = Integer.parseInt(request.getParameter("qna_num"));
		int page = Integer.parseInt(request.getParameter("page"));

		// qna_num으로 상세내역 구하기
		Class_qnaDTO dto = this.class_qnaDao.getContent(qna_num);

		model.addAttribute("dto", dto);
		model.addAttribute("page", page);

		return "host/hostAsk_answerUpdate";
	}

	@RequestMapping("hostAnswerUpdateOk.do")
	public String hostAnswerUpdateOk(HttpServletRequest request, Model model) {

		String ans_cont = request.getParameter("ans_cont");
		int page = Integer.parseInt(request.getParameter("page"));
		int qna_num = Integer.parseInt(request.getParameter("qna_num"));

		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("ans_cont", ans_cont);
		map.put("qna_num", qna_num);
		// 상세 내역 넣어주기
		int dto = this.class_qnaDao.insertAnswer(map);

		model.addAttribute("dto", dto);
		model.addAttribute("page", page);

		return "redirect:hostAskComplete.do?page=" + page;
	}

	@RequestMapping("hostUpdateFrip.do")
	public String hostUpdateFrip(@RequestParam("class_num") int num, Model model) {
		ClassDTO classList = this.classDao.getList_classNum(num);
		List<CategoryDTO> cate_twoList = this.categoryDao.getCate_two(classList.getClass_category1());
		List<CategoryDTO> cateList = this.categoryDao.getCate_oneList();
		List<OptionDTO> optionList = this.optionDao.getOptionList(num);
		int optionCount = this.optionDao.getOptionCount(num);

		model.addAttribute("cate2List", cate_twoList);
		model.addAttribute("cateList", cateList);
		model.addAttribute("classList", classList);
		model.addAttribute("optionList", optionList);
		model.addAttribute("optionCount", optionCount);
		return "host/hostUpdateFrip";
	}

	@RequestMapping("hostUpdateFripOk.do")
	public void hostUpdateFrip(ClassDTO dto, OptionDTO odto, MultipartHttpServletRequest mRequest,
			HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		MemberDTO loginDto = (MemberDTO) session.getAttribute("loginDto"); // 로그인정보

		int mem_num = loginDto.getMem_num(); // 로그인 회원 번호

		dto.setClass_memNum(mem_num); // 회원 번호 넣어주기

		// 원래 클래스의 정보
		ClassDTO classList = this.classDao.getList_classNum(dto.getClass_num());

		// 사진을 수정했는지 여부 확인
		if (dto.getClass_image2().getSize() == 0) {
			dto.setClass_image(classList.getClass_image());
		} else {
			dto.setClass_image(upload.fileUpload(mRequest)); // 파일 이름으로 변환
		}

		if (request.getParameter("startArea") == null) {
			dto.setClass_startArea("null");
			dto.setClass_startAreaDetail("null");
		}
		if (dto.getClass_endDate() == null) { // 끝나는날이 없으면 공백값
			dto.setClass_endDate("null");
		}

		odto.setOption_classNum(dto.getClass_num());
		int result = this.classDao.UpdateClass(dto);

		// 원래 옵션 개수
		int optionCount = this.optionDao.getcountoption(dto.getClass_num());

		// 옵션
		int result2 = 0;
		// 옵션 개수
		int Qtt = Integer.parseInt(request.getParameter("optionQtt"));

		for (int i = 1; i <= optionCount; i++) {
			odto.setOption_num(Integer.parseInt(request.getParameter("option_num" + i)));
			odto.setOption_editPrice(Integer.parseInt(request.getParameter("option_price" + i)));

			result2 = this.optionDao.updateOption(odto);
		}

		// 옵션을 추가했을 때 발생
		if (Qtt > optionCount) {
			for (int i = (optionCount + 1); i <= Qtt; i++) {
				odto.setOption_name(request.getParameter("option_name" + i));
				odto.setOption_price(Integer.parseInt(request.getParameter("option_price" + i)));

				result2 = this.optionDao.insertOption(odto);
			}
		}

		PrintWriter out = response.getWriter();

		if (result == 1 && result2 == 1) {
			out.println("<script>");
			out.println("alert('수정 성공!')");
			out.println("location.href='hostMyFrip.do'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('수정 실패!')");
			out.println("history.back()");
			out.println("</script>");
		}

	}

	@RequestMapping("entercheck.do")
	public String entercheck(HttpServletRequest request) {
		int booking_num = Integer.parseInt(request.getParameter("booking_num"));
		int page = Integer.parseInt(request.getParameter("page"));
		int class_num = Integer.parseInt(request.getParameter("class_num"));

		this.bookingDao.entercheck(booking_num);

		return "redirect:hostAttendance_member.do?class_num=" + class_num + "&page=" + page;
	}

	@RequestMapping("entercancel.do")
	public String entercancel(HttpServletRequest request) {
		int booking_num = Integer.parseInt(request.getParameter("booking_num"));
		int page = Integer.parseInt(request.getParameter("page"));
		int class_num = Integer.parseInt(request.getParameter("class_num"));
		this.bookingDao.entercancel(booking_num);

		return "redirect:hostAttendance_member.do?class_num=" + class_num + "&page=" + page;
	}

	@RequestMapping("searchAsk.do")
	public String searchAsk(HttpServletRequest request, Model model) {
		int mem_num = getMem_num(request);

		int totalRecord = 0;
		int rowsize = 10;
		int page = 0; // 현재 페이지 변수

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		} else {
			page = 1; // 처음으로 "게시물 전체 목록" 태그를 클릭한 경우
		}
		HashMap<String, Object> map = new HashMap<String, Object>();

		// 받아온 값
		String field = request.getParameter("search_field");
		String name = request.getParameter("search_name");

		map.put("name", name);
		map.put("mem_num", mem_num);

		if (field.equals("mem_name")) {
			// DB 상의 전체 게시물의 수를 확인하는 작업.
			totalRecord = this.class_qnaDao.getNameSearchCount(map);
			PageDTO dto = new PageDTO(page, rowsize, totalRecord, 3);
			map.put("dto", dto);

			List<Class_qnaDTO> qnaList = this.class_qnaDao.getNamesearchList(map);
			model.addAttribute("qList", qnaList);
			model.addAttribute("Paging", dto);
		} else {
			// DB 상의 전체 게시물의 수를 확인하는 작업.
			totalRecord = this.class_qnaDao.getTitleSearchCount(map);
			PageDTO dto = new PageDTO(page, rowsize, totalRecord, 3);
			map.put("dto", dto);

			List<Class_qnaDTO> qnaList = this.class_qnaDao.getTitlesearchList(map);
			model.addAttribute("qList", qnaList);
			model.addAttribute("Paging", dto);
			model.addAttribute("field", field);
			model.addAttribute("name", name);
			
		}
		return "host/hostAsk";
	}

	@RequestMapping("searchComAsk.do")
	public String CsearchAsk(HttpServletRequest request, Model model) {
		int mem_num = getMem_num(request);

		int totalRecord = 0;
		int rowsize = 10;
		int page = 0; // 현재 페이지 변수

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		} else {
			page = 1; // 처음으로 "게시물 전체 목록" 태그를 클릭한 경우
		}
		HashMap<String, Object> map = new HashMap<String, Object>();

		// 받아온 값
		String field = request.getParameter("search_field");
		String name = request.getParameter("search_name");

		map.put("name", name);
		map.put("mem_num", mem_num);

		if (field.equals("mem_name")) {
			// DB 상의 전체 게시물의 수를 확인하는 작업.
			totalRecord = this.class_qnaDao.CgetNameSearchCount(map);
			PageDTO dto = new PageDTO(page, rowsize, totalRecord, 3);
			map.put("dto", dto);

			List<Class_qnaDTO> qnaList = this.class_qnaDao.CgetNamesearchList(map);
			model.addAttribute("qList", qnaList);
			model.addAttribute("Paging", dto);
		} else {
			// DB 상의 전체 게시물의 수를 확인하는 작업.
			totalRecord = this.class_qnaDao.CgetTitleSearchCount(map);
			PageDTO dto = new PageDTO(page, rowsize, totalRecord, 3);
			map.put("dto", dto);

			List<Class_qnaDTO> qnaList = this.class_qnaDao.CgetTitlesearchList(map);
			model.addAttribute("qList", qnaList);
			model.addAttribute("Paging", dto);
			model.addAttribute("field", field);
			model.addAttribute("name", name);
		}
		return "host/hostAskComplete";
	}

	public int getMem_num(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int mem_num = 0;
		
		if(session.getAttribute("loginDto") != null) {
			MemberDTO dto = (MemberDTO)session.getAttribute("loginDto");
			mem_num= dto.getMem_num();
		}
		
		return mem_num;
	}


	// 선택 카테고리 전체 리스트
	@RequestMapping("category_all_list.do")
	public String category_all_list(@RequestParam("num") int category_num, Model model) {
		
		model.addAttribute("category_num", category_num);
		
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
		
		model.addAttribute("category_num", category_num);
		
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
	public String category_more_all_list(@RequestParam("num") int category_num, @RequestParam("title1") String title1,
			@RequestParam("title2") String title2, Model model) {

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
	public String category_more_list(@RequestParam("num") int category_num, @RequestParam("title1") String title1,
			@RequestParam("title2") String title2, Model model) {

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
	public String category_more_bestlist(@RequestParam("num") int category_num, @RequestParam("title1") String title1,
			@RequestParam("title2") String title2, Model model) {

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
	public String category_more_weeklist(@RequestParam("num") int category_num, @RequestParam("title1") String title1,
			@RequestParam("title2") String title2, Model model) {

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
	public String category_more_newlist(@RequestParam("num") int category_num, @RequestParam("title1") String title1,
			@RequestParam("title2") String title2, Model model) {

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

	@RequestMapping("frip_content.do")
	public String frip_content(@RequestParam("num") int class_num,
			@RequestParam("memnum") int class_memnum, @RequestParam("cate_num") int category_num, Model model, HttpServletRequest request) {
		
		int mem_num = 0;
		HttpSession session = request.getSession();
		
		if(session.getAttribute("loginDto") != null) {
			MemberDTO dto = (MemberDTO)session.getAttribute("loginDto");
			mem_num= dto.getMem_num();
		}
		
		List<ClassDTO> likeList = this.likeDao.getLikeClassList(mem_num);
		List<ClassDTO> nolikeList = this.likeDao.getNoLikeClassList(mem_num);
		
		model.addAttribute("likeList", likeList);
		model.addAttribute("nolikeList", nolikeList);
		
		// 프립 리뷰 평점 평균 / 리뷰 갯수
		ReviewDTO reviewInfo = this.reviewDao.reviewInfo(class_num);
		// 최고평점 비율(%)
		int reviewPercent = this.reviewDao.reviewPercent(class_num);
		
		model.addAttribute("reviewInfo", reviewInfo);
		model.addAttribute("reviewPercent", reviewPercent);
		
		// 프립 상세 내용 호출 메서드
		ClassDTO fripInfo = this.classDao.getclassCont(class_num);

		model.addAttribute("fripInfo", fripInfo);

		// 호스트 상세정보 가져오는 메서드
		MemberDTO hostInfo = this.likeDao.hostInfo(class_memnum);
		// 호스트 소개 가져오는 메서드
		HostDTO hostCont = this.likeDao.hostCont(class_memnum);
		// 호스트가 운영하는 클래스 개수 가져오는 메서드
		int classCount = this.likeDao.class_count(class_memnum);
		// 호스트 후기 개수 가져오는 메서드
		int reviewCount = this.likeDao.review_count(class_memnum);
		// 호스트 찜 개수 가져오는 메서드
		int likeCount = this.likeDao.like_count(class_memnum);

		model.addAttribute("hostInfo", hostInfo);
		model.addAttribute("hostCont", hostCont);
		model.addAttribute("classCount", classCount);
		model.addAttribute("reviewCount", reviewCount);
		model.addAttribute("likeCount", likeCount);
		
		// 프립후기 리스트를 가져오는 메서드
		List<ReviewDTO> reviewList = this.reviewDao.getReviewList(class_num);
		
		model.addAttribute("ReviewList", reviewList);
		
		// 인기 프립 리스트 가져오기
		List<ClassDTO> bestclassallList = this.classDao.getBestClassAllList(category_num);
				
		model.addAttribute("BestAllList", bestclassallList);
		
		List<Class_qnaDTO> classQnaList = this.class_qnaDao.getclassQnaList(class_num);
		
		model.addAttribute("ClassQnaList", classQnaList);
		
		
		return "frip_content";
	}

	@RequestMapping("frip_review.do")
	public String fripReview(@RequestParam("classNo") int class_num, Model model, HttpServletRequest request) {
		
		int mem_num = 0;
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("loginDto") != null) {
			MemberDTO dto = (MemberDTO) session.getAttribute("loginDto");
			mem_num = dto.getMem_num();
		}
		
		// 프립 리뷰 평점 평균 / 리뷰 갯수
		ReviewDTO reviewInfo = this.reviewDao.reviewInfo(class_num);
		// 최고평점 비율(%)
		int reviewPercent = this.reviewDao.reviewPercent(class_num);
		// 프립후기 리스트를 가져오는 메서드
		List<ReviewDTO> reviewList = this.reviewDao.getReviewList(class_num);
		// 호스트가 운영하는 클래스 모든 리뷰 가져오는 메서드2 (클래스명/시작날짜/끝날짜)
		List<ReviewDTO> classReview = this.reviewDao.class_reviewList(class_num);
		// 호스트가 운영하는 클래스 모든 리뷰 가져오는 메서드3 (옵션명)
		List<ReviewDTO> classReview2 = this.reviewDao.class_reviewList2(class_num);

		
		// 로그인 상태이면 좋아요 누른 리뷰번호 리스트 넘기기 
		if(mem_num > 0) { 
			 
		  HashMap<String, Integer> map = new HashMap<String, Integer>(); 
		  map.put("mem_num", mem_num); // 로그인한 멤버 번호 
		  map.put("class_num", class_num); // 클래스 번호
	  
		  List<Integer> like_list = this.reviewDao.reviewLike_list(map);
		  
		  model.addAttribute("like_list", like_list); 
		}
		 	
		model.addAttribute("reviewInfo", reviewInfo);
		model.addAttribute("reviewPercent", reviewPercent);
		model.addAttribute("ReviewList", reviewList);
		model.addAttribute("classReview", classReview);
		model.addAttribute("classReview2", classReview2);

		return "frip_review";
	}
	
	// 클래스 상세페이지 - 리뷰 좋아요 매핑
	@RequestMapping(value = "/class_like_status.do", method = RequestMethod.POST)
	@ResponseBody
	public void classLike_Status(HttpServletResponse response, @RequestParam("reviewNum") int reviewNum,
			HttpServletRequest request) throws IOException {

		response.setContentType("text/html; charset=UTF-8");

		// 세션값 가져오기
		HttpSession session = request.getSession();
		MemberDTO dto = (MemberDTO) session.getAttribute("loginDto");

		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("like_writer", dto.getMem_num()); // 로그인한 멤버 번호
		map.put("like_target", reviewNum); // 좋아요 누른 리뷰 번호

		// 해당 리뷰에 대한 좋아요 상태 체크하는 메서드 (0: 안 누른 상태 / 1: 누른 상태)
		int like_status = this.likeDao.review_status(map);

		int state = 0;
		int likeCount = 0;

		if (like_status > 0) { // 좋아요 누른 상태

			// 리뷰 좋아요 취소 (-1)
			int like_minus = this.likeDao.review_like_minus(reviewNum);

			// 좋아요 DB 삭제
			this.likeDao.review_like_del(map);

			// 리뷰 좋아요 개수 가져오는 메서드
			int like_count = this.likeDao.review_like_count(reviewNum);

			if (like_minus > 0) {
				state = 1;
				likeCount = like_count;
			}

		} else if (like_status == 0) { // 좋아요 안 누른 상태

			// 리뷰 좋아요 (+1)
			int like_plus = this.likeDao.review_like_plus(reviewNum);

			// 좋아요 DB 추가
			this.likeDao.review_like_add(map);

			// 리뷰 좋아요 개수 가져오는 메서드
			int like_count = this.likeDao.review_like_count(reviewNum);

			if (like_plus > 0) {
				state = 2;
				likeCount = like_count;
			}
		}

		JSONObject obj = new JSONObject();
		obj.put("state", state);
		obj.put("likeCount", likeCount);

		response.getWriter().print(obj);
	}
	
	
	@RequestMapping(value = "/usePoint", method = RequestMethod.POST)
	@ResponseBody
	public void usePoint(HttpServletResponse response, @RequestParam("havePoint") int havePoint,
			@RequestParam("optionPrice") int optionPrice) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		int state = 0;
		int change = -1;

		JSONObject obj = new JSONObject();

		if (havePoint >= 100) { // 보유 포인트가 100이상일때
			if (havePoint > optionPrice) {
				change = havePoint - optionPrice;
				state = 1;
			} else if (havePoint <= optionPrice) {
				change = optionPrice - havePoint;
				state = 2;
			}
		} else { // 보유 포인트가 100보다 작을때
			state = -1;
		}
		obj.put("state", state);
		obj.put("change", change);

		response.getWriter().print(obj);
	}

	@RequestMapping("frip_all.do")
	public String fripAll(Model model, @RequestParam("type") String type) {
		String title = null;
		List<ClassDTO> list = new ArrayList<ClassDTO>();
		
		if(type.equals("best")) {
			title = "이번주 PICK💖";
			list = this.classDao.getBestListAll();
			
		} else if(type.equals("new")) {
			title = "신규 등록💖";
			list = this.classDao.getNewListAll();
			
		} else if(type.equals("sale")) {
			title = "특가 할인💖";
			list = this.classDao.getSaleListAll();
		}
		
		model.addAttribute("type", type);
		model.addAttribute("list", list);
		model.addAttribute("title", title);
		
		return "frip_all";
	}
	
	@RequestMapping("hostUpdateMem.do")
	public String hostUpdateMem(HttpServletRequest request, Model model) {
		int mem_num = getMem_num(request);
		HostDTO dto = this.hostDao.getInfo_memnum(mem_num);
		
		model.addAttribute("dto", dto);
		
		return "host/hostUpdateMem";
	}
	
	@RequestMapping("hostUpdateMemOk.do")
	public String hostUpdateMemOk(HostDTO hdto, MemberDTO mdto,
									HttpServletRequest request) {
		int mem_num = getMem_num(request);
		hdto.setHost_memNum(mem_num);
		mdto.setMem_num(mem_num);
		
		int result = this.memberDao.updateInfo(mdto);
		int result2 =this.hostDao.updateHostInfo(hdto);
		
		return "redirect:hostMain.do";
	}
	@RequestMapping("search.do")
	public String search(HttpServletRequest request, Model model) {
		String search_input = request.getParameter("search_input");
		
		HttpSession session = request.getSession();
		int mem_num = 0;
		if(session.getAttribute("loginDto") != null) {
			MemberDTO dto = (MemberDTO)session.getAttribute("loginDto");
			mem_num= dto.getMem_num();
		}
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int totalRecord = 0;
		int rowsize = 10;
		int page = 0; // 현재 페이지 변수

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		} else {
			page = 1; // 처음으로 "게시물 전체 목록" 태그를 클릭한 경우
		}

		// DB 상의 전체 게시물의 수를 확인하는 작업.
		totalRecord = this.classDao.getSearchListCount(search_input);

		PageDTO dto = new PageDTO(page, rowsize, totalRecord, 3);
		
		map.put("search_input", search_input);
		map.put("dto", dto);
		List<ClassDTO> cList = this.classDao.getSearchClassList(map);
		List<ClassDTO> likeList = this.likeDao.getLikeClassList(mem_num);
		List<ClassDTO> nolikeList = this.likeDao.getNoLikeClassList(mem_num);
		
		model.addAttribute("likeList", likeList);
		model.addAttribute("nolikeList", nolikeList);
		model.addAttribute("cList", cList);
		model.addAttribute("Paging", dto);
		model.addAttribute("search_input", search_input);
		
		return "searchAll";
	}
	
	@RequestMapping(value = "/class_like_list.do", method = RequestMethod.POST)
    @ResponseBody
    public void checkLikeList(HttpServletResponse response, HttpServletRequest request) throws IOException {
        int mem_num = getMem_num(request);

        List<LikeDTO> like_list = this.reviewDao.getTarget(mem_num);

        JSONObject obj = new JSONObject();

        JSONArray ja = JSONArray.fromObject(like_list);

        obj.put("clist", ja);

        response.getWriter().print(obj);
    }
	
	
	
	// 프립 좋아요 매핑
	@RequestMapping(value = "/classlike_status.do", method = RequestMethod.POST)
	@ResponseBody
	public void classlikeStatus(HttpServletResponse response, @RequestParam("class_num") int class_num,
			HttpServletRequest request) throws IOException {

		response.setContentType("text/html; charset=UTF-8");

		// 세션값 가져오기
		HttpSession session = request.getSession();
		MemberDTO dto = (MemberDTO) session.getAttribute("loginDto");

		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("like_writer", dto.getMem_num()); // 로그인한 멤버 번호
		map.put("like_target", class_num); // 좋아요 누른 프립 번호

		// 해당 프립에 대한 좋아요 상태 체크하는 메서드 (0: 안 누른 상태 / 1: 누른 상태)
		int like_status = this.likeDao.class_status(map);

		int state = 0;

		if (like_status > 0) { // 좋아요 누른 상태

			// 좋아요 DB 삭제
			this.likeDao.class_like_del(map);
			state = 1;

		} else if (like_status == 0) { // 좋아요 안 누른 상태

			// 좋아요 DB 추가
			this.likeDao.class_like_add(map);
			state = 2;
		}

		JSONObject obj = new JSONObject();
		obj.put("state", state);

		response.getWriter().print(obj);
	}
	
	
	// 호스트 좋아요 매핑
	@RequestMapping(value = "/hostlike_status.do", method = RequestMethod.POST)
	@ResponseBody
	public void hostlikeStatus(HttpServletResponse response, @RequestParam("host_num") int host_num,
			HttpServletRequest request) throws IOException {

		response.setContentType("text/html; charset=UTF-8");

		// 세션값 가져오기
		HttpSession session = request.getSession();
		MemberDTO dto = (MemberDTO) session.getAttribute("loginDto");

		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("like_writer", dto.getMem_num()); // 로그인한 멤버 번호
		map.put("like_target", host_num); // 좋아요 누른 호스트 번호

		// 해당 프립에 대한 좋아요 상태 체크하는 메서드 (0: 안 누른 상태 / 1: 누른 상태)
		int like_status = this.likeDao.host_status(map);

		int state = 0;

		if (like_status > 0) { // 좋아요 누른 상태

			// 좋아요 DB 삭제
			this.likeDao.host_like_del(map);
			state = 1;

		} else if (like_status == 0) { // 좋아요 안 누른 상태

			// 좋아요 DB 추가
			this.likeDao.host_like_add(map);
			state = 2;
		}

		JSONObject obj = new JSONObject();
		obj.put("state", state);

		response.getWriter().print(obj);
	}
	
}
