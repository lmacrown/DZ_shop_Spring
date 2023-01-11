package com.myspring.DZ_shop.entity;

import java.sql.Date;
import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class OrderVO {
	private int ORDER_SEQ_NUM;
	private String MEMBER_ID;
	private int goods_id;
	private String GOODS_TITLE;
	private String delivery_address;
	private String DELIVERY_MESSAGE;
	private String orderer_hp_num;
	private String ORDER_WAY;
	private Date order_date;
	private String goods_price;
}