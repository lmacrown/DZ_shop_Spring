<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>DZ shop</title>
<link rel="shortcut icon" href="../assets/images/favicon.png" />
<style>
h3 {
	margin-left: 10px;
	margin-top: 20px;
}
</style>
</head>
<body>
	<div class="card"
		style="width: 70%; margin-left: 10%; margin-top: -300px; padding-bottom: 50px">
		<h3>1. 주문확인</h3>
		<form name="form_order" id="form_order">
			<fieldset>
				<table class="list_view">
					<tbody align=center>
						<tr style="background: #33ff00">
							<th class="pt-0" style="width: 30%">주문상품명</th>
							<th class="pt-0" style="width: 11%">수량</th>
							<th class="pt-0" style="width: 16%">주문금액</th>
							<th class="pt-0" style="width: 18%">배송비</th>
							<th class="pt-0" style="width: 19%">주문금액합계</th>
						</tr>
						<tr style="height: 100px">
							<%-- <c:forEach var="item" items="${goods}"> --%>
							<td class="goods_image" style="display: flex"><img
								width="75" height="100"
								src="${contextPath}/thumbnails.do?goods_id=${goods.goods_id}&fileName=${goods.goods_title}">
								<input type="hidden" id="GOODS_ID" name="GOODS_ID"
								value="${goods.goods_id}"> <a style="line-height: 100px"
								href="${contextPath}/post/goodsDetail.do?goods_id=${goods.goods_id}">${goods.goods_title}</a>
							</td>
							<td>1개</td>
							<td>${goods.goods_price}원</td>
							<td>0원</td>
							<td>${goods.goods_price}원</td>
						</tr>
						<%-- 					가격 합산 정보 넘기기
					<c:set var="final_total_order_price"
						value="${final_total_order_price+ item.goods_sales_price* item.order_goods_qty}" />
					<c:set var="total_order_price"
						value="${total_order_price+ item.goods_sales_price* item.order_goods_qty}" />
					<c:set var="total_order_goods_qty"
						value="${total_order_goods_qty+item.order_goods_qty }" /> --%>
						<%-- </c:forEach> --%>
					</tbody>
				</table>
				<div class="clear"></div>

				<br> <br>
				<H3>2.배송지 정보</H3>
				<DIV class="detail_table">

					<table style="margin-left: 10px;">
						<tbody>
							<tr class="dot_line">
								<td class="fixed_join">배송지 선택</td>
								<td>
								<input type="radio" name="delivery_place" onClick="restore_all()" value="기본배송지" checked>기본배송지 &nbsp;&nbsp;&nbsp; 
								<input type="radio" name="delivery_place" value="새로입력" onClick="reset_all()">새로입력</td>
							</tr>
							<tr class="dot_line">
								<td class="fixed_join">받으실 분</td>
								<td><input id="receiver_name" name="receiver_name"
									type="text" size="40" value="${member.MEMBER_NAME}" />
							</tr>
							<tr class="dot_line">
								<td class="fixed_join">휴대폰번호</td>
								<td><input size="20px" type="text" id="ORDERER_HP_NUM"
									name="ORDERER_HP_NUM" value="${member.TEL }"></td>
							</tr>

							<tr class="dot_line">
								<td class="fixed_join">주소</td>
								<td>
									<p style="margin-top: -20px">
										<br> <input type="text" id="DELIVERY_ADDRESS"
											name="DELIVERY_ADDRESS" size="50" value="${member.ADDRESS}" /><br>
									</p>
								</td>
							</tr>
							<tr class="dot_line">
								<td class="fixed_join">배송 메시지</td>
								<td><input id="DELIVERY_MESSAGE" name="DELIVERY_MESSAGE"
									type="text" size="50" placeholder="택배 기사님께 전달할 메시지를 남겨주세요." /></td>
							</tr>
						</tboby>
					</table>
				</div>
				<H3>3.결제방법</H3>
				<table style="margin-left: 10px;">
					<tbody>
						<tr>
							<td><input type="radio" id="ORDER_WAY" name="ORDER_WAY"
								value="신용카드" onClick="fn_pay_card()" checked>신용카드
								&nbsp;&nbsp;&nbsp; <input type="radio" id="ORDER_WAY"
								name="ORDER_WAY" value="제휴 신용카드">제휴 신용카드
								&nbsp;&nbsp;&nbsp; <input type="radio" id="ORDER_WAY"
								name="ORDER_WAY" value="실시간 계좌이체">실시간 계좌이체
								&nbsp;&nbsp;&nbsp; <input type="radio" id="ORDER_WAY"
								name="ORDER_WAY" value="무통장 입금">무통장 입금
								&nbsp;&nbsp;&nbsp; <br /> <input type="radio" id="ORDER_WAY"
								name="ORDER_WAY" value="휴대폰결제" onClick="fn_pay_phone()">휴대폰
								결제 &nbsp;&nbsp;&nbsp; <input type="radio" id="ORDER_WAY"
								name="ORDER_WAY" value="카카오페이(간편결제)">카카오페이(간편결제)
								&nbsp;&nbsp;&nbsp; <input type="radio" id="ORDER_WAY"
								name="ORDER_WAY" value="페이나우(간편결제)">페이나우(간편결제)
								&nbsp;&nbsp;&nbsp; <input type="radio" id="ORDER_WAY"
								name="ORDER_WAY" value="페이코(간편결제)">페이코(간편결제)
								&nbsp;&nbsp;&nbsp; <br /> <input type="radio" id="ORDER_WAY"
								name="ORDER_WAY" value="직접입금">직접입금&nbsp;&nbsp;&nbsp;</td>
						</tr>
					</tbody>
				</table>
				<div
					style="margin-left: 30%; margin-right: 30%; margin-top: 20px; display: flex; text-align: center">
					<input
						class="btn btn-outline-info btn-icon-text mr-2 d-none d-md-block"
						style="width: 120px; margin-left: 20px;" type="submit"
						value="주문하기" id="orderItem">
					<button
						class="btn btn-outline-info btn-icon-text mr-2 d-none d-md-block"
						style="width: 120px;" type="button" onClick="history.back()">취소</button>
				</div>
			</fieldset>
		</form>
	</div>
	<script type="text/javascript">
	const formToSerialize = (form_order) => JSON.stringify([].reduce.call(document.querySelector('#form_order'), (data, element) => {
	    //이름이 있는 것을 대상으로함 
	    if (element.name == '') return data;
	    //radio와 checkbox인 경우는 반드시 선택된 것만 대상으로함 
	     if (element.type == 'radio' || element.type == 'checkbox') {
	        if (element.checked) {
	            data[element.name] = element.value;
	        }
	     } else {
	        //그외는 모두 대상으로 함 
	        data[element.name] = element.value;
	     }
	     return data;
	    },
	    {} //초기값 
	 )
	);
	const skFetch = (form_order, url, handler) => {
		   fetch(url , {
		      method:"post",
		      headers: {
		         "Content-type" : "application/json; charset=utf-8"
		      },
		      body : formToSerialize(form_order)
		   })
		   .then(response => response.json())
		   .then(resultJson => {
		      handler(resultJson);
		   });
		};
		
	let form_order = document.querySelector("#form_order");
	form_order.addEventListener("submit", (e) => {
		alert("구매");
		e.preventDefault();
		
		skFetch("form_order","<c:url value='/post/orderItem.do'/>", jsonResult => {
			if (jsonResult.status==true) {
				alert("구매 성공");
				location.href ="<c:url value='/'/>";
			}
			else{
				alert("구매 실패");
			}
		});
		return false;
	});
	</script>
</body>
</html>
