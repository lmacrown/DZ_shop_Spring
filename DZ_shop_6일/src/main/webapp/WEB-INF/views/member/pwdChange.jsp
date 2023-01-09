<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>
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
			<h1 style="text-align: center; margin-top: 20px;">회원 비밀번호 수정</h1>
			<form method="post" name="pwdChangeForm" id="pwdChangeForm" class="forms-sample">
				<fieldset>
					<ul>
						<li><label for="pwd" style="padding-right: 40px">비밀번호</label>
							<input type="password" id="MEMBER_PW" name="MEMBER_PW" placeholder="문자와 숫자, 특수 기호 포함"
							autofocus required></li>
						<li><label for="pwd" style="padding-right: 40px">비밀번호 재입력</label>
							<input type="password" id="MEMBER_PW_Re" name="MEMBER_PW_Re"
							required></li>
					</ul>

					<input class="btn btn-outline-info btn-icon-text mr-2 d-none d-md-block"
						style="width: 120px; margin-left: 20px"
						type="submit" value="수정하기" id="update">
				</fieldset>
			</form>
		</div>
	</div>
<script type="text/javascript">
let pwdChange = document.querySelector("#pwdChangeForm");
pwdChange.addEventListener("submit", (e) => {
	e.preventDefault();
	let param = {
			MEMBER_PW : MEMBER_PW.value
			,MEMBER_PW_Re : MEMBER_PW_Re.value
	}
	if(MEMBER_PW_Re.equals(MEMBER_PW)){
		fetch("<c:url value='/member/pwdFix.do'/>", {		
			method : 'POST',
			headers: {
			      'Content-Type': 'application/json; charset=UTF-8'
			},
		    cache: 'no-cache',
			body: JSON.stringify(param)	
		})
		.then(response => response.json())
		.then(jsonResult => {
			if (jsonResult.status==true) {
				alert("수정 성공");
				/*  location.href = jsonResult.url; 	 */		
				  location.href = "<c:url value ='/'/>"; 
			}
			else{
				alert("수정 실패");
			}
		});
	}else{
		alert("비밀번호가 일치 하지 않습니다");
	}
	return false;
});
</script>
</body>
</html>
