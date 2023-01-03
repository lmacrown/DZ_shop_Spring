package com.myspring.DZ_shop;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.myspring.DZ_shop.entity.MemberVO;
import com.myspring.DZ_shop.service.MemberService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/member/register.do", method = RequestMethod.GET)
	public String register(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "/member/register";
	}
	@Autowired 
	MemberService memberService;
	
	@RequestMapping(value = "/member/login.do")
	public String login(@RequestParam(value="MEMBER_ID", required = true) String MEMBER_ID,
			@RequestParam(value="MEMBER_PW", required = true) String MEMBER_PW, Model model,
			HttpSession session ) {
		logger.info(MEMBER_ID+" "+MEMBER_PW);
		MemberVO member = memberService.login(MEMBER_ID, MEMBER_PW);
		if (member != null) {
			logger.info("로그인 성공");
			session.setAttribute("isLogOn", true);
			session.setAttribute("member", member);
		}
		
		return "home";
	}
	@RequestMapping(value = "/member/memberView.do", method = RequestMethod.GET)
	public String memberView(Locale locale, Model model) {
		return "/member/memberView";
	}
	@RequestMapping(value = "/member/memberUpdate.do", method = RequestMethod.GET)
	public String memberUpdate(Locale locale, Model model) {
		return "/member/memberUpdate";
	}

	@RequestMapping(value = "/member/findUserId.do", method = RequestMethod.GET)
	public String findUserId(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		return "/member/findUserId";
	}
	@RequestMapping(value = "/member/findUserPw.do", method = RequestMethod.GET)
	public String findUserPw(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		return "/member/findUserPw";
	}

}
