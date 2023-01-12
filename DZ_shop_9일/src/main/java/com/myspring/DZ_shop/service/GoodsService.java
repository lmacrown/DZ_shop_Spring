package com.myspring.DZ_shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myspring.DZ_shop.entity.GoodsVO;
import com.myspring.DZ_shop.entity.MemberVO;
import com.myspring.DZ_shop.entity.OrderVO;
import com.myspring.DZ_shop.mappers.GoodsDAO;

@Service
public class GoodsService {
	@Autowired
	GoodsDAO goodsDAO;
	
	
	/*
	 * public List<GoodsVO> listGoods() { return goodsDAO.listGoods(); }
	 */
	 
	public List<GoodsVO> listGoods(String text, int pageNo) {
		return goodsDAO.listGoods(text, pageNo);
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

	public List<GoodsVO> myList(String member_ID) {
		return goodsDAO.myList(member_ID);
	}

	public void myBagDelete(String member_ID, String goods_id) {
		goodsDAO.myBagDelete(member_ID, goods_id);
	}
	public void orderItem(OrderVO orderVO) {
		goodsDAO.orderItem(orderVO);
		
	}
	public List<OrderVO> myItem(String member_ID) {
		return goodsDAO.myItem(member_ID);
	}

	public void myItemDelete(String order_seq_num) {
		goodsDAO.myItemDelete(order_seq_num);
	}

	public int check_item(String goods_id, String member_id) {
		return goodsDAO.check_item(goods_id, member_id);
	}
	public int totalpageNo(String text) {
		return goodsDAO.totalPageNo(text);
	}
}
