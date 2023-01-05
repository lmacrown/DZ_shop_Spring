package com.myspring.DZ_shop;

import java.util.Locale;

import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.myspring.DZ_shop.entity.NoticeVO;
import com.myspring.DZ_shop.service.AdminService;

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
	public String memberDelete(Model model,
			@RequestParam(value="id", required = true) String MEMBER_ID) throws Exception {
		logger.info("어드민 멤버 확인 : "+MEMBER_ID);
		adminService.memberDelete(MEMBER_ID);
		
		return "redirect:/admin/admin_member.do";
	}
	
	@RequestMapping(value = "/admin/admin_notice.do", method = RequestMethod.GET)
	public String notice(Locale locale, Model model) {
		logger.info("어드민 공지 확인 ");
		model.addAttribute("notice",adminService.noticeAll());

		return "/admin/admin_notice";
	}
	@RequestMapping(value = "/admin/admin_noticeView.do", method = RequestMethod.GET)
	public String noticeView(Locale locale, Model model,
			@RequestParam(value = "title", required = true) String title) {
		logger.info("어드민 공지 세부확인 ");
		model.addAttribute("notice",adminService.noticeView(title));

		return "/admin/admin_noticeView";
	}
	@RequestMapping(value = "/admin/deleteNotice.do", method = RequestMethod.GET)
	public String deleteNotice(Locale locale, Model model, HttpSession session,
			@RequestParam(value = "title", required = true) String title) {
		logger.info("어드민 공지 삭제 ");
		
//		NoticeVO noticeVo = (NoticeVO)session.getAttribute("notice");
//		logger.info("제목 : "+noticeVo.getTitle());
//		System.out.println("제목 : "+noticeVo.getTitle());
		adminService.noticeDelete(title);

		return "redirect:/admin/admin_notice.do";
	}
	@RequestMapping(value = "/admin/admin_post", method = RequestMethod.GET)
	public String post(Locale locale, Model model) {
		return "/admin/admin_post";
	}
	@RequestMapping(value = "/admin/admin_QnA.do", method = RequestMethod.GET)
	public String QnA(Locale locale, Model model) {
		return "/admin/admin_QnA";
	}
	
}
