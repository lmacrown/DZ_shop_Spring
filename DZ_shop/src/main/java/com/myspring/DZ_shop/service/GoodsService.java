package com.myspring.DZ_shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myspring.DZ_shop.entity.GoodsVO;
import com.myspring.DZ_shop.entity.MemberVO;
import com.myspring.DZ_shop.entity.NoticeVO;
import com.myspring.DZ_shop.entity.QnAVO;
import com.myspring.DZ_shop.mappers.AdminDAO;
import com.myspring.DZ_shop.mappers.GoodsDAO;

@Service
public class GoodsService {
	@Autowired
	GoodsDAO goodsDAO;
	
	public List<GoodsVO> listGoods() {
		return goodsDAO.listGoods();
	}

	public GoodsVO goodsView(String goods_id) {
		GoodsVO goodsVO = goodsDAO.goodsView(goods_id);
		if (goodsVO != null) {
			return goodsVO;
		}	
		return null;
	}

	public void add_item(String goods_id, String member_id) {
		goodsDAO.add_item(goods_id, member_id);
	}



}
