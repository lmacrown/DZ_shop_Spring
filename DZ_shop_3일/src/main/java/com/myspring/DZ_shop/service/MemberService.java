package com.myspring.DZ_shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myspring.DZ_shop.entity.MemberVO;
import com.myspring.DZ_shop.mappers.MemberDAO;

@Service
public class MemberService {
	@Autowired
	MemberDAO memberDAO;
	
	public MemberVO login(String MEMBER_ID, String MEMBER_PW) {
		
		MemberVO memberVO = memberDAO.selectView(MEMBER_ID, MEMBER_PW);
		if (memberVO != null && memberVO.getMEMBER_PW().equals(MEMBER_PW)) {
			return memberVO;
		}
		
		return null;
	}

	public String findUserId(String email) {

		return memberDAO.selectId(email);
		
	}

	public void delete(String MEMBER_ID) {
		memberDAO.deleteId(MEMBER_ID);
	}

	public void update(String MEMBER_ID, String MEMBER_PW, String MEMBER_NAME, String EMAIL) {
		System.out.println(MEMBER_ID);
		System.out.println(MEMBER_PW);
		System.out.println(MEMBER_NAME);
		System.out.println(EMAIL);
		memberDAO.update(MEMBER_ID, MEMBER_PW, MEMBER_NAME, EMAIL);
	}
	public void register(String MEMBER_ID, String MEMBER_PW, String MEMBER_NAME, String EMAIL) {
		System.out.println(MEMBER_ID);
		System.out.println(MEMBER_PW);
		System.out.println(MEMBER_NAME);
		System.out.println(EMAIL);
		memberDAO.register(MEMBER_ID, MEMBER_PW, MEMBER_NAME, EMAIL);
	}

	public boolean dupUidCheck(String MEMBER_ID) {
		MemberVO memberVO = memberDAO.dupUidCheck(MEMBER_ID);
		if (memberVO != null)
			return true;
		return false;
	}

//	public List<MemberVO> listMembers() {
//		return memberDAO.listMembers();
//	}

//	public Object view(String uid) {
//		return memberDAO.selectView(uid);
//	}
}
