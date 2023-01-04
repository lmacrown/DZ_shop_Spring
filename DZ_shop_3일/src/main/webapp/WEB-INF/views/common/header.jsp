<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<div class="navbar-content">
	<ul class="navbar-nav">
		<c:if test="${isLogOn}">
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
							<p class="name font-weight-bold mb-0">${member.MEMBER_ID}</p>
						</div>
					</div>
					<div class="dropdown-body">
						<ul class="profile-nav p-0 pt-3">
							<li class="nav-item"><a href="/DZ_shop/member/memberView.do"
								class="nav-link"> <i data-feather="user"></i> <span>Profile</span>
							</a></li>
							<li class="nav-item"><a
								href="/DZ_shop/member/memberUpdateForm.do" class="nav-link">
									<i data-feather="edit"></i> <span>Edit Profile</span>
							</a></li>
							<li class="nav-item"><a class="nav-link"
								href="/DZ_shop/member/logout.do"> <i data-feather="log-out"></i>
									<span>LogOut</span>
							</a></li>
						</ul>
					</div>
				</div></li>
		</c:if>
	</ul>
</div>
</html>