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
public class QnAVO {
	private int QnA_Num;
	private String MEMBER_ID;
	private String QnA_Title;
	private String QnA_Content;
	private String QnA_Image;
	private String QnA_reply_yn;
	private Date QnA_WriteDate;
}
