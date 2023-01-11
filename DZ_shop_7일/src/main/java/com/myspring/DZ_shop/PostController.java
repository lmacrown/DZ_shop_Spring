package com.myspring.DZ_shop;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

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

import com.myspring.DZ_shop.entity.GoodsVO;
import com.myspring.DZ_shop.service.AdminService;
import com.myspring.DZ_shop.service.GoodsService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class PostController {
	@Autowired 
	AdminService adminService;
	@Autowired
	GoodsService goodsService;
	
	private static final Logger logger = LoggerFactory.getLogger(PostController.class);
	
	@RequestMapping(value = "/post/post.do", method = RequestMethod.GET)
	public String post(Locale locale, Model model) {
		return "/post/post";
	}
	@RequestMapping(value = "/post/goodsDetail.do", method = RequestMethod.GET)
	public String postView(Locale locale, Model model,
			@RequestParam(value = "goods_id", required = true) String goods_id) {
		logger.info("상품상세보기 : "+goods_id);
		model.addAttribute("goods",goodsService.goodsView(goods_id));
		
		return "/post/goodsDetail";
	}
	@RequestMapping(value = "/post/add_item.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> add_item(Locale locale, Model model,
			@RequestBody HashMap<String, String> map) {
		logger.info("장바구니 추가");
		Map<String, Object> result = new HashMap();
		goodsService.add_item(map.get("goods_id"), map.get("member_id"));
		result.put("status", true);
		
		return result;
	}
	
	
	
	@RequestMapping(value = "/post/postCreate.do", method = RequestMethod.GET)
	public String postCreate(Locale locale, Model model) {
		return "/post/postCreate";
	}
	@RequestMapping(value = "/post/postFix.do", method = RequestMethod.GET)
	public String postFix(Locale locale, Model model) {
		return "/post/postFix";
	}


	@RequestMapping(value = "/post/notice.do", method = RequestMethod.GET)
	public String notice(Locale locale, Model model) {
		logger.info("공지 확인 ");
		model.addAttribute("notice",adminService.noticeAll());
		
		return "/post/notice";
	}
	@RequestMapping(value = "/post/noticeView.do", method = RequestMethod.GET)
	public String noticeView(Locale locale, Model model,
			@RequestParam(value = "title", required = true) String title) {
		logger.info("공지 세부 확인 : "+title);
		model.addAttribute("notice",adminService.noticeView(title));
		
		return "/post/noticeView";
	}
	
}
