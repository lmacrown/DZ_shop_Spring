package com.myspring.DZ_shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myspring.DZ_shop.entity.MemberVO;
import com.myspring.DZ_shop.entity.NoticeVO;
import com.myspring.DZ_shop.entity.QnAVO;
import com.myspring.DZ_shop.mappers.AdminDAO;

@Service
public class AdminService {
	@Autowired
	AdminDAO adminDAO;
	
	public List<MemberVO> listMembers(String text, int pageNo) {
		return adminDAO.listMembers(text, pageNo);
	}

	public void memberDelete(String MEMBER_ID) {
		adminDAO.deleteMember(MEMBER_ID);
	}

	public List<NoticeVO> noticeAll() {
		return adminDAO.noticeAll();	
	}

	public NoticeVO noticeView(String title) {
		return  adminDAO.noticeView(title);		
	}

	public void noticeDelete(String title) {
		adminDAO.deleteNotice(title);		
	}

	public void noticeUpdate(String title, String contents) {
		 adminDAO.noticeUpdate(title, contents);
	}

	public void noticeRegister(String title, String contents, String date) {
		adminDAO.noticeRegister(title, contents, date);	
	}

	public List<QnAVO> QnAAll() {
		return adminDAO.QnAAll();	
	}

	public QnAVO QnAView(String title) {
		return adminDAO.QnAView(title);
	}

	public int totalpageNo(String text) {
		return adminDAO.totalPageNo(text);
	}


}
