<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
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
					</tbody>
				</table>
				<c:if test="${currentPageNo != 1}">
					<a href="javascript:movePage(1)"> &lt;&lt; </a>&nbsp;
					<a href="javascript:movePage(${currentPageNo-1})"> &lt;</a>&nbsp;
				</c:if>
				<c:forEach var="pageNo" begin="${startPageNo}" end="${endPageNo}">
					<c:choose>
						<c:when test="${currentPageNo == pageNo}">
							<span style="font-size: 1.3rem;">${pageNo}</span>
						</c:when>
						<c:otherwise>
							<a href="javascript:movePage(${pageNo})">${pageNo}</a>
						</c:otherwise>
					</c:choose>&nbsp;
				</c:forEach>

				<c:if test="${currentPageNo != totalPageNo}">
					<a href="javascript:movePage(${currentPageNo+1})"> &gt; </a>&nbsp;
					<a href="javascript:movePage(${totalPageNo})"> &gt;&gt;</a>
				</c:if>
			</div>
		</div>
	</div>
</div>
</html>