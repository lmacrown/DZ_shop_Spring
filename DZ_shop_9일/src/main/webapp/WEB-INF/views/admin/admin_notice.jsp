<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>DZ shop</title>
<link rel="shortcut icon" href="../assets/images/favicon.png" />
</head>
<style>
#container {
	margin: 10px auto;
}

fieldset {
	margin-left: auto;
	margin-right: auto;
}

table, th, td {
	border: 1px solid #222; /* 표 테두리 */
	border-collapse: collapse; /* 테두리 1줄만 표시 */
}

table {
	margin-left: auto;
	margin-right: auto;
}

tr {
	text-align: center;
}
</style>
<body>
	<h1>공지 목록</h1>
	<input type="button" value="어드민 홈"
		onclick="location.href='/DZ_shop/admin/adminhome.do'">
		<button type="button" 
			onclick="location.href='${path}/admin/admin_noticeRegisterForm.do'">공지 생성</button>
			
	<table>
		<thead>
			<tr>
				<th class="pt-0" style="width: 10%">번호</th>
				<th class="pt-0" style="width: 10%">제목</th>
				<th class="pt-0" style="width: 10%">조회수</th>
				<th class="pt-0" style="width: 10%">등록일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="notice" items="${notice}" varStatus="status">
				<tr>
					<td>${status.count}</td>
					<td><a href='#'
						onclick="location.href='/DZ_shop/admin/admin_noticeView.do?title=${notice.title}'">${notice.title}
					</a></td>
					<td>${notice.views}</td>
					<td>${notice.writeDate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>


</body>
</html>