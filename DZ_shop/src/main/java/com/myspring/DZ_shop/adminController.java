package com.myspring.DZ_shop;

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
public class adminController {
	
	private static final Logger logger = LoggerFactory.getLogger(adminController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/admin/adminhome.do", method = RequestMethod.GET)
	public String adminhome(Locale locale, Model model) {
		
		return "/admin/adminPage_home";
	}
	@RequestMapping(value = "/admin_member", method = RequestMethod.GET)
	public String test(Locale locale, Model model) {
		/* 데이터를 받아옴 */
		return "/admin/adminPage";
	}
	@RequestMapping(value = "/admin_notice", method = RequestMethod.GET)
	public String notice(Locale locale, Model model) {
		/* 데이터를 받아옴 */
		return "/admin/admin_notice";
	}
	@RequestMapping(value = "/admin_post", method = RequestMethod.GET)
	public String post(Locale locale, Model model) {
		/* 데이터를 받아옴 */
		return "/admin/admin_post";
	}
	@RequestMapping(value = "/admin_QnA", method = RequestMethod.GET)
	public String QnA(Locale locale, Model model) {
		/* 데이터를 받아옴 */
		return "/admin/admin_QnA";
	}
	
}
