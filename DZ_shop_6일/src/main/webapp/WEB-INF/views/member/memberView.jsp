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
			<h1 style="text-align: center; margin-top: 20px;">회원 정보</h1>
			<form>
				<fieldset>
					<ul>
						<li><label for="uid" id="uid" 
						style="margin-left: 30px; padding-right: 53px">아이디</label>
							${member.MEMBER_ID}</li>
						<li><label for="pwd" id="pwd"
							style="margin-left: 30px; padding-right: 40px">비밀번호</label>
							${member.MEMBER_PW}</li>
						<li><label for="nickname" style="margin-left: 30px; padding-right: 53px">닉네임</label>
							${member.MEMBER_NAME}</li>
						<li><label for="email" style="margin-left: 30px; padding-right: 53px">이메일</label>
							${member.EMAIL}</li>
					</ul>

					<a class="btn btn-outline-info btn-icon-text mr-2 d-none d-md-block"
						style="width: 120px; display: flex; margin-left: 20px"
						href='/DZ_shop/member/memberUpdateForm.do'>수정하기</a>
					<%-- <a class="btn btn-outline-info btn-icon-text mr-2 d-none d-md-block"
						style="width: 120px; display: flex; margin-left: 20px; margin-bottom:10px"
						href='/DZ_shop/member/delete.do?MEMBER_ID=${member.MEMBER_ID}'>탈퇴하기</a> --%>
					<input class="btn btn-outline-info btn-icon-text mr-2 d-none d-md-block"
						style="width: 120px; margin-left: 20px"
						type="submit" value="탈퇴하기" id="deleteButton">
					<button class="btn btn-outline-info btn-icon-text mr-2 d-none d-md-block" 
					style="float: right; margin-top: -38px;" type="button" onClick="history.back()">취소</button>

				</fieldset>
			</form>
		</div>
	</div>
	<script type="text/javascript">
	 let deleteButton = document.querySelector("#deleteButton");
	    deleteButton.onclick = () => {
	    	delete1();
	    } 
		function delete1(){
			 if (confirm("정말 삭제하시겠습니까?") == true){
				 fetch( "<c:url value='/member/delete.do?MEMBER_ID=${member.MEMBER_ID}'/>")
					.then(response => response.json())
					.then(jsonResult => {
						location.href = jsonResult.url;
					});
			 }else{
			     return false;
			 }
	    }
	</script>
</body>
</html>
