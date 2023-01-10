<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<div class="card"
		style="width: 70%; margin-left: 10%; margin-top: -300px">
		<div id="goods_image"
			style="margin-left: 5%; margin-top: 20px; display: flex">
			<figure>
				<img alt="HTML5 &amp; CSS3" width="200px" height="250px"
					src="${contextPath}/thumbnails.do?goods_id=${goods.goods_id}&fileName=${goods.goods_title}">
			</figure>
			<div id="detail_table" style="margin-left: 10px">
				<table>
					<tbody>
						<tr>
							<td class="fixed">제목</td>
							<td class="active">${goods.goods_title}</td>
						</tr>
						<tr>
							<td class="fixed">정가</td>
							<td class="active"><span> <fmt:formatNumber
										value="${goods.goods_price}" type="number" var="goods_price" />
									${goods_price}원
							</span></td>
						</tr>
						<tr>
							<td class="fixed">배송료</td>
							<td class="fixed"><strong>무료</strong></td>
						</tr>
						<tr>
							<td class="fixed">배송안내</td>
							<td class="fixed"><strong>[당일배송]</strong> 당일배송 서비스 시작!<br>
								<strong>[휴일배송]</strong> 휴일에도 배송받는 Bookshop</TD>
						</tr>
						<tr>
							<td class="fixed">도착예정일</td>
							<td class="fixed">지금 주문 시 내일 도착 예정</td>
						</tr>
						<tr>
							<td class="fixed">수량</td>
							<td class="fixed"><select style="width: 60px;"
								id="order_goods_qty">
									<option>1</option>
									<option>2</option>
									<option>3</option>
									<option>4</option>
									<option>5</option>
							</select></td>
						</tr>
					</tbody>
				</table>
				<c:if test="${member != null}">
					<div style="display: flex; margin-top: 10px">
					<a class="btn btn-outline-info btn-icon-text mr-2 d-none d-md-block"
						style="width: 120px; display: flex; margin-left: 20px"
						href='/DZ_shop/member/memberUpdateForm.do'>구입하기</a> 
					<a class="btn btn-outline-info btn-icon-text mr-2 d-none d-md-block"
						style="width: 120px; display: flex; margin-left: 20px" href="#"
						id="shopping_bag" >장바구니</a>
					</div>
				</c:if>
			</div>
		</div>
	</div>
<script type="text/javascript">
let shopping_add = document.querySelector("#shopping_bag");
shopping_add.onclick = () => {
	shopping_bag();
}
async function shopping_bag(){
	alert("장바구니 시작");
	 let param = {
			goods_id : ${goods.goods_id}
	 		member_id : ${member.MEMBER_ID}//이거 안됨
	}/*
		fetch("<c:url value='/post/add_item.do'/>",{
			method : 'POST',
			headers: {
			      'Content-Type': 'application/json; charset=UTF-8'
			},
		    cache: 'no-cache',
			body: JSON.stringify(param)	
		})	
		.then(response => response.json())
		.then(jsonResult => {
			if (jsonResult.status==true) {
				alert("장바구니 담기 완료");
			}
			else{
				alert("장바구니 담기 실패");
			}
		});
	 return false; */
}


</script>
</body>
</html>

