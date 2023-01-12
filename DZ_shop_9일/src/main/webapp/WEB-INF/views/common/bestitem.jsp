<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>
<%
/* 서블릿으로 데이터 넘길것인지 jsp에서 바로 접근할것인지 선택 */
%>
<div style="width: 20%; margin-left: 150px; margin-top: 10px; float: right">
	<!--인기 검색어 목록  -->
	<div style="border: solid 1px gray; margin-top: 150px; margin-left: 17px">
		<h5>인기 검색어 목록1</h5>
		<c:forEach var="postDAO" items="${bestItem}">
			<tr>
				<td><a href='#'
					onclick="location.href='/multichat/post/noticeCheck?title=${postDAO.title}'">${postDAO.title}
				</a></td>
			</tr>
		</c:forEach>
	</div>
</div>
</html>