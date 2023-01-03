package com.myspring.DZ_shop;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class PostController {
	
	private static final Logger logger = LoggerFactory.getLogger(PostController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/post/post.do", method = RequestMethod.GET)
	public String post(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "/post/post";
	}
	@RequestMapping(value = "/post/postCreate.do", method = RequestMethod.GET)
	public String postCreate(Locale locale, Model model) {
		return "/post/postCreate";
	}
	@RequestMapping(value = "/post/postFix.do", method = RequestMethod.GET)
	public String postFix(Locale locale, Model model) {
		return "/post/postFix";
	}
	@RequestMapping(value = "/post/postView.do", method = RequestMethod.GET)
	public String postView(Locale locale, Model model) {
		return "/post/postView";
	}

	@RequestMapping(value = "/post/notice.do", method = RequestMethod.GET)
	public String notice(Locale locale, Model model) {
		return "/post/notice";
	}
	@RequestMapping(value = "/post/noticeView.do", method = RequestMethod.GET)
	public String noticeView(Locale locale, Model model) {
		return "/post/noticeView";
	}
	@RequestMapping(value = "/post/QnA.do", method = RequestMethod.GET)
	public String QnA(Locale locale, Model model) {
		return "/post/QnA";
	}
}
