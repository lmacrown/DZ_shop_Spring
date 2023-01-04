<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
/* .nav-item {
	margin-left: auto;
	margin-right: auto;
} */
</style>
</head>
<%--카테고리 목록--%>
<div style="margin-left: 10%; margin-top: 10px;">
	<nav>
		<div>
			<ul class="nav page-navigation" style="border: 3px solid yellow; width: 80%;">
				<li class="nav-item" style="margin-left: auto;margin-right: auto;">
					<a class="nav-link" href="../../dashboard-one.html"> 
						<i class="link-icon" data-feather="box"></i> 
						<span class="menu-title">카테고리1</span>
					</a>
				</li>
				<li class="nav-item" style="margin-left: auto;margin-right: auto;">
					<a href="#" class="nav-link"> 
						<i class="link-icon" data-feather="mail"></i> 
						<span class="menu-title">카테고리2</span> 
						<i class="link-arrow"></i>
					</a>
				</li>
				<li class="nav-item" style="margin-left: auto;margin-right: auto;">
					<a href="#" class="nav-link"> 
						<i class="link-icon" data-feather="mail"></i> 
						<span class="menu-title">카테고리3</span> 
						<i class="link-arrow"></i>
					</a>
				</li>
				<li class="nav-item" style="margin-left: auto;margin-right: auto;">
					<a href="#" class="nav-link"> 
						<i class="link-icon" data-feather="mail"></i> 
						<span class="menu-title">카테고리4</span> 
						<i class="link-arrow"></i>
					</a>
				</li>
			</ul>
			<div style="float: right; width: 20%; margin-top: -45px; margin-left: 5px">
				<c:if test="${isLogOn}">
					<div style="border: solid 1px gray; height: 80px;">
						<p>${member.MEMBER_ID}님 환영합니다!</p>
						<div style="float: left;">
							<a href="#">장바구니</a> <a href="#">주문확인</a>
						</div>
					</div>
					<!--최근 검색 목록  -->
					<div style="border: solid 1px gray; margin-top: 150px">
						<h5>최근 검색 목록</h5>
						<c:forEach var="postDAO" items="${list}">
							<tr>
								<td><a href='#'
									onclick="location.href='/multichat/post/noticeCheck?title=${postDAO.title}'">${postDAO.title}
								</a></td>
							</tr>
						</c:forEach>
					</div>
				</c:if>
				<c:if test="${!isLogOn}">
					<div style="border: solid 1px gray;">
						<form method="post" name="loginForm" id="loginForm" action="/DZ_shop/member/login.do" class="forms-sample">
							<div class="form-group">
								<label for="exampleInputUid">아이디</label> <input type="text"
									id="MEMBER_ID" name="MEMBER_ID">
							</div>
							<div class="form-group">
								<label for="exampleInputPwd">Password</label> <input
									type="password" id="MEMBER_PW" name="MEMBER_PW">
							</div>
							<div class="mt-3">
								<input type="submit" value="로그인" id="loginCheck">
							</div>
						</form>
						<form>
							<a href="/DZ_shop/member/findUserId.do">아이디 찾기/</a> <a
								href="/DZ_shop/member/findUserPw.do">비밀번호 찾기</a>
							<div>
								<a href="/DZ_shop/member/register.do">회원 가입</a>
							</div>
						</form>
					</div>
				</c:if>
			</div>
		</div>
	</nav>
	<form style="margin-top: 10px;" action="/DZ_MultiChat/post/post.do"
		name="searchForm" method="post">
		<input type="hidden" name="pageNo" id="pageNo"
			value="${currentPageNo}" />
		<div style="margin-bottom: 20px">
			검색 : <input type="text" name="title" value="${param.title}">
			<button type="submit" value="검색" id="searchTitle">검색</button>
		</div>
	</form>
</div>

</body>
</html>