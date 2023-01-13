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
		<div id="container" style="border: 1px solid black">
			<h1 style="text-align: center">비밀번호 찾기</h1>
			<form>
				<fieldset>
					<ul>
						<li><label for="inputEmail">이메일 입력</label> 
						<input type="text" id="email" autofocus required></li>
						<li><label for="inputUserId">아이디 입력</label> 
						<input type="text" id="uid" required> <input type="button" value="전송" id="sendId"> </li>
						<li><input type="text" name="validValue" id="validValue" 
						value="인증번호를 입력하세요"></li>
					</ul>
					
					<div id="buttons" style="margin-left: 40px">
						<input type="button" value="확인" id="findPwd">
						<button type="button" onClick="history.back()">취소</button>
					</div>
				</fieldset>
			</form>
		</div>
	</div>

	<script type="text/javascript">
	let send_id = document.querySelector("#sendId");
	send_id.onclick = () => {
		sendId();
	} 
	async function sendId() {
		alert("비번 찾기");
		let response = await fetch('/DZ_shop/member/send_id.do?email=' + 
				email.value+'&uid='+uid.value);
		let jsonResult = await response.json();
		if (jsonResult.status == true) {
			alert(jsonResult.message);
		}else{
			alert(jsonResult.message);
		}
	}
	
	
	let findPwds = document.querySelector("#findPwd");
	findPwds.onclick = () => {
		findPwd();
	} 
	async function findPwd() {
		let response = await fetch('/DZ_shop/member/findUserPw.do?validValue=' + validValue.value);
		let jsonResult = await response.json();
		if (jsonResult.status == true) {
			alert(jsonResult.message);
			location.href = jsonResult.url;
		}else{
			alert(jsonResult.message);
		}
	}
</script>
</body>
</html>
