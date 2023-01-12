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
			<c:forEach var="item" items="${list}" varStatus="status">
				<div style="float: left">
					<c:forEach var="i" items="1">
						<div class="book"
							style="margin-left: 20px; margin-right: 20px; text-align: center; width: 200px; height: 230px">
							<img width="121" height="154" style="align-items: center;"
								src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=${item.goods_title}">
							<div class="title">${item.goods_title }</div>
							<div class="price">
								<fmt:formatNumber value="${item.goods_price}" type="number"
									var="goods_price" />
								${goods_price}원
							</div>
							<input type="button" value="상세보기"
								onclick="location.href='${contextPath}/post/goodsDetail.do?goods_id=${item.goods_id}'">
						</div>
					</c:forEach>
					<br />
				</div>
			</c:forEach>
		</div>
		<div style="margin-left:30%;display: flex; justify-content: space-between; width: 30% ">
			<c:if test="${currentPageNo != 1}">
				<a href="javascript:movePage(1)"> &lt;&lt; </a>
				&nbsp;
				<a href="javascript:movePage(${currentPageNo-1})"> &lt;</a>
				&nbsp;
			</c:if>
	
			<c:forEach var="pageNo" begin="${startPageNo}" end="${endPageNo}">
				<c:choose>
					<c:when test="${currentPageNo == pageNo}">
						<span style="font-size: 1.3rem;">${pageNo}</span>
					</c:when>
					<c:otherwise>
						<a href="javascript:movePage(${pageNo})">${pageNo}</a>
					</c:otherwise>
				</c:choose>
				&nbsp;
			</c:forEach>
			<c:if test="${currentPageNo != totalPageNo}">
		<a href="javascript:movePage(${currentPageNo+1})"> &gt; </a>
			&nbsp;
		<a href="javascript:movePage(${totalPageNo})"> &gt;&gt;</a>
	</c:if>
		</div>
	</div>
	<script type="text/javascript">
	let searchButton = document.querySelector("#searchTitle");
	searchButton.onclick = () => {
		document.querySelector("#pageNo").value = 1; 
		searchForm.submit();
	}
	function movePage(pageNo) {
		document.querySelector("#pageNo").value = pageNo; 
		searchForm.submit();
	}
	</script> 
</body>
</html>
