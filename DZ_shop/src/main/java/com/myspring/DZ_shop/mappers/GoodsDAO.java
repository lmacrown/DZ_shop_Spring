package com.myspring.DZ_shop.mappers;

import java.util.List;

import com.myspring.DZ_shop.entity.GoodsVO;

public interface GoodsDAO {
	List<GoodsVO> listGoods();

	GoodsVO goodsView(String goods_id);

	void add_item(String goods_id, String member_id);


}
