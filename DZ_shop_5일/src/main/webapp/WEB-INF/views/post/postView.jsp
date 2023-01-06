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
<body>
	<div style="width: 70%; margin-left: 10%; margin-top: -300px">
		<div class="card-body">
			<div class="px-4 py-5"
				style="width: 100%; height: 400px; overflow: scroll">
				<c:set var="i">1</c:set>
				<c:forEach var="viewBoard" items="${viewBoard}">
					<h1 class="card-title" style="margin-left: 10px">${viewBoard.title}</h1>
					<form style="width: 90%; margin-left: 10px">
						<div class="form-group">
							<label>작성자 : ${viewBoard.writeId}</label> <label
								style="float: right; margin-right: 10%">작성일 :
								${viewBoard.writeDate}</label>
						</div>
						<label>조회수 : ${viewBoard.viewCount}</label>
						<div>
							<label for="content">Content</label>
						</div>
						<div>
							<label for="contents"
								style="width: 90%; min-height: 100px; border: 1px solid;">${viewBoard.content}</label>
						</div>
						<div class="row1">
							<div style="width: 300px; justify-content: space-between;">
								<c:if test="${uid eq viewBoard.writeId}">
									<a href="postFix.jsp"
										class="btn btn-primary text-white mr-2 mb-2 mb-md-0">수정</a>
									<a href="postFix.jsp"
										class="btn btn-primary text-white mr-2 mb-2 mb-md-0">삭제</a>

									<!-- disabled=""disabled" -->

								</c:if>
								<c:if test="${i eq 1}">
									<a
										href="<c:url value='/post/replyForm.do?number=${viewBoard.number}'/>"
										class="btn btn-primary text-white mr-2 mb-2 mb-md-0">답글</a>
								</c:if>
								<c:set var="i">${i+1}</c:set>
							</div>
						</div>
						<div>
							</br>
						</div>
					</form>
				</c:forEach>
				<a href="/multichat/jsp/post/post.jsp"
					class="btn btn-primary text-white mr-2 mb-2 mb-md-0">뒤로가기</a>
			</div>
		</div>
	</div>

</body>
</html>
