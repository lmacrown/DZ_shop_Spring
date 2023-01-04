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
	<div class="card"
		style="width: 70%; margin-left: 10%; margin-top: -300px">
		<div
			class="d-flex justify-content-between align-items-center flex-wrap grid-margin">
			<div>
				<h4 class="mb-3 mb-md-0"
					style="margin-left: auto; margin-right: auto; margin-top: 10px; text-align: center;">게시글
					목록</h4>
			</div>
			<div class="d-flex align-items-center flex-wrap text-nowrap">
				<button type="button" id="createChat" style="margin-top: 10px;"
					onclick="location.href='postCreate.jsp'"
					class="btn btn-outline-info btn-icon-text mr-2 d-none d-md-block">
					<i class="btn-icon-prepend" data-feather="download"></i> 게시글 생성
				</button>
			</div>
		</div>
		<form action="/DZ_MultiChat/post/post.do" name="searchForm"
			method="post">
			<input type="hidden" name="pageNo" id="pageNo"
				value="${currentPageNo}" />
			<div style="margin-bottom: 20px">
				검색 : <input type="text" name="title" value="${param.title}">
				<button type="submit" value="검색" id="searchTitle">검색</button>
			</div>
		</form>

		<div class="row">
			<div class="col-lg-7 col-xl-8 stretch-card">
				<div class="table-responsive">
					<div style="width: 80% px; height: 600px;">
						<table class="table table-hover mb-0"
							style="margin-left: auto; margin-right: auto;">
							<thead>
								<tr>
									<th style="height: 20px">글번호</th>
									<th style="height: 20px">게시글 제목</th>
									<th style="height: 20px">작성자</th>
									<th style="height: 20px">작성일</th>
									<th style="height: 20px">조회수</th>
								</tr>
							</thead>

							<tbody>
								<%-- 				<c:choose>
														<c:when test="${not empty searchBoard}">
															<c:forEach var="board" items="${searchBoard}">
																<tr>
																	<td>${board.number}</td>
																	<td><a
																		href="<c:url value='/post/postView.do?number=${board.number}'/>">
																			${board.number == board.parentNo ? '' : '<span style="margin-left:20px;">[답변]</span>'}
																			${board.title} | <c:choose>
																				<c:when test="${board.number == board.parentNo}">${board.title}</c:when>
																				<c:otherwise>&nbsp;[답변] ${board.title}</c:otherwise>
																			</c:choose>
																	</a></td>
																	<td>${board.writeId}</td>
																	<td>${board.writeDate}</td>
																	<td>${board.viewCount}</td>
																</tr>
															</c:forEach>
														</c:when>
													</c:choose>
													<c:choose>
														<c:when test="${empty searchBoard}"> --%>
								<c:forEach var="board" items="${list}">
									<tr>
										<td>${board.number}</td>
										<td><a
											href="<c:url value='/post/postView.do?number=${board.number}'/>">
												${board.number == board.parentNo ? '' : '<span style="margin-left:20px;">[답변]</span>'}
												${board.title} | <c:choose>
													<c:when test="${board.number == board.parentNo}">${board.title}</c:when>
													<c:otherwise>&nbsp;[답변] ${board.title}</c:otherwise>
												</c:choose>
										</a></td>
										<td>${board.writeId}</td>
										<td>${board.writeDate}</td>
										<td>${board.viewCount}</td>
									</tr>
								</c:forEach>
								<%-- 		</c:when>
													</c:choose> --%>
							</tbody>
						</table>
						<c:if test="${currentPageNo != 1}">
							<a href="javascript:movePage(1)"> &lt;&lt; </a>
												&nbsp;
												<a href="javascript:movePage(${currentPageNo-1})"> &lt;
							</a>
												&nbsp;
											</c:if>

						<c:forEach var="pageNo" begin="${startPageNo}" end="${endPageNo}">
							<c:choose>
								<c:when test="${currentPageNo == pageNo}">
									<span style="font-size: 1.3rem;">${pageNo}</span>
								</c:when>
								<c:otherwise>
									<a href="javascript:movePage(${pageNo})">${pageNo}</a>
								</c:otherwise>
							</c:choose>
												&nbsp;
											</c:forEach>

						<c:if test="${currentPageNo != totalPageNo}">
							<a href="javascript:movePage(${currentPageNo+1})"> &gt; </a>
												&nbsp;
												<a href="javascript:movePage(${totalPageNo})"> &gt;&gt;
							</a>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
