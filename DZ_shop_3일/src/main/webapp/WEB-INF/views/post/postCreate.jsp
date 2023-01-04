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
								<h6 class="card-title">게시글 작성</h6>
								<form name="uploadForm4" id="uploadForm4" method="post"
									enctype="multipart/form-data"
									action="<c:url value='/post/addPost'/>"
									style="width: 90%; margin-left: 10px">
									<div class="form-group">
										<label for="title">Title</label> <input type="text"
											oninput="btn_status()" class="form-control" id="title"
											placeholder="Title" name="title">
									</div>
									<div>
										<label for="content">Content</label> <input type="text"
											oninput="btn_status()" class="form-control"
											style="height: 300px;" id="content" name="content">
									</div>
									<div class="form-group">
										<table>
											<tbody>
												<tr>
													<th><label>첨부파일</label></th>
													<td><input type="file" name="filename1" id="filename1" /></td>
													<td><input type="button" value="추가" class="insertFile"></td>
												</tr>
											</tbody>
											<tfoot>
												<tr style="display: none">
													<th><label>첨부파일</label></th>
													<td><input type="file" name="filename1" id="filename1" /></td>
													<td><input type="button" value="추가" class="insertFile"></td>
													<td><input type="button" value="삭제" class="deleteFile"></td>
												</tr>
											</tfoot>
										</table>

									</div>
									<div class="row1">
										<div style="width: 150px;">

											<button type="submit" class="btn btn-primary" id="postAdd">등록</button>
											<!-- disabled=""disabled" -->
											<a href="post.jsp"
												class="btn btn-primary text-white mr-2 mb-2 mb-md-0">취소</a>
										</div>
									</div>
								</form>
							</div>
						</div>
	</div>

</body>
</html>
