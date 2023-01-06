<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Douzone Chat</title>

</head>
<body class="sidebar-dark">
	<div class="main-wrapper">
		<!--타일즈 사용시 css 가져와서 충동이 일어남 
	=> css를 사용하는 jsp에서 하나만 설정 -->
		<tiles:insertAttribute name="side" />
		<div class="page-wrapper">
			<div>
				<nav class="navbar" style="margin-left: 0px">
					<tiles:insertAttribute name="header" />
					<div style="display: flex">
						<tiles:insertAttribute name="category" />

						<tiles:insertAttribute name="login" />
					</div>

				</nav>
			</div>
			<div>
				<!--이미지 3개씩 foreach 사용  -->
			</div>
		</div>

	</div>
</body>
</html>
