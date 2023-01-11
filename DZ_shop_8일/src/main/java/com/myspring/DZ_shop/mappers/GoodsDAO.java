package com.myspring.DZ_shop.mappers;

import java.util.List;

import com.myspring.DZ_shop.entity.GoodsVO;
import com.myspring.DZ_shop.entity.OrderVO;

public interface GoodsDAO {
	List<GoodsVO> listGoods();

	GoodsVO goodsView(String goods_id);

	void add_item(String goods_id, String member_id);

	List<GoodsVO> myList(String member_ID);

	void myBagDelete(String member_ID, String goods_id);

	List<OrderVO> myItem(String member_ID);

	void orderItem(OrderVO orderVO);

	void myItemDelete(String order_seq_num);


}
