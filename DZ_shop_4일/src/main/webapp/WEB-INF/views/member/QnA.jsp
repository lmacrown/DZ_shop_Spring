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
	<div style="width: 70%; margin-left: 10%; margin-top: -200px">
		<div class="card-body">
			<div class="px-4 py-5" style="width: 100%">
				<h6 class="card-title">QnA</h6>
				<form style="width: 90%; margin-left: 10px"
				 name="uploadForm" method="post" action="<c:url value='/member/fileUpload.do'/>" 
				 enctype="multipart/form-data">
					<div class="form-group">
						<label for="title">Title</label> <input type="text"
							oninput="btn_status()" class="form-control" id="title"
							placeholder="Title" name="title">
					</div>
					<div class="form-group">
						<label for="content">Content</label>
						<!-- 										<textarea class="form-control"
											style="height: 450px;" id="contents" name="C"></textarea> -->
						<input type="text" style="height: 300px" oninput="btn_status()"
							class="form-control" id="contents" placeholder="contents"
							name="contents">
					</div>

					<div class="form-group">
						<label>Image upload</label> 
						<div class="input-group col-xs-12">
							<input type="file" name="file" id="file"  style="width:100%;background-color: #727CF5; color: white">
						</div>
					</div>
					<div class="row1">
						<div style="width: 150px;">

							<button class="btn btn-primary" id="AddQnA">등록</button>
							<button type="button" onClick="history.back()">취소</button>
						</div>
					</div>
				</form>


			</div>
		</div>
	</div>

</body>
</html>
