package com.myspring.DZ_shop.mappers;

import java.util.List;

import com.myspring.DZ_shop.entity.MemberVO;
import com.myspring.DZ_shop.entity.NoticeVO;

public interface AdminDAO {
	List<MemberVO> listMembers();

	void deleteMember(String MEMBER_ID);

	List<NoticeVO> noticeAll();

	NoticeVO noticeView(String title);

	void deleteNotice(String title);
}
