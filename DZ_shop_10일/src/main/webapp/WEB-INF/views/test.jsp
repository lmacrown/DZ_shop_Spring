<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form id="prodInsert" name="prodInsert" 
		enctype="multipart/form-data" accept-charset="UTF-8">
		아이디 : <input type="text" name="uid" id="uid" /><br />
		이름 : <input type="text" name="name" id="name"  /><br />
		상품 종류 : <input type="text" name="prodKind" id="prodKind" /><br /> 상품
		이름 : <input type="text" name="prodName" id="prodName" /><br> 상품
		저자 : <input type="text" name="prodAuthorName" id="prodAuthorName" /><br>
		상품 가격 : <input type="text" name="prodPrice" id="prodPrice" /><br>
		출판사 이름 : <input type="text" name="prodPublishing" id="prodPublishing" /><br>
		배송비 : <input type="text" name="shipping" id="shipping" /><br> 상품
		소개 :
		<textarea id="prodIntroduction" name="prodIntroduction" rows="10"
			cols="15"></textarea>
		파일 : <input type="file" name="file0" id="file0" /><br /> <input
			id="prodInsertBtn" name="prodInsertBtn" type="button" value="전송" />
		<input type="reset" value="초기화" />
	</form>
	
</body>
<script type="text/javascript" defer>
var formEle = document.querySelector("#prodInsert");

var prodInsertBtn = document.querySelector("#prodInsertBtn");


prodInsertBtn.addEventListener("click", (e) => {
	e.preventDefault();
	prodInsert();
});

async function prodInsert() {
	alert("상품을 등록 하시겠습니까?");
	
	const fetchUrl = await fetch("<c:url value='/admin/prodInsert.do'/>", {
		//option
		method: 'POST',
		headers: {
			'Content-Type': 'application/json;charset=utf-8'
		},
		enctype: 'multipart/form-data',
		body: JSON.stringify({
	    	   "uid" : uid.value,
	    	   "uid" : uid.value,
	    	   "uid" : uid.value,
	    	   "uid" : uid.value,
	    	   "uid" : uid.value,
	    	   "uid" : uid.value,
	    	   "uid" : uid.value,
	    	   "uid" : uid.value,
	    	   "uid" : uid.value,
	    	  
	       })
		})
		.then(response => response.json())
		.then(jsonResult => {
			if (jsonResult.status) {
				alert(jsonResult.message);
				location.href = jsonResult.url;
			} else {
				alert(jsonResult.message);
				location.href = jsonResult.url;
			}
		});
	
}
</script>
</html>