package com.myspring.DZ_shop.mappers;

import java.util.List;

import com.myspring.DZ_shop.entity.MemberVO;
import com.myspring.DZ_shop.entity.NoticeVO;
import com.myspring.DZ_shop.entity.QnAVO;

public interface AdminDAO {
	List<MemberVO> listMembers();

	void deleteMember(String MEMBER_ID);

	List<NoticeVO> noticeAll();

	NoticeVO noticeView(String title);

	void deleteNotice(String title);

	void noticeUpdate(String title, String contents);

	void noticeRegister(String title, String contents, String date);

	List<QnAVO> QnAAll();

	QnAVO QnAView(String title);
}
