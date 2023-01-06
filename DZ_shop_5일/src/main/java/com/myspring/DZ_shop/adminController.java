package com.myspring.DZ_shop;

import java.io.*;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myspring.DZ_shop.entity.QnAVO;
import com.myspring.DZ_shop.service.AdminService;
import com.myspring.DZ_shop.service.MailService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class adminController {

	private static final Logger logger = LoggerFactory.getLogger(adminController.class);

	@Autowired
	AdminService adminService;

	@RequestMapping(value = "/admin/adminhome.do", method = RequestMethod.GET)
	public String adminhome(Locale locale, Model model) {

		return "/admin/adminPage_home";
	}

	@RequestMapping(value = "/admin/admin_member.do", method = RequestMethod.GET)
	public String member(Model model) throws Exception {
		logger.info("어드민 멤버 확인");
		model.addAttribute("list", adminService.listMembers());

		return "/admin/admin_member";
	}

	@RequestMapping(value = "/admin/memberDelete.do", method = RequestMethod.GET)
	public String memberDelete(Model model, @RequestParam(value = "id", required = true) String MEMBER_ID)
			throws Exception {
		logger.info("어드민 멤버 확인 : " + MEMBER_ID);
		adminService.memberDelete(MEMBER_ID);

		return "redirect:/admin/admin_member.do";
	}

	@RequestMapping(value = "/admin/admin_notice.do", method = RequestMethod.GET)
	public String notice(Locale locale, Model model) {
		logger.info("어드민 공지 확인 ");
		model.addAttribute("notice", adminService.noticeAll());

		return "/admin/admin_notice";
	}

	@RequestMapping(value = "/admin/admin_noticeRegisterForm.do", method = RequestMethod.GET)
	public String noticeRegisterForm(Locale locale, Model model) {
		logger.info("어드민 공지 생성 ");
		Date date = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);
		return "/admin/admin_noticeRegisterForm";
	}

	@RequestMapping(value = "/admin/admin_noticeRegister.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> noticeRegister(Model model, @RequestBody HashMap<String, String> map,
			HttpSession session) throws IOException {
		Map<String, Object> result = new HashMap();
		Date date = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		String formattedDate = dateFormat.format(date);
		logger.info("어드민 공지 생성 ");
		logger.info("제목 : " + map.get("title") + " 내용 : " + map.get("contents") + " 날짜 :" + formattedDate);
		try {
			adminService.noticeRegister(map.get("title"), map.get("contents"), formattedDate);
			result.put("status", true);
			result.put("url", "/DZ_shop/admin/admin_notice.do");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("status", false);
		}
		return result;
	}

	@RequestMapping(value = "/admin/admin_noticeView.do", method = RequestMethod.GET)
	public String noticeView(Locale locale, Model model, @RequestParam(value = "title", required = true) String title) {
		logger.info("어드민 공지 세부확인 ");
		model.addAttribute("notice", adminService.noticeView(title));

		return "/admin/admin_noticeView";
	}

	@RequestMapping(value = "/admin/noticeFix.do", method = RequestMethod.GET)
	public String noticeFix(Model model, @RequestParam(value = "title", required = true) String title)
			throws Exception {
		logger.info("어드민 공지 수정");
		model.addAttribute("notice", adminService.noticeView(title));

		return "/admin/admin_noticeFix";
	}

	@RequestMapping(value = "/admin/noticeUpdate.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> noticeUpdate(Model model, @RequestBody HashMap<String, String> map, HttpSession session)
			throws IOException {
		Map<String, Object> result = new HashMap();
		logger.info("어드민 공지 수정");
		logger.info("map->" + map);
		try {
			adminService.noticeUpdate(map.get("title"), map.get("contents"));
			result.put("status", true);
			result.put("url", "/DZ_shop/admin/admin_noticeView.do?title=" + map.get("title"));
		} catch (Exception e) {
			e.printStackTrace();
			result.put("status", false);
		}
		return result;
	}

	@RequestMapping(value = "/admin/deleteNotice.do", method = RequestMethod.GET)
	public String deleteNotice(Locale locale, Model model, HttpSession session,
			@RequestParam(value = "title", required = true) String title) {
		logger.info("어드민 공지 삭제 ");
		adminService.noticeDelete(title);

		return "redirect:/admin/admin_notice.do";
	}

	@RequestMapping(value = "/admin/admin_post", method = RequestMethod.GET)
	public String post(Locale locale, Model model) {
		return "/admin/admin_post";
	}

	@RequestMapping(value = "/admin/admin_QnAList.do", method = RequestMethod.GET)
	public String QnA(Locale locale, Model model) {
		logger.info("QnA 확인");
		model.addAttribute("qnaList", adminService.QnAAll());

		return "/admin/admin_QnAList";
	}

	@RequestMapping(value = "/admin/admin_QnAView.do", method = RequestMethod.GET)
	public String QnAView(Locale locale, Model model, HttpServletResponse response,
			@RequestParam(value = "title") String title) throws Exception{
		logger.info("QnA 세부 확인");
		QnAVO qnavo = adminService.QnAView(title);
		
		if(qnavo.getQnA_Image() !=null) {
			
			response.setHeader("Cache-Control", "no-cache");
			//response.addHeader("Content-disposition", "attachment; fileName=" + qnavo.getQnA_Image());
			
			BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());
			
			BufferedInputStream in = new BufferedInputStream(
					new FileInputStream("c:\\upload\\" + qnavo.getQnA_Image()));
			
			  byte[] data = new byte[4096]; 
			  int count = 0; 
			  while (true) { 
				  count = in.read(data); 
				  if (count <= 0) 
					  break; 
				  out.write(data); 
			  }
			 
			out.close();
			in.close();
		}
		model.addAttribute("qna", qnavo);
		
		return "/admin/admin_QnAView";
	}

	@Autowired
	MailService mailService;

	@RequestMapping(value = "/admin/reply.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> reply(Model model, HttpServletResponse response,
			@RequestBody HashMap<String, String> map, HttpSession session)
			throws IOException {
		Map<String, Object> result = new HashMap();
		logger.info("답변");
		logger.info("map->" + map);
		try {
			StringBuilder str = new StringBuilder();
			str.append(map.get("contents"));
			String htmlStr = str.toString();
			 
			mailService.sendMail("lmacrown@naver.com", map.get("title"), htmlStr);
			result.put("status", true);
			result.put("url", "/DZ_shop/admin/admin_QnAList.do");
			
		}catch(Exception e) {
			e.printStackTrace();	
			result.put("status", false);
		}
//		PrintWriter out = response.getWriter();
//		out.println("send Mail");
		return result;
	}
}
