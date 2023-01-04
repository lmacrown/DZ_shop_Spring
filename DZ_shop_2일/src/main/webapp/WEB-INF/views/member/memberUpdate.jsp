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
<style type="text/css">
input {
	border: 1px solid #79EDFF
}
</style>
</head>
<body>
	<div style="width: 70%; margin-left: 10%; margin-top: -150px">
		<div id="container" style="border: 1px solid black;">
			<h1 style="text-align: center; margin-top: 20px;">회원 정보 수정</h1>
			<form>
				<fieldset>
					<ul>
						<li><label for="uid" id="uid">아이디</label>
							${uid}</li>
						<li><label for="pwd" style="padding-right: 16px">비밀번호</label>
							<input type="password" id="pwd" placeholder="문자와 숫자, 특수 기호 포함"
							autofocus required></li>
						<li><label for="nickname">닉네임</label> <input type="text"
							id="nickname" style="margin-left: 30px"></li>
						<li><label for="email">이메일</label> <input type="email"
							id="email" style="margin-left: 30px"></li>
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
