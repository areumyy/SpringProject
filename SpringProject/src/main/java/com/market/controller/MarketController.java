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
import com.market.model.BookingDAO;
import com.market.model.BookingDTO;
import com.market.model.CategoryDAO;
import com.market.model.CategoryDTO;
import com.market.model.ClassDAO;
import com.market.model.ClassDTO;
import com.market.model.Class_qnaDAO;
import com.market.model.Class_qnaDTO;
import com.market.model.MemberDAO;
import com.market.model.MemberDTO;
import com.market.model.NoticeDAO;
import com.market.model.NoticeDTO;
import com.market.model.OptionDAO;
import com.market.model.OptionDTO;
import com.market.model.PageDTO;
import com.market.model.QnaDAO;
import com.market.model.QnaDTO;
import com.market.model.Upload;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class MarketController {

	@Autowired
	private MemberDAO memberDao;
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
	private BookingDAO bookingDao;
	@Autowired
	private Class_qnaDAO class_qnaDao;
	
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
	public void emailCheck(HttpServletResponse response, @RequestParam("mem_email") String mem_email) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		String res = null;
		int state = 0;
		
		int result = this.memberDao.checkEmail(mem_email);
		if(result > 0) {
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
		if(result > 0) {
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

		PageDTO dto = new PageDTO(page, rowsize, totalRecord);

		// 페이지에 해당하는 게시물을 가져오는 메서드 호출
		List<QnaDTO> pageList = this.qnaDao.getQnaList(dto);

		model.addAttribute("list", pageList);
		model.addAttribute("Paging", dto);

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
	public String hostMain(Model model) {

		List<NoticeDTO> NList = this.noticeDao.getNoticeList();

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

		String fileRoot = "C:\\Users\\kmsol\\git\\SpringProject\\SpringProject\\src\\main\\webapp\\resources\\summerUpload\\";

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

		
		  if(request.getParameter("startArea") == null) {
			  dto.setClass_startArea("null"); 
			  dto.setClass_startAreaDetail("null"); 
		  } 
		  if(dto.getClass_endDate() == null) { // 끝나는날이 없으면 공백값 
			  dto.setClass_endDate("null"); 
		  }
		 
		  //전체 클래스의 수 + 1구하기
		  int count = this.classDao.countClass();
		  dto.setClass_num(count);
		  odto.setOption_classNum(count);
		  
		  int result = this.classDao.insertClass(dto); 
		 
		  //옵션
		  int result2 = 0;
		  //옵션 개수
		  int Qtt = Integer.parseInt(request.getParameter("optionQtt"));
		  System.out.println(Qtt);
		  for(int i=1; i<=Qtt; i++) {
			  odto.setOption_name(request.getParameter("option_name"+i));
			  odto.setOption_price(Integer.parseInt(request.getParameter("option_price"+i))); 
			  System.out.println(odto);
	
			  result2 = this.optionDao.insertOption(odto); 
		  }
		 
		 PrintWriter out = response.getWriter();
		 if(result == 1 && result2 == 1) {
			out.println("<script>");
			out.println("alert('등록 성공!')");
			out.println("location.href='hostMain.do'");
			out.println("</script>");
		 }else {
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
		if(class_pass == 2) {
			class_pass = 1;
			map.put("class_pass", class_pass);
			list = this.classDao.getList_endClass(map);
		}else {
			map.put("class_pass", class_pass);
			list = this.classDao.getList_MemNum(map);
		}
		JSONObject obj = new JSONObject();

		JSONArray ja = JSONArray.fromObject(list);

		obj.put("clist", ja);

		response.getWriter().print(obj);
	}
	
	@RequestMapping("hostMyFrip.do")
	public String hostMyFrip(HttpServletRequest request, Model model ) {
		
		return "host/hostMyFrip";
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

		PageDTO dto = new PageDTO(page, rowsize, totalRecord);

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
		
		PageDTO dto = new PageDTO(page, rowsize, totalRecord);

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
	public String hostAsk(HttpServletRequest request,Model model) {

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
		
		PageDTO dto = new PageDTO(page, rowsize, totalRecord);

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
		totalRecord = this.class_qnaDao.getCount(mem_num);
		
		PageDTO dto = new PageDTO(page, rowsize, totalRecord);

		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("dto", dto);
		map.put("mem_num", mem_num);
		// 페이지에 해당하는 게시물을 가져오는 메서드 호출
		List<Class_qnaDTO> qnaList = this.class_qnaDao.getQnaCompleteList(map);
		
		model.addAttribute("qList", qnaList);
		model.addAttribute("Paging", dto);
		
		return "host/hostAskComplete";
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
	public String hostAsk_answer(HttpServletRequest request, Model model) {
		
		int qna_num = Integer.parseInt(request.getParameter("qna_num"));
		int page = Integer.parseInt(request.getParameter("page"));
		
		// qna_num으로 상세내역 구하기
		Class_qnaDTO dto =  this.class_qnaDao.getContent(qna_num);
		
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
		int dto =  this.class_qnaDao.insertAnswer(map);
		
		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		
		return "redirect:hostAsk.do?page="+page;
	}
	@RequestMapping("hostAskAnswerUpdate.do")
	public String hostAskAnswerUpdate(HttpServletRequest request, Model model) {
		
		int qna_num = Integer.parseInt(request.getParameter("qna_num"));
		int page = Integer.parseInt(request.getParameter("page"));
		
		// qna_num으로 상세내역 구하기
		Class_qnaDTO dto =  this.class_qnaDao.getContent(qna_num);
		
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
		int dto =  this.class_qnaDao.insertAnswer(map);
		 
		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		
		return "redirect:hostAskComplete.do?page="+page;
	}
		
		
	@RequestMapping("hostUpdateFrip.do")
	public String hostUpdateFrip(@RequestParam("class_num")int num, Model model) {
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

		  //원래 클래스의 정보
		  ClassDTO classList = this.classDao.getList_classNum(dto.getClass_num());
		  
		  //사진을 수정했는지 여부 확인
		  if(dto.getClass_image2().getSize() == 0 ) {
			  dto.setClass_image(classList.getClass_image());
		  }else {
			  dto.setClass_image(upload.fileUpload(mRequest)); // 파일 이름으로 변환		  
		  }
		  
		  if(request.getParameter("startArea") == null) {
			  dto.setClass_startArea("null"); 
			  dto.setClass_startAreaDetail("null"); 
		  } 
		  if(dto.getClass_endDate() == null) { // 끝나는날이 없으면 공백값 
			  dto.setClass_endDate("null"); 
		  }
		 
		  odto.setOption_classNum(dto.getClass_num());
		  System.out.println(dto);
		  int result = this.classDao.UpdateClass(dto); 
		
		  //옵션 삭제후 재생성
		  int maxNum = this.optionDao.getmaxoptionNum(dto.getClass_num());
		  int optionCount = this.optionDao.getcountoption(dto.getClass_num());
		  HashMap<String, Integer> map = new HashMap<String, Integer>();
		  map.put("maxNum", maxNum);
		  map.put("optionCount", optionCount);
		  
		  //옵션 삭제
		  this.optionDao.deleteOption(dto.getClass_num());
		 
		  //옵션 번호가 방금 지운 번호보다 높은 번호를 방금 지운 숫자만큼 삭제
		  this.optionDao.optionNumdown(map);
		  System.out.println(odto);
		  
		  //옵션 
		  int result2 = 0;
		  //옵션 개수
		  int Qtt = Integer.parseInt(request.getParameter("optionQtt"));
		  System.out.println(Qtt);
		  for(int i=1; i<=Qtt; i++) {
			  System.out.println(request.getParameter("option_name"+i));
			  System.out.println(Integer.parseInt(request.getParameter("option_price"+i)));
			  odto.setOption_name(request.getParameter("option_name"+i));
			  odto.setOption_price(Integer.parseInt(request.getParameter("option_price"+i))); 
			  System.out.println(odto.getOption_name());
			  System.out.println(odto.getOption_price());
			  result2 = this.optionDao.insertOption(odto); 
		  } 
		 
		 PrintWriter out = response.getWriter();
		System.out.println(result);
		System.out.println(result2);
		  if(result == 1 && result2 == 1) { 
			  out.println("<script>");
			  out.println("alert('수정 성공!')"); 
			  out.println("location.href='hostMyFrip.do'");
			  out.println("</script>"); 
		  }else { 
			  out.println("<script>");
			  out.println("alert('수정 실패!')"); 
			  out.println("history.back()");
			  out.println("</script>"); 
		  }

	}
	
	@RequestMapping("frip_content.do")
	public String fripContent() {
		return "frip_content";
	}
	
	@RequestMapping("entercheck.do")
	public String entercheck(HttpServletRequest request) {
		int booking_num = Integer.parseInt(request.getParameter("booking_num"));
		int page = Integer.parseInt(request.getParameter("page"));
		int class_num = Integer.parseInt(request.getParameter("class_num"));
		
		this.bookingDao.entercheck(booking_num);
		
		return "redirect:hostAttendance_member.do?class_num="+class_num+"&page="+page;
	}
	
	@RequestMapping("entercancel.do")
	public String entercancel(HttpServletRequest request) {
		int booking_num = Integer.parseInt(request.getParameter("booking_num"));
		int page = Integer.parseInt(request.getParameter("page"));
		int class_num = Integer.parseInt(request.getParameter("class_num"));
		this.bookingDao.entercancel(booking_num);
		
		return "redirect:hostAttendance_member.do?class_num="+class_num+"&page="+page;
	}
	
	public int getMem_num(HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		MemberDTO loginDto = (MemberDTO) session.getAttribute("loginDto"); // 로그인정보
		
		int mem_num = loginDto.getMem_num(); // 로그인 회원 번호
		
		return mem_num;
	}
}
