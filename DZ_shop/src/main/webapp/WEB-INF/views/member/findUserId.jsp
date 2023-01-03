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
						<input type="text" id="email" autofocus required 
						style="border: 1px solid #79EDFF"></li>
					</ul>
					<input type="button" value="확인" id="findId">
					<button type="button" onClick="history.back()">취소</button>
				</fieldset>

			</form>
		</div>
	</div>

	<script type="text/javascript">
function jsBoardInsert() {
	let param = {title: title.value,
			content:content.value};
		
	fetch("<c:url value='/rest/board'/>", {
		method : "post",
		headers: {
		    "Content-Type": "application/json",
		},
		body: JSON.stringify(param),
	})
	.then(response => response.json())
	.then(jsonObj => {
		alert(jsonObj.name);
	});
}
</script>
</body>
</html>