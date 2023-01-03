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
	<div style="width: 70%; margin-left: 10%; margin-top: -150px">
		<div id="container" style="border: 1px solid black;">
			<h1 style="text-align: center; margin-top: 20px;">회원 정보 수정</h1>
			<form>
				<fieldset>
					<ul>
						<li><label for="uid" id="uid" 
						style="margin-left: 30px">아이디</label>
							${uid}</li>
						<li><label for="pwd" id="pwd"
							style="margin-left: 30px; padding-right: 16px">비밀번호</label>
							${memberBean.pwd}</li>
						<li><label for="nickname" style="margin-left: 30px">닉네임</label>
							${memberBean.name}</li>
						<li><label for="email" style="margin-left: 30px">이메일</label>
							${memberBean.email}</li>
					</ul>

					<input type="submit" value="수정하기" id="updateButton"> <input
						type="submit" value="탈퇴하기" id="deleteButton">
					<button type="button" onClick="history.back()">취소</button>

				</fieldset>
			</form>
		</div>
	</div>
</body>
</html>
