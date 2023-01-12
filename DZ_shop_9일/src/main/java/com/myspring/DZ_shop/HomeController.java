package com.myspring.DZ_shop;

import java.io.File;
import java.io.OutputStream;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.myspring.DZ_shop.service.GoodsService;

import net.coobird.thumbnailator.Thumbnails;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	private static String CURR_IMAGE_REPO_PATH = "C:\\shopping\\file_repo";
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@Autowired
	GoodsService goodsService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model
			,@RequestParam(value = "pageNo",  required = false) String pageNoStr
			,@RequestParam(value = "title", required = false) String text) {
		//logger.info("Welcome home! The client locale is {}.", locale);
		logger.info("홈화면");
		
		if ("".equals(pageNoStr) || null == pageNoStr) pageNoStr = "1";
		if ("".equals(text) || null == text) text = "";
		int totalPageNo =goodsService.totalpageNo(text);
		int pageNo = Integer.parseInt(pageNoStr);
		int pageSize = 10;
		
		int startPageNo = ((pageNo - 1) / pageSize) * pageSize + 1;
		int endPageNo = startPageNo + pageSize - 1;
		if (endPageNo > totalPageNo) endPageNo = totalPageNo;
		logger.info("총 페이지 수 : "+totalPageNo+", 시작 페이지 : "+startPageNo
				+", 끝 페이지 : "+endPageNo+", 현재 페이지 : "+pageNo);
		
		model.addAttribute("list", goodsService.listGoods(text, (pageNo-1)*10));
		model.addAttribute("totalPageNo", totalPageNo);
		model.addAttribute("startPageNo", startPageNo);
		model.addAttribute("endPageNo", endPageNo) ;
		model.addAttribute("currentPageNo", pageNo) ;
		logger.info("출력 완료");
		return "home";
	}
	@RequestMapping("/thumbnails.do")
	protected void thumbnails(@RequestParam("fileName") String fileName,
                            	@RequestParam("goods_id") String goods_id,
			                 HttpServletResponse response) throws Exception {

		OutputStream out = response.getOutputStream();
		String filePath=CURR_IMAGE_REPO_PATH+"\\"+goods_id+"\\"+fileName+"_메인.jpg";
		File image=new File(filePath);
		logger.info("파일이름 : "+filePath);
		if (image.exists()) { 
			Thumbnails.of(image).size(121,154).outputFormat("png").toOutputStream(out);
		}
		/*
		 * byte[] buffer = new byte[1024 * 8]; out.write(buffer); out.close();
		 */
	}
	@RequestMapping(value = "/test.do", method = RequestMethod.GET)
	public String test(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "test";
	}

}
