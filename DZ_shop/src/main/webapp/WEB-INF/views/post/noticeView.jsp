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
			<div class="px-4 py-5" style="width: 100%">
				<h3 class="card-title" style="margin-left: 10px">${notice.title}</h3>
				<form style="width: 90%; margin-left: 10px">
					<div class="form-group">
						<label>${notice.id}</label> <label>${notice.registDate }</label>
					</div>
					<div>
						<label for="content">Content</label>
					</div>
					<div>
						<label for="contents"
							style="width: 90%; min-height: 450px; border: 1px solid;">${notice.content}</label>
						<!-- 	<input type="text"
										oninput="btn_status()" class="form-control"
										style="height: 450px;" id="content" name="content"> -->
					</div>
					<div class="row1">
						<div style="width: 300px; justify-content: space-between;">

							<a href="/multichat/jsp/post/notice.jsp"
								class="btn btn-primary text-white mr-2 mb-2 mb-md-0">뒤로가기</a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

</body>
</html>
