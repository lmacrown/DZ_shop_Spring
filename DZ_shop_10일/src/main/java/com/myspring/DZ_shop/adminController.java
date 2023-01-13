package com.myspring.DZ_shop;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.myspring.DZ_shop.entity.GoodsVO;
import com.myspring.DZ_shop.entity.QnAVO;
import com.myspring.DZ_shop.service.AdminService;
import com.myspring.DZ_shop.service.GoodsService;
import com.myspring.DZ_shop.service.MailService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class adminController {

	private static final Logger logger = LoggerFactory.getLogger(adminController.class);
	
	@Autowired
	AdminService adminService;
	
	@Autowired
	GoodsService goodsService;
	
	@Autowired
	MailService mailService;
	
	@RequestMapping(value = "/admin/adminhome.do", method = RequestMethod.GET)
	public String adminhome(Locale locale, Model model) {

		return "/admin/adminPage_home";
	}

	@RequestMapping(value = "/admin/admin_member.do")
	public String member(Model model
			,@RequestParam(value = "pageNo",  required = false) String pageNoStr
			,@RequestParam(value = "Member_Id", required = false) String text)
			throws Exception {
		logger.info("어드민 멤버 확인");
		logger.info("검색 : "+text+", 시작 페이지 : "+pageNoStr);
		
		if ("".equals(pageNoStr) || null == pageNoStr) pageNoStr = "1";
		if ("".equals(text) || null == text) text = "";
		int totalPageNo =adminService.totalpageNo(text);
		int pageNo = Integer.parseInt(pageNoStr);
		int pageSize = 10;
		
		int startPageNo = ((pageNo - 1) / pageSize) * pageSize + 1;
		int endPageNo = startPageNo + pageSize - 1;
		logger.info("총 페이지 수 : "+totalPageNo+", 시작 페이지 : "+startPageNo
				+", 끝 페이지 : "+endPageNo+", 현재 페이지 : "+pageNo);
		if (endPageNo > totalPageNo) endPageNo = totalPageNo;
		model.addAttribute("list", adminService.listMembers(text, (pageNo-1)*10));
		model.addAttribute("totalPageNo", totalPageNo);
		model.addAttribute("startPageNo", startPageNo);
		model.addAttribute("endPageNo", endPageNo) ;
		model.addAttribute("currentPageNo", pageNo) ;
		

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
			@RequestParam(value = "Number") String qnA_Num) throws Exception{
		logger.info("QnA 세부 확인");
		QnAVO qnavo = adminService.QnAView(qnA_Num);
		model.addAttribute("qna", qnavo);
		
		return "/admin/admin_QnAView";
	}
	@RequestMapping(value = "/admin/admin_QnAView_image.do", method = RequestMethod.GET)
	public void image(Locale locale, Model model, HttpServletResponse response,
			@RequestParam(value = "qnA_Num") String qnA_Num) throws Exception{
		logger.info(qnA_Num+"번호");
		QnAVO qnavo = adminService.QnAView(qnA_Num);
		
		if(qnavo.getQnA_Image()!=null) {
			
			response.setHeader("Cache-Control", "no-cache");
			response.addHeader("Content-disposition", "attachment; fileName=" + qnavo.getQnA_Image());
			OutputStream out = response.getOutputStream();
			String downFile = "C:\\upload\\"+qnavo.getQnA_Image();
			
			File file = new File(downFile);
			FileInputStream in = new FileInputStream(file);
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
	}

	

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
			adminService.QnA_reply(map.get("qna_Num"), map.get("contents"));
			
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
	@RequestMapping(value = "/admin/admin_logout.do", method = RequestMethod.GET)
	public String admin_logout(HttpSession session) {
		logger.info("로그아웃");
		session.invalidate();
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/admin/admin_post.do", method = RequestMethod.GET)
	public String admin_post(HttpSession session, Model model) {
		logger.info("게시글 확인");
		model.addAttribute("goodsMap", goodsService.listGoods());
		
		return "/admin/admin_post";
	}
	@RequestMapping(value = "/admin/admin_postRegisterForm.do", method = RequestMethod.GET)
	public String postRegisterForm(Locale locale, Model model) {
		logger.info("어드민 게시글 생성 ");
		return "/admin/admin_postRegisterForm";
	}
	@RequestMapping(value = "/admin/admin_postRegister.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> postRegister(Model model,
			MultipartHttpServletRequest multipartRequest, HttpSession session) throws IOException {
		Map<String, Object> result = new HashMap();
		
		multipartRequest.setCharacterEncoding("UTF-8");
		Iterator<String> fileNames = multipartRequest.getFileNames();
		Map<String, String> map = new HashMap<>();
		Enumeration<?> e = multipartRequest.getParameterNames();
		
		
		while (e.hasMoreElements()) {
			String key = (String) e.nextElement();
			map.put(key, URLDecoder.decode(multipartRequest.getParameter(key), "utf-8"));
		}
		logger.info("map->"+map);
		try {
			adminService.postRegister(map.get("title"), map.get("sort"), map.get("writer"),
					map.get("intro"),map.get("price"));
			while (fileNames.hasNext()) {
				String fileName = fileNames.next();
				logger.info("fileName : " + map.get("file"));

				MultipartFile mFile = multipartRequest.getFile(fileName);
				if (mFile.getSize() == 0)
					continue;
				
				String lastGoods_id=(String)adminService.lastGoods_id();
				String path = "C:\\shopping\\file_repo\\"+ lastGoods_id;
				File Folder = new File(path);
				if(!Folder.exists())
					Folder.mkdir();
				File file = new File("C:\\shopping\\file_repo\\" + lastGoods_id+"\\"+map.get("title")+"_메인.jpg");
				mFile.transferTo(file);
			}
			result.put("status", true);
		} catch (Exception e1) {
			e1.printStackTrace();
			result.put("status", false);
		}
		return result;
	}
	@RequestMapping(value = "/admin/admin_goodsView.do", method = RequestMethod.GET)
	public String goodsView(Locale locale, Model model, HttpServletResponse response,
			@RequestParam(value = "goods_id") String goods_id) throws Exception{
		logger.info("상품 확인");
		GoodsVO goodsVO= adminService.GoodsView(goods_id);
		model.addAttribute("goods", goodsVO);
		
		return "/admin/admin_goodsView";
	}
	@RequestMapping(value = "/admin/goodsFix.do", method = RequestMethod.GET)
	public String goodsFix(Model model, 
			@RequestParam(value = "goods_id", required = true) String goods_id)
			throws Exception {
		logger.info("어드민 게시글 수정");
		GoodsVO goodsVO= adminService.GoodsView(goods_id);
		model.addAttribute("goods", goodsVO);
		
		return "/admin/admin_goodsFix";
	}
	@RequestMapping(value = "/admin/admin_goodsUpdate.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> goodsUpdate(Model model, HttpSession session,
			MultipartHttpServletRequest multipartRequest) throws IOException {
		Map<String, Object> result = new HashMap();
		
		multipartRequest.setCharacterEncoding("UTF-8");
		Map<String, String> map = new HashMap<>();
		Enumeration<?> e = multipartRequest.getParameterNames();
		
		while (e.hasMoreElements()) {
			String key = (String) e.nextElement();
			map.put(key, URLDecoder.decode(multipartRequest.getParameter(key), "utf-8"));
		}
		logger.info("어드민 게시글 수정 "+map.get("title"));
		Iterator<String> fileNames = multipartRequest.getFileNames();
		try {
			adminService.goodsUpdate(map.get("title"), map.get("sort"), map.get("writer"),
					map.get("intro"),map.get("price"), map.get("goods_id"));
			//goods_id, fileName
			logger.info("파일 업로드");
			
			while (fileNames.hasNext()) {
				String fileName = fileNames.next();
				logger.info("fileName : " + map.get("file"));

				MultipartFile mFile = multipartRequest.getFile(fileName);
				if (mFile.getSize() == 0)
					continue;

				File file = new File("C:\\shopping\\file_repo\\" + map.get("goods_id")+"\\"+map.get("title")+"_메인.jpg");
				mFile.transferTo(file);
			}

			result.put("status", true);
		} catch (Exception e1) {
			e1.printStackTrace();
			result.put("status", false);
		}
		return result;
	}
	@RequestMapping(value = "/admin/goodsDelete.do", method = RequestMethod.GET)
	public String goodsDelete(Model model, 
			@RequestParam(value = "goods_id", required = true) String goods_id)
			throws Exception {
		logger.info("어드민 게시글 삭제");
		adminService.goodsDelete(goods_id);
		
		return "/admin/admin_post";
	}
}
