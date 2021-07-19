package com.market.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.market.model.MemberDAO;
import com.market.model.MemberDTO;
import com.market.model.NoticeDAO;
import com.market.model.NoticeDTO;
import com.market.model.OptionDAO;
import com.market.model.OptionDTO;
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
	public String hostMain(Model model) {
		
		List<NoticeDTO> NList = this.noticeDao.getNoticeList();

		model.addAttribute("NList", NList);

		return "host/hostMain";
	}

	@RequestMapping("hostMakeFrip.do")
	public String hostMakeFrip(Model model) {
		
		List<CategoryDTO> cateList = this.categoryDao.getCate_oneList();
		
		model.addAttribute("cateList",cateList);
		
		return "host/hostMakeFrip";
	}
	
	@RequestMapping(value="/cate_two.do" ,method=RequestMethod.POST)
	@ResponseBody
	public void cate_two(HttpServletResponse response,@RequestParam("cate_one") String cate_one) throws IOException {
	
		List<CategoryDTO> cate_twoList = this.categoryDao.getCate_two(cate_one);
		
		JSONObject obj = new JSONObject();
		
		JSONArray ja = JSONArray.fromObject(cate_twoList);

		obj.put("clist", ja);
		
		response.getWriter().print(obj);

	}
	
	@RequestMapping(value="/uploadSummernoteImageFile", produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request )  {
		JsonObject jsonObject = new JsonObject();
	
		String fileRoot = "C:\\Users\\kmsol\\git\\SpringProject\\SpringProject\\src\\main\\webapp\\resources\\summernote\\FileUpload\\";
		
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		
		File targetFile = new File(fileRoot + savedFileName);	
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			jsonObject.addProperty("url", "/controller/resources/summernote/FileUpload/"+savedFileName); 
			jsonObject.addProperty("responseCode", "success");
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		String a = jsonObject.toString();
		return a;
	}
	
	@RequestMapping("insertFrip.do")
	public String insertFrip(ClassDTO dto, OptionDTO odto, MultipartHttpServletRequest mRequest,
				@RequestParam("optionQtt")int Qtt,HttpServletRequest request) throws Exception {
		// 파일 업로드 처리
		dto.setClass_image(upload.fileUpload(mRequest)); 
		
		int result = this.classDao.insertClass(dto);
		System.out.println("cont "+ dto.getClass_cont());
		for(int i=1; i<=Qtt; i++) {
			odto.setOption_name(request.getParameter("option_name"+i));
			odto.setOption_price(Integer.parseInt(request.getParameter("option_price"+i)));
			System.out.println(odto.getOption_name());
			System.out.println(odto.getOption_price());
			int result2 = this.optionDao.insertOption(odto);
			if(result2==1) {
				continue;
			}else {
				System.out.println("오류");
				break;
			}
		}
		
	return "host/insertFrip";
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
