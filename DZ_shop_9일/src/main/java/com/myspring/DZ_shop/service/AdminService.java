package com.myspring.DZ_shop.service;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myspring.DZ_shop.entity.GoodsVO;
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

	public void postRegister(String title, String sort, String writer, String intro, String price) {
		adminDAO.postRegister(title, sort, writer,intro ,price);	
	}

	public GoodsVO GoodsView(String goods_id) {
		return adminDAO.goodsView(goods_id);
	}

	public void goodsUpdate(String title, String sort, String writer, String intro, String price,
			String good_id) {
		adminDAO.goodsUpdate(title, sort, writer,intro ,price,good_id);	
	}

	public void goodsDelete(String goods_id) {
		 adminDAO.goodsDelete(goods_id);
		
	}

	public String lastGoods_id() {
		return adminDAO.lastGoods_id();
	}


}
