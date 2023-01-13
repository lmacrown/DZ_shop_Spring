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
	private int GOODS_ID;
	private String GOODS_TITLE;
	private String DELIVERY_ADDRESS;
	private String DELIVERY_MESSAGE;
	private String ORDERER_HP_NUM;
	private String ORDER_WAY;
	private Date ORDER_DATE;
	private String GOODS_PRICE;
}