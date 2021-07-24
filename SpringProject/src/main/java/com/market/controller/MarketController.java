package com.market.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
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
import com.market.model.CategoryDAO;
import com.market.model.CategoryDTO;
import com.market.model.ClassDAO;
import com.market.model.ClassDTO;
import com.market.model.HostDTO;
import com.market.model.LikeDAO;
import com.market.model.MemberDAO;
import com.market.model.MemberDTO;
import com.market.model.NoticeDAO;
import com.market.model.NoticeDTO;
import com.market.model.OptionDAO;
import com.market.model.OptionDTO;
import com.market.model.PageDTO;
import com.market.model.QnaDAO;
import com.market.model.QnaDTO;
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

	@RequestMapping("like_frip.do")
	public String likeFrip(HttpServletRequest request, Model model) {

		// 세션값 가져오기
		HttpSession session = request.getSession();
		MemberDTO dto = (MemberDTO) session.getAttribute("loginDto");

		System.out.println("로그인 세션 mem_num 값 확인 >>> " + dto.getMem_num());
		
		/*
		 * // 페이징 처리 int totalRecord = 0; int rowsize = 5; int page = 0; // 현재 페이지 변수
		 * 
		 * if (request.getParameter("page") != null) { page =
		 * Integer.parseInt(request.getParameter("page")); } else { page = 1; // 처음으로
		 * "게시물 전체 목록" 태그를 클릭한 경우 }
		 * 
		 * // DB 상의 전체 게시물의 수를 확인하는 작업. totalRecord =
		 * this.likeDao.classList_count(dto.getMem_num());
		 * 
		 * PageDTO dtoP = new PageDTO(page, rowsize, totalRecord, 3);
		 * 
		 * // 페이지에 해당하는 게시물을 가져오는 메서드 호출 // List<QnaDTO> pageList =
		 * this.qnaDao.getQnaList(dto);
		 * 
		 * HashMap<String, Object> map = new HashMap<String, Object>() ;
		 * map.put("class_memNum", dto.getMem_num()); map.put("pageDto", dtoP);
		 */

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

		// 호스트가 운영하는 클래스 모든 리뷰 가져오는 메서드2 (클래스명)
		List<ReviewDTO> classReview2 = this.likeDao.class_review2(host_memNum);

		// 호스트가 운영하는 클래스 모든 리뷰 가져오는 메서드3 (옵션명/시작날짜/끝날짜)
		List<ReviewDTO> classReview3 = this.likeDao.class_review3(host_memNum);

		
		HashMap<String, Integer> map = new HashMap<String, Integer>() ;
		map.put("mem_num", dto.getMem_num());			// 로그인한 멤버 번호
		map.put("host_memNum", host_memNum);			// 호스트 번호
		
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

	/*
	 * // 페이지 로딩시 댓글 좋아요 눌러놨던 게시물에 좋아요 표시
	 * 
	 * @RequestMapping(value = "/like_status_before.do", method =
	 * RequestMethod.POST)
	 * 
	 * @ResponseBody public void likeStatus_before(HttpServletResponse
	 * response, @RequestParam("reviewNum") int reviewNum, HttpServletRequest
	 * request) throws IOException {
	 * 
	 * response.setContentType("text/html; charset=UTF-8");
	 * 
	 * // 세션값 가져오기 HttpSession session = request.getSession(); MemberDTO dto =
	 * (MemberDTO) session.getAttribute("loginDto");
	 * 
	 * HashMap<String, Integer> map = new HashMap<String, Integer>() ;
	 * map.put("like_writer", dto.getMem_num()); // 로그인한 멤버 번호
	 * map.put("like_target", reviewNum); // 좋아요 누른 리뷰 번호
	 * 
	 * System.out.println("멤버 번호1 즉시실행 >>> " + dto.getMem_num());
	 * System.out.println("리뷰 번호1 즉시실행>>> " + reviewNum);
	 * 
	 * // 해당 리뷰에 대한 좋아요 상태 체크하는 메서드 (0: 안 누른 상태 / 1: 누른 상태) int like_status =
	 * this.likeDao.review_status(map); System.out.println("리뷰 좋아요 상태입니다 즉시실행 >>> "
	 * + like_status);
	 * 
	 * int state = 0; int likeCount = 0;
	 * 
	 * if(like_status > 0) { // 좋아요 누른 상태
	 * 
	 * System.out.println("멤버 번호2 즉시실행 >>> " + dto.getMem_num());
	 * System.out.println("리뷰 번호2 즉시실행  >>> " + reviewNum);
	 * 
	 * // 리뷰 좋아요 개수 가져오는 메서드 int like_count =
	 * this.likeDao.review_like_count(reviewNum);
	 * 
	 * state = 2; likeCount = like_count;
	 * 
	 * } else if(like_status == 0) { // 좋아요 안 누른 상태
	 * 
	 * System.out.println("멤버 번호3 즉시실행 >>> " + dto.getMem_num());
	 * System.out.println("리뷰 번호3 즉시실행 >>> " + reviewNum);
	 * 
	 * // 리뷰 좋아요 개수 가져오는 메서드 int like_count =
	 * this.likeDao.review_like_count(reviewNum);
	 * 
	 * state = 1; likeCount = like_count; }
	 * 
	 * JSONObject obj = new JSONObject(); obj.put("state", state);
	 * obj.put("likeCount", likeCount);
	 * 
	 * response.getWriter().print(obj); }
	 */
	
	// 댓글 좋아요 매핑
	@RequestMapping(value = "/like_status.do", method = RequestMethod.POST)
	@ResponseBody
	public void likeStatus(HttpServletResponse response, @RequestParam("reviewNum") int reviewNum, HttpServletRequest request) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");

		// 세션값 가져오기
		HttpSession session = request.getSession();
		MemberDTO dto = (MemberDTO) session.getAttribute("loginDto");
		
		HashMap<String, Integer> map = new HashMap<String, Integer>() ;
		map.put("like_writer", dto.getMem_num());	// 로그인한 멤버 번호
		map.put("like_target", reviewNum);			// 좋아요 누른 리뷰 번호
		
		System.out.println("멤버 번호1 >>> " + dto.getMem_num());
		System.out.println("리뷰 번호1 >>> " + reviewNum);

		// 해당 리뷰에 대한 좋아요 상태 체크하는 메서드 (0: 안 누른 상태 / 1: 누른 상태)
		int like_status = this.likeDao.review_status(map);
		System.out.println("리뷰 좋아요 상태입니다 >>> " + like_status);

		int state = 0;
		int likeCount = 0;
		
		if(like_status > 0) {	// 좋아요 누른 상태
			
			System.out.println("멤버 번호2 >>> " + dto.getMem_num());
			System.out.println("리뷰 번호2 >>> " + reviewNum);
			
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
			
		} else if(like_status == 0) { // 좋아요 안 누른 상태
			
			System.out.println("멤버 번호3 >>> " + dto.getMem_num());
			System.out.println("리뷰 번호3 >>> " + reviewNum);
			
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
	public String hostMain(Model model) {

		List<NoticeDTO> NList = this.noticeDao.getHostNoticeList();

		model.addAttribute("NList", NList);

		return "host/hostMain";
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

	@RequestMapping(value = "/uploadSummernoteImageFile", produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile,
			HttpServletRequest request) {
		JsonObject jsonObject = new JsonObject();

		String fileRoot = "C:\\Users\\SOS\\git\\SpringProject\\SpringProject\\src\\main\\webapp\\resources\\upload\\";

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

		dto.setClass_image(upload.fileUpload(mRequest));

		if (request.getParameter("startArea") == null) {
			dto.setClass_startArea("null");
		}
		if (dto.getClass_endDate() == null) { // 끝나는 날이 없으면 공백값
			dto.setClass_endDate("null");
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
			out.println("location.href='hostMain.do'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('등록 실패!')");
			out.println("history.back()");
			out.println("</script>");
		}

	}

	@RequestMapping(value = "/hostClassList.do", method = RequestMethod.POST)
	@ResponseBody
	public void hostClassList(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();

		MemberDTO loginDto = (MemberDTO) session.getAttribute("loginDto"); // 로그인정보

		int mem_num = loginDto.getMem_num(); // 로그인 회원 번호
		int class_pass = Integer.parseInt(request.getParameter("class_pass")); // 승인 상태 번호

		HashMap<String, Integer> map = new HashMap<String, Integer>();

		map.put("mem_num", mem_num);
		List<ClassDTO> list = null;
		if (class_pass == 2) {
			class_pass = 1;
			map.put("class_pass", class_pass);
			list = this.classDao.getList_endClass(map);
		} else {
			map.put("class_pass", class_pass);
			list = this.classDao.getList_MemNum(map);
		}

		JSONObject obj = new JSONObject();

		JSONArray ja = JSONArray.fromObject(list);

		obj.put("clist", ja);

		response.getWriter().print(obj);
	}

	@RequestMapping("hostMyFrip.do")
	public String hostMyFrip(HttpServletRequest request, Model model) {

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
	public String hostAsk_answer() {
		return "host/hostAsk_answer";
	}

	@RequestMapping("hostUpdateFrip.do")
	public String hostUpdateFrip(@RequestParam("class_num") int num, Model model) {
		List<ClassDTO> classList = this.classDao.getList_classNum(num);

		List<CategoryDTO> cateList = this.categoryDao.getCate_oneList();

		model.addAttribute("cateList", cateList);
		model.addAttribute("classList", classList);

		return "host/hostUpdateFrip";
	}

	@RequestMapping("frip_content.do")
	public String fripContent() {
		return "frip_content";
	}
}
