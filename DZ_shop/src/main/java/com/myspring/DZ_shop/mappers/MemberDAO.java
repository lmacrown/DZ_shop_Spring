package com.myspring.DZ_shop.mappers;

import java.util.List;

import com.myspring.DZ_shop.entity.MemberVO;

public interface MemberDAO {
	MemberVO selectView(String MEMBER_ID, String MEMBER_PW);

//	List<MemberVO> listMembers();
}
