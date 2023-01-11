<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DZ_MultiChat</title>
<style>
#container {
	width: 600px;
	margin: 10px auto;
}

label {
	padding-right: 75px;
}
</style>
</head>
<body>
	<div style="width: 70%; margin-left: 10%; margin-top: -150px">
		<div id="container" style="border: 1px solid black">
			<h1 style="text-align: center; margin-top: 20px">아이디 찾기</h1>
			<form>
				<fieldset>
					<ul>
						<li><label for="inputEmail">이메일 입력</label> 
						<input type="text" id="email" name="email" autofocus required 
						style="border: 1px solid #79EDFF"></li>
					</ul>
					<input type="button" value="확인" onclick="findUserId()">
					<button type="button" onClick="history.back()">취소</button>
				</fieldset>

			</form>
		</div>
	</div>

	<script type="text/javascript">
	async function findUserId() {
		let response = await fetch('/DZ_shop/member/findUserId.do?email=' + email.value);
		let jsonResult = await response.json();
		if (jsonResult.status == false) {
			alert("[" + email.value + "] 해당 이메일은 없습니다");
		}else{
			alert("아이디는 [" + jsonResult.uid+"] 입니다");
		}
}
</script>
</body>
</html>