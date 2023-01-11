<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>adminPage_home</title>
<style>
.admin_select {
	width: 90%;
	margin: 10px auto;
}

button {
	width: 150px;
	height: 150px;
	margin-top: 10px;
}

button:nth-child(even) {
	color: orange;
}

button:nth-child(odd) {
	color: blue;
}
</style>
</head>
<body>
	<input type="button"
		onclick="location.href='${path}/admin/admin_logout.do'" value="로그아웃">
	<div class="admin_select"
		style="margin-left: 35%; margin-right: 35%; margin-top: 100px">
		<button type="button" name="member"
			class="btn btn-primary btn-icon-text mb-2 mb-md-0"
			onclick="location.href='${path}/admin/admin_member.do'">
			회원정보</button>
		<button type="button"
			class="btn btn-primary btn-icon-text mb-2 mb-md-0"
			onclick="location.href='${path}/admin/admin_notice.do'">공지
			사항</button>
		<br />
		<button type="button"
			class="btn btn-primary btn-icon-text mb-2 mb-md-0"
			onclick="location.href='${path}/admin/admin_post.do'">게시글 정보
		</button>
		<button type="button"
			class="btn btn-primary btn-icon-text mb-2 mb-md-0"
			onclick="location.href='${path}/admin/admin_QnAList.do'">문의
			내용</button>
<%-- 		<button type="button"
			class="btn btn-primary btn-icon-text mb-2 mb-md-0"
			onclick="location.href='${path}/admin/admin_QnAList.do'">구매목록</button>
		<button type="button"
			class="btn btn-primary btn-icon-text mb-2 mb-md-0"
			onclick="location.href='${path}/admin/admin_QnAList.do'">문의
			내용</button> --%>

	</div>

</body>
</html>