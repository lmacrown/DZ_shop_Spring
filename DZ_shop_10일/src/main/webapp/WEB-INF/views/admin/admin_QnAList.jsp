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
	<h1>QnA 목록</h1>
	<input type="button" value="어드민 홈"
		onclick="location.href='/DZ_shop/admin/adminhome.do'">
	<table>
		<thead>
			<tr>
				<th class="pt-0" style="width: 10%">번호</th>
				<th class="pt-0" style="width: 20%">제목</th>
				<th class="pt-0" style="width: 10%">작성자</th>
				<th class="pt-0" style="width: 5%">답변</th>
				<th class="pt-0" style="width: 15%">등록일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="qnaList" items="${qnaList}" varStatus="status">
				<tr>
					<td>${qnaList.qnA_Num}</td>
					<td><a href='#'
						onclick="location.href='/DZ_shop/admin/admin_QnAView.do?Number=${qnaList.qnA_Num}'">${qnaList.qnA_Title}
					</a></td> 
					<td>${qnaList.MEMBER_ID}</td>
					<td>${qnaList.qnA_reply_yn}</td>
					<td>${qnaList.qnA_WriteDate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>


</body>
</html>