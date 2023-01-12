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
<title>DZ shop</title>
<link rel="shortcut icon" href="../assets/images/favicon.png" />
</head>
<body>
	<h1>공지 생성</h1>
	<input type="button" value="어드민 홈"
		onclick="location.href='/DZ_shop/admin/adminhome.do'">

	<div style="width: 70%; margin-left: 10%;">
		<div style="border: 1px solid black">
			<div class="px-4 py-5" style="width: 100%">
				<form  id="registerForm" style="width: 90%; margin-left: 10px">
					<h3 class="card-title">
						제목 : <input type="text" id="title" name="title" >
					</h3>
				
					<div>
						<label for="contents"
							style="width: 90%; min-height: 450px;">내용
							:  <input style="width: 90%; min-height: 450px;"
							type="text" id="contents" name="contents" value="${notice.contents}">
						</label>
						<!-- 	<input type="text"
										oninput="btn_status()" class="form-control"
										style="height: 450px;" id="content" name="content"> -->
					</div>
						<div style="width: 300px; justify-content: space-between; ">

							<button type="button" onClick="history.back()">뒤로가기</button>
							<button type="submit" id="update" >작성</button>
						</div>
					
				</form>
			</div>
		</div>
	</div>
<script type="text/javascript">
let register= document.querySelector("#registerForm");
register.addEventListener("submit", (e) => {
	alert("게시글 작성");
	e.preventDefault();
	/*후처리 동작을 막아줌  */
	let param = {
			title : title.value
			,contents : contents.value
	}
	fetch("<c:url value='/admin/admin_noticeRegister.do'/>", {		
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
			alert("작성 성공");
			location.href = jsonResult.url;
		}
		else{
			alert("작성 실패");
		}
	});
	return false;
});
</script>
</body>
</html>
