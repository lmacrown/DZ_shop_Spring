package com.myspring.DZ_shop;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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

import com.myspring.DZ_shop.entity.MemberVO;
import com.myspring.DZ_shop.entity.QnAVO;
import com.myspring.DZ_shop.service.MemberService;


/**
 * Handles requests for the application home page.
 */
@Controller
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	MemberService memberService;

	@RequestMapping(value = "/member/registerForm.do")
	public String registerForm(Locale locale, Model model) {
		return "/member/registerForm";
	}

	@RequestMapping(value = "/member/dupUidCheck.do")
	@ResponseBody
	public Map<String, Object> dupUidCheck(Locale locale, Model model,
			@RequestParam(value = "MEMBER_ID", required = true) String MEMBER_ID) {
		Map<String, Object> result = new HashMap();
		logger.info("중복체크 아이디 : " + MEMBER_ID);

		result.put("status", !memberService.dupUidCheck(MEMBER_ID));
		return result;
	}

	@RequestMapping(value = "/member/register.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> register(@RequestBody HashMap<String, String> map, HttpSession session)
			throws IOException {
		Map<String, Object> result = new HashMap();
		logger.debug("map->" + map);
		try {
			memberService.register(map.get("MEMBER_ID"), map.get("MEMBER_PW"), map.get("MEMBER_NAME"),
					map.get("EMAIL"));
			result.put("status", true);
			result.put("url", "/DZ_shop/");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("status", false);
		}
		return result;
	}

	@RequestMapping(value = "/member/login.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> login(@RequestBody HashMap<String, String> map, HttpSession session) throws IOException {
		Map<String, Object> result = new HashMap();
		logger.debug("map->" + map);
		MemberVO member = memberService.login(map.get("MEMBER_ID"), map.get("MEMBER_PW"));
		if (member != null) {
			result.put("status", true);
			result.put("url", "/DZ_shop/");
			logger.info("로그인 성공");
			session.setAttribute("isLogOn", true);
			session.setAttribute("member", member);
		} else {
			result.put("status", false);
		}

		return result;
	}

	@RequestMapping(value = "/member/logout.do")
	public String logout(HttpSession session) {
		logger.info("로그아웃");
		session.invalidate();

		return "redirect:/";
	}

	@RequestMapping(value = "/member/memberView.do", method = RequestMethod.GET)
	public String memberView(Locale locale, Model model) {
		return "/member/memberView";
	}

	@RequestMapping(value = "/member/delete.do", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> memberDelete(@RequestParam(value = "MEMBER_ID", required = true) String MEMBER_ID,
			HttpSession session) {
		Map<String, Object> result = new HashMap();
		logger.info("아이디 " + MEMBER_ID);

		memberService.delete(MEMBER_ID);
		result.put("url", "/DZ_shop/");
		session.invalidate();

		return result;
	}

	@RequestMapping(value = "/member/memberUpdateForm.do", method = RequestMethod.GET)
	public String memberUpdateForm(Locale locale, Model model) {
		return "/member/memberUpdateForm";
	}

	@RequestMapping(value = "/member/memberUpdate.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> memberUpdate(@RequestBody HashMap<String, String> map, HttpSession session,
			HttpServletRequest request) throws IOException {
		Map<String, Object> result = new HashMap();
		MemberVO member = (MemberVO) session.getAttribute("member");
		logger.info("map->" + map);
		String pw = (String) map.get("MEMBER_PW");
		System.out.println("아이디 받아오기 : " + member.getMEMBER_ID());
		System.out.println((String) map.get("MEMBER_NAME"));
		System.out.println((String) map.get("EMAIL"));
		try {
			memberService.update(
					member.getMEMBER_ID(), 
					map.get("MEMBER_PW"), 
					map.get("MEMBER_NAME"), 
					map.get("EMAIL"));
			result.put("status", true);
			result.put("url", "/DZ_shop/");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("status", false);
		}
		return result;
	}

	@RequestMapping(value = "/member/findUserIdForm.do", method = RequestMethod.GET)
	public String findUserIdForm(Locale locale, Model model) {
		return "/member/findUserIdForm";
	}

	@RequestMapping(value = "/member/findUserId.do", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> findUserId(Locale locale, Model model,
			@RequestParam(value = "email", required = true) String email) {
		logger.info("아이디 찾기");
		Map<String, Object> result = new HashMap();
		String uid = memberService.findUserId(email);
		if (uid != null) {
			result.put("status", true);
			result.put("uid", uid);
		} else {
			result.put("status", false);
		}
		return result;
	}

	@RequestMapping(value = "/member/findUserPwForm.do", method = RequestMethod.GET)
	public String findUserPwForm(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		return "/member/findUserPwForm";
	}

	@RequestMapping(value = "/member/findUserPw.do", method = RequestMethod.GET)
	public String findUserPw(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		return "/member/findUserPw";
	}

	@RequestMapping(value = "/member/QnA.do", method = RequestMethod.GET)
	public String QnA(Locale locale, Model model) {
		return "/member/QnA";
	}

	@RequestMapping(value = "/member/fileUpload.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> fileUploads(MultipartHttpServletRequest multipartRequest,
			 HttpSession session) throws Exception {
		logger.info("파일 업로드");
		
		multipartRequest.setCharacterEncoding("UTF-8");
		Map<String, String> map = new HashMap<>();
		Enumeration<?> e = multipartRequest.getParameterNames();

		MemberVO member = (MemberVO) session.getAttribute("member");
		Map<String, Object> result = new HashMap<>();
		
		while (e.hasMoreElements()) {
			String key = (String) e.nextElement();
			map.put(key, new String(multipartRequest.getParameter(key).getBytes("ISO8859-1"), "UTF-8"));
		}

		logger.info("map -> " + map);

		Iterator<String> fileNames = multipartRequest.getFileNames();
		List<QnAVO> QnA = new ArrayList<>();
		try {
			while (fileNames.hasNext()) {
				String fileName = fileNames.next();
				logger.info("fileName : " + fileName);

				MultipartFile mFile = multipartRequest.getFile(fileName);
				if (mFile.getSize() == 0)
					continue;

				QnAVO qnAVO = QnAVO.builder()
						.MEMBER_ID(member.getMEMBER_ID())
						.QnA_Title(map.get("title"))
						.QnA_Content(map.get("contents"))
						.QnA_Image(mFile.getOriginalFilename())
						.build();

				File file = new File("C:\\upload\\" + mFile.getOriginalFilename());
				mFile.transferTo(file);
				memberService.FileSave(qnAVO);
			}
			result.put("status", true);
			result.put("url", "/DZ_shop/");
		} catch (Exception e1) {
			e1.printStackTrace();
			result.put("status", false);
		}
		return result;
	}
}
