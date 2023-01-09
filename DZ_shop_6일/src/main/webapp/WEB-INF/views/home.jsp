<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>DZ shop</title>
<link rel="shortcut icon" href="../assets/images/favicon.png" />
</head>
<body>
	<div class="card"
		style="width: 70%; margin-left: 10%; margin-top: -300px">
		<div class="main_book">
			<c:set var="goods_count" value="0" />
			<h3>베스트셀러</h3>
			<c:forEach var="item" items="${goodsMap.bestseller }">
				<c:set var="goods_count" value="${goods_count+1 }" />
				<div class="book">
					<a
						href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id }">
						<img class="link" src="${contextPath}/resources/image/1px.gif">
					</a> <img width="121" height="154"
						src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}">

					<div class="title">${item.goods_title }</div>
					<div class="price">
						<fmt:formatNumber value="${item.goods_price}" type="number"
							var="goods_price" />
						${goods_price}원
					</div>
				</div>
				<c:if test="${goods_count==9}">
					<div class="book">
						<font size=20> <a href="#">more</a></font>
					</div>
				</c:if>
			</c:forEach>
		</div>
	</div>

</body>
</html>
