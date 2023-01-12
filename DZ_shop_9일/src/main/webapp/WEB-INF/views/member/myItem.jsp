<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>DZ shop</title>
<link rel="shortcut icon" href="../assets/images/favicon.png" />
<style type="text/css">
label, tr {
	margin-left: 10px;
	margin-top: 20px;
}

tr, th, td {
	border: 1px solid black;
}
</style>
</head>
<body>
	<div style="width: 70%; margin-left: 10%; margin-top: -150px">
		<div id="card" style="border: 1px solid black;">
			<label style="color: blue;">장바구니 목록</label>
			<table style="text-align: center">
				<thead>
					<tr>
						<th class="pt-0" style="width: 3%">번호</th>
						<th class="pt-0" style="width: 5%">종류</th>
						<th class="pt-0" style="width: 15%">제목</th>
						<th class="pt-0" style="width: 15%">저자</th>
						<th class="pt-0" style="width: 8%">가격</th>
						<th class="pt-0" style="width: 10%">등록일</th>
						<th class="pt-0" style="width: 7%">삭제</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach var="goods" items="${goods}" varStatus="status">

						<tr>
							<td>${status.count}</td>
							<td>${goods.goods_sort}</td>
							<td>${goods.goods_title}</td>
							<td>${goods.goods_writer}</td>
							<td>${goods.goods_price}</td>
							<td>${goods.credate}</td>
							<td><input type="button" value="삭제"
								onclick="location.href='/DZ_shop/member/myBagDelete.do?goods_id=${goods.goods_id}'"></td>

						</tr>

					</c:forEach>

				</tbody>
			</table>
		</div>
		<div id="card" style="border: 1px solid black;">
			<label style="color: red;">구매 목록</label>
			<table style="text-align: center">
				<thead>
					<tr>
						<th class="pt-0" style="width: 3%">번호</th>
						<th class="pt-0" style="width: 5%">이름</th>
						<th class="pt-0" style="width: 15%">배송주소</th>
						<th class="pt-0" style="width: 15%">번호</th>
						<th class="pt-0" style="width: 8%">가격</th>
						<th class="pt-0" style="width: 10%">등록일</th>
						<th class="pt-0" style="width: 7%">삭제</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach var="buyItem" items="${buyItems}" varStatus="status">
						<tr>
							<td>${status.count}</td>
							<td>${buyItem.GOODS_TITLE}</td>
							<td>${buyItem.DELIVERY_ADDRESS}</td>
							<td>${buyItem.ORDERER_HP_NUM}</td>
							<td>${buyItem.GOODS_PRICE}</td>
							<td>${buyItem.ORDER_DATE}</td>
							<td><input class="deleteClass" type="button" value="삭제" id="deleteButton" data-deleteid="${buyItem.ORDER_SEQ_NUM}"></td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
		</div>
	</div>
	<script type="text/javascript">
	 document.querySelectorAll(".deleteClass").forEach(goods=>{
		 goods.addEventListener('click',(e)=>{
			 deleteButton(e.target.getAttribute("data-deleteid"));
			 
		 })
	 });

		function deleteButton(id){
			 if (confirm("정말 삭제하시겠습니까?") == true){
				 fetch( "<c:url value='/member/myItemDelete.do'/>",{
						method : 'POST',
						headers: {
						      'Content-Type': 'application/json; charset=UTF-8'
						},
					    cache: 'no-cache',
						body: JSON.stringify({id})	
				 })
					.then(response => response.json())
					.then(jsonResult => {
						location.href = jsonResult.url;
					});
			 }else{
			     return false;
			 }
	    }
	</script>
</body>
</html>
