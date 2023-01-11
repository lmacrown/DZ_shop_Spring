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
			<h1 style="text-align: center; margin-top: 20px;">회원 정보 수정</h1>
			<form method="post" name="updateForm" id="updateForm" action="/DZ_shop/member/memberUpdate.do" class="forms-sample">
				<fieldset>
					<ul>
						<li><label for="uid" 
						id="MEMBER_ID" 
						style="padding-right: 53px">아이디</label>
							${member.MEMBER_ID}</li>
						<li><label for="pwd" style="padding-right: 40px">비밀번호</label>
							<input type="password" id="MEMBER_PW" name="MEMBER_PW" placeholder="문자와 숫자, 특수 기호 포함"
							autofocus required></li>
						<li><label for="nickname" style="padding-right: 53px">닉네임</label> <input type="text"
							id="MEMBER_NAME" name="MEMBER_NAME" ></li>
						<li><label for="email" style="padding-right: 53px">이메일</label> <input type="email"
							id ="EMAIL" name="EMAIL" ></li>
					</ul>

					<input class="btn btn-outline-info btn-icon-text mr-2 d-none d-md-block"
						style="width: 120px; margin-left: 20px"
						type="submit" value="수정하기" id="update">
					<input class="btn btn-outline-info btn-icon-text mr-2 d-none d-md-block"
						style="width: 120px; margin-left: 20px"
						type="button" value="탈퇴하기" id="deleteButton">
					<button class="btn btn-outline-info btn-icon-text mr-2 d-none d-md-block" 
					style="float: right; margin-top: -38px;" type="button" onClick="history.back()">취소</button>

				</fieldset>
			</form>
		</div>
	</div>
<script type="text/javascript">
let update = document.querySelector("#updateForm");
update.addEventListener("submit", (e) => {
	e.preventDefault();
	let param = {
			MEMBER_PW : MEMBER_PW.value
			,MEMBER_NAME : MEMBER_NAME.value
			,EMAIL : EMAIL.value
	}
	fetch("<c:url value='/member/memberUpdate.do'/>", {		
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
	return false;
});
</script>
</body>
</html>
