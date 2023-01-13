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
<body>
	<h1>공지 세부확인</h1>
	<input type="button" value="어드민 홈"
		onclick="location.href='/DZ_shop/admin/adminhome.do'">

	<div style="width: 70%; margin-left: 10%;">
		<div style="border: 1px solid black">
			<div class="px-4 py-5" style="width: 100%">
				<h3 class="card-title" style="margin-left: 10px">제목 :
					${notice.title}</h3>
				<form style="width: 90%; margin-left: 10px">
					<div class="form-group">
						<label>작성일 : ${notice.writeDate}</label>
					</div>

					<div>
						<label for="contents"
							style="width: 90%; min-height: 450px;">내용
							: ${notice.contents}</label>
						<!-- 	<input type="text"
										oninput="btn_status()" class="form-control"
										style="height: 450px;" id="content" name="content"> -->
					</div>
					<div class="row1">
						<div style="width: 300px; justify-content: space-between;">

							<button type="button" onClick="location.href='${path}/admin/admin_notice.do'">뒤로가기</button>
							<button type="button" onClick="location.href='${path}/admin/deleteNotice.do?title=${notice.title}'">삭제</button>
							<button type="button" onClick="location.href='${path}/admin/noticeFix.do?title=${notice.title}'">수정</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

</body>
</html>
