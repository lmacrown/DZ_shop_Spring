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
<style type="text/css">
label {
	margin-top: 10px
}
</style>
</head>
<body>
	<h1>게시글 생성</h1>
	<input type="button" value="어드민 홈"
		onclick="location.href='/DZ_shop/admin/adminhome.do'">

	<div style="width: 70%; margin-left: 10%;">
		<div style="border: 1px solid black">
			<div class="px-4 py-5" style="width: 100%">
				<form  id="registerForm" style="width: 90%; margin-left: 10px">
					<h3 class="card-title">
						제목 : <input type="text" id="title" name="title" >
					</h3>
					
						<label>분류 : 
							<select id="sort" name="sort">
									<option value="의류" selected>의류</option>
									<option value="식품">식품</option>
									<option value="전자제품">전자제품</option>
									<option value="기타">기타</option>
							</select> 
						</label><br/>
						<label>작가 : 
							<input style="width: 50%;"
							type="text" id="writer" name="writer">
						</label><br/>
						<label>내용 : 
							<input style="width: 90%; min-height: 300px;"
							type="text" id="intro" name="intro">
						</label><br/>
						<label>가격 : 
							<input style="width: 15%"
							type="text" id="price" name="price">
						</label><br/>
						
					
						<div style="width: 300px; margin-top:10px; justify-content: space-between; ">

							<button type="button" onClick="history.back()">뒤로가기</button>
							<button type="submit" id="update" >작성</button>
						</div>
					
				</form>
			</div>
		</div>
	</div>
<script type="text/javascript">
const formToSerialize = (formId) => JSON.stringify([].reduce.call(document.querySelector('#' + formId), (data, element) => {
    //이름이 있는 것을 대상으로함 
    if (element.name == '') return data;
    //radio와 checkbox인 경우는 반드시 선택된 것만 대상으로함 
     if (element.type == 'radio' || element.type == 'checkbox') {
        if (element.checked) {
            data[element.name] = element.value;
        }
     } else {
        //그외는 모두 대상으로 함 
        data[element.name] = element.value;
     }
     return data;
    },
    {} //초기값 
 )
);

const skFetch = (formId, url, handler) => {
   fetch(url, {
      method:"post",
      headers: {
         "Content-type" : "application/json; charset=utf-8"
      },
      body : formToSerialize(formId)
   })
   .then(response => response.json())
   .then(resultJson => {
      handler(resultJson);
   });
};
	
let register = document.querySelector("#registerForm");
register.addEventListener("submit", (e) => {
	alert("게시글 등록");
	e.preventDefault();
	
	skFetch("registerForm","<c:url value='/admin/admin_postRegister.do'/>", jsonResult => {
		if (jsonResult.status==true) {
			alert("등록 성공");
			location.href ="<c:url value='/admin/admin_post.do'/>";
		}
		else{
			alert("등록 실패");
		}
	});
	return false;
});
</script>
</body>
</html>
