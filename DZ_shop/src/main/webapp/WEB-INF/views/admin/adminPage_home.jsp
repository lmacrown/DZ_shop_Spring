<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>adminPage_home</title>
<style>
.admin_select{
	width: 90%;
    margin: 10px auto;
    
}
button{
	width: 150px;
	height :150px;
	margin-top: 10px;
}
button:nth-child(even) {
	color : orange;
}
button:nth-child(odd) {
	color : blue;
}
</style>
</head>
<body>
	<div class="admin_select" style="margin-left: 35%; margin-right: 35%; margin-top: 200px">
		<button type="button" name="member" onclick="<c:url value='/admin_member'/>"
			class="btn btn-primary btn-icon-text mb-2 mb-md-0">
			회원정보
		</button>
		<button type="button"
			class="btn btn-primary btn-icon-text mb-2 mb-md-0">
			게시글 정보
		</button><br/>
		<button type="button"
			class="btn btn-primary btn-icon-text mb-2 mb-md-0">
			문의 내용
		</button>
		<button type="button"
			class="btn btn-primary btn-icon-text mb-2 mb-md-0">
			공지 사항
		</button>
	</div>
</body>
</html>