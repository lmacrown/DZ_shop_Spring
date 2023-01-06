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
	<h1>회원 관리 목록</h1>
	<input type="button" value="어드민 홈"
							onclick="location.href='/DZ_shop/admin/adminhome.do'">
	<table>
		<thead>
			<tr>
				<th class="pt-0" style="width: 10%">번호</th>
				<th class="pt-0" style="width: 10%">아이디</th>
				<th class="pt-0" style="width: 10%">비밀번호</th>
				<th class="pt-0" style="width: 10%">이름</th>
				<th class="pt-0" style="width: 25%">이메일</th>
				<th class="pt-0" style="width: 10%">삭제여부</th>
				<th class="pt-0" style="width: 10%">관리</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="member" items="${list}" varStatus="status">
				<tr>
					<td>${status.count}</td>
					<td>${member.MEMBER_ID}</td>
					<td>${member.MEMBER_PW}</td>
					<td>${member.MEMBER_NAME}</td>
					<td>${member.EMAIL}</td>
					<td>${member.DEL_YN}</td>
					<c:if test="${member.DEL_YN eq 'Y'}">
						<td><input type="button" value="삭제"
							onclick="location.href='/DZ_shop/admin/memberDelete.do?id=${member.MEMBER_ID}'"></td>
					</c:if>
					<c:if test="${member.DEL_YN eq 'N'}">
						<td><input type="button" value="해제"
							onclick="location.href='/DZ_shop/admin/memberDelete.do?id=${member.MEMBER_ID}'">
						</td>
					</c:if>
				</tr>
			</c:forEach>
		</tbody>
	</table>


</body>
</html>
