package com.myspring.DZ_shop.mappers;

import java.util.List;

import com.myspring.DZ_shop.entity.GoodsVO;
import com.myspring.DZ_shop.entity.MemberVO;
import com.myspring.DZ_shop.entity.NoticeVO;
import com.myspring.DZ_shop.entity.QnAVO;

public interface AdminDAO {
	List<MemberVO> listMembers(String text, int pageNo);

	void deleteMember(String MEMBER_ID);

	List<NoticeVO> noticeAll();

	NoticeVO noticeView(String title);

	void deleteNotice(String title);

	void noticeUpdate(String title, String contents);

	void noticeRegister(String title, String contents, String date);

	List<QnAVO> QnAAll();

	QnAVO QnAView(String title);

	int totalPageNo(String text);

	void postRegister(String title, String sort, String writer, String intro, String price);

	GoodsVO goodsView(String goods_id);

	void goodsUpdate(String title, String sort, String writer, String intro, String price, String good_id);

	void goodsDelete(String goods_id);

	String lastGoods_id();
}
