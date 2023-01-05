package com.myspring.DZ_shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myspring.DZ_shop.entity.MemberVO;
import com.myspring.DZ_shop.entity.NoticeVO;
import com.myspring.DZ_shop.mappers.AdminDAO;

@Service
public class AdminService {
	@Autowired
	AdminDAO adminDAO;
	
	public List<MemberVO> listMembers() {
		return adminDAO.listMembers();
	}

	public void memberDelete(String MEMBER_ID) {
		adminDAO.deleteMember(MEMBER_ID);
	}

	public List<NoticeVO> noticeAll() {
		System.out.println("어드민 서비스");
		return adminDAO.noticeAll();	
	}

	public NoticeVO noticeView(String title) {
		return  adminDAO.noticeView(title);
		
	}

	public void noticeDelete(String title) {
		adminDAO.deleteNotice(title);
		
	}


}
