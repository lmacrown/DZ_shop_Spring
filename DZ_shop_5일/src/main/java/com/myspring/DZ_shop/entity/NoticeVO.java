package com.myspring.DZ_shop.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class NoticeVO {
	private String Title;
	private String Contents;
	private int Views;
	private Date WriteDate;
}
