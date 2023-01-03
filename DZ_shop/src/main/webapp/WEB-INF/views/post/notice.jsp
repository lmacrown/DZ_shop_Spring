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
		<div
			class="d-flex justify-content-between align-items-center flex-wrap grid-margin">
			<div>
				<h4 class="mb-3 mb-md-0"
					style="margin-left: auto; margin-right: auto; margin-top: 10px; text-align: center;">공지사항</h4>
			</div>
			<div class="d-flex align-items-center flex-wrap text-nowrap">
				<!-- 	<button type="button" id="createChat" style="margin-top: 10px;"
									class="btn btn-outline-info btn-icon-text mr-2 d-none d-md-block">
									<i class="btn-icon-prepend" data-feather="download"></i> 채팅방 생성
								</button>  -->
			</div>
		</div>

		<div class="row">
			<div class="col-lg-7 col-xl-8 stretch-card">
				<div class="table-responsive">
					<table class="table table-hover mb-0"
						style="margin-left: auto; margin-right: auto;">
						<thead>
							<tr>
								<th style="height: 20px">공지 제목</th>
								<!-- <th style="height: 20px">공지 내용</th> -->
								<th style="height: 20px">생성일</th>
								<th style="height: 20px">조회수</th>
							</tr>
						</thead>
						<tbody>

							<c:forEach var="postDAO" items="${list}">
								<tr>
									<td><a href='#'
										onclick="location.href='/multichat/post/noticeCheck?title=${postDAO.title}'">${postDAO.title}
									</a></td>
									<td>${postDAO.registDate}</td>
									<td>${postDAO.views}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
