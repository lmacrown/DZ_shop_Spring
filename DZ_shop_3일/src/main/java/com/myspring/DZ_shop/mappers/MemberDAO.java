package com.myspring.DZ_shop.mappers;

import java.util.List;

import com.myspring.DZ_shop.entity.MemberVO;

public interface MemberDAO {
	MemberVO selectView(String MEMBER_ID, String MEMBER_PW);

	String selectId(String email);

	void deleteId(String MEMBER_ID);

	void update(String MEMBER_ID, String MEMBER_PW, String MEMBER_NAME, String EMAIL);

	void register(String MEMBER_ID, String MEMBER_PW, String MEMBER_NAME, String EMAIL);

	MemberVO dupUidCheck(String MEMBER_ID);

//	List<MemberVO> listMembers();
}
