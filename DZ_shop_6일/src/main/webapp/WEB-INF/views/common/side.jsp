<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>

<nav class="sidebar">
	<div class="sidebar-header">
		<a href="#" class="sidebar-brand"> DZ<span>CHAT</span>
		</a>
		<div class="sidebar-toggler active">
			<span></span> <span></span> <span></span>
		</div>
	</div>
	<div class="sidebar-body">
		<ul class="nav">

			<li class="nav-item"><a href="/DZ_shop/" class="nav-link"> <i
					class="link-icon" data-feather="box"></i> <span class="link-title">홈</span>
			</a></li>

			<li class="nav-item nav-category">게시글</li>

			<li class="nav-item"><a class="nav-link"
				href="/DZ_shop/post/notice.do"> <i class="link-icon"
					data-feather="feather"></i> <span class="link-title">공지 사항</span>
			</a></li>
			<li class="nav-item"><a class="nav-link"
				href="/multichat/jsp/post/post.jsp"> <i class="link-icon"
					data-feather="anchor"></i> <span class="link-title">일반
						게시판(미구현)</span>
			</a></li>
			<c:if test="${isLogOn}">
				<li class="nav-item"><a class="nav-link"
					href="/DZ_shop/member/QnA.do"> <i class="link-icon"
						data-feather="inbox"></i> <span class="link-title">QnA</span>
				</a></li>
			
				<li class="nav-item"><a class="nav-link"
					href="/DZ_shop/member/logout.do"> <i class="link-icon"
						data-feather="log-out"></i> <span class="link-title">로그아웃</span>
				</a></li>
			</c:if>
		</ul>
	</div>
</nav>
<%-- 
<div class="page-wrapper">
	<nav class="navbar">
		<div class="navbar-content">
			<ul class="navbar-nav">
				<li class="nav-item dropdown nav-profile"><a
					class="nav-link dropdown-toggle" href="#" id="profileDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <img
						src="https://via.placeholder.com/30x30" alt="userr">
				</a>
					<div class="dropdown-menu" aria-labelledby="profileDropdown">
						<div class="dropdown-header d-flex flex-column align-items-center">
							<div class="figure mb-3">
								<img src="https://via.placeholder.com/80x80" alt="">
							</div>
							<div class="info text-center">
								<p class="name font-weight-bold mb-0">${uid}</p>
							</div>
						</div>
						<div class="dropdown-body">
							<ul class="profile-nav p-0 pt-3">
								<li class="nav-item"><a href="/multichat/member/view"
									class="nav-link"> <i data-feather="user"></i> <span>Profile</span>
								</a></li>
								<li class="nav-item"><a
									href="/multichat/jsp/member/memberUpdate.jsp" class="nav-link">
										<i data-feather="edit"></i> <span>Edit Profile</span>
								</a></li>
								<li class="nav-item"><a class="nav-link"
									href="../login.jsp"> <i data-feather="log-out"></i> <span>LogOut</span>
								</a></li>
							</ul>
						</div>
					</div></li>
			</ul>
		</div>
 --%>


</html>