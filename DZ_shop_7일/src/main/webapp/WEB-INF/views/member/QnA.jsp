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
	<div style="width: 70%; margin-left: 10%; margin-top: -200px">
		<div class="card-body">
			<div class="px-4 py-5" style="width: 100%">
				<h6 class="card-title">QnA</h6>
				<form style="width: 90%; margin-left: 10px"
				 name="uploadForm" method="post" id="uploadForm"
				 enctype="multipart/form-data">
					<div class="form-group">
						<label for="title">Title</label> <input type="text"
							oninput="btn_status()" class="form-control" id="title"
							placeholder="Title" name="title">
					</div>
					<div class="form-group">
						<label for="content">Content</label>
						<!-- 										<textarea class="form-control"
											style="height: 450px;" id="contents" name="C"></textarea> -->
						<input type="text" style="height: 300px" oninput="btn_status()"
							class="form-control" id="contents" placeholder="contents"
							name="contents">
					</div>

					<div class="form-group">
						<label>Image upload</label> 
						<div class="input-group col-xs-12">
							<input type="file" name="file" id="file"  style="width:100%;background-color: #727CF5; color: white">
						</div>
					</div>
					<div class="row1">
						<div style="width: 150px;">

							<input class="btn btn-outline-info btn-icon-text mr-2 d-none d-md-block"
							style="width: 120px; margin-left: 20px"
							type="submit" value="등록하기" id="register">
							<button type="button" onClick="history.back()">취소</button>
						</div>
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

	let register = document.querySelector("#uploadForm");
	register.addEventListener("submit", (e) => {
		e.preventDefault();
		fetch("<c:url value='/member/fileUpload.do'/>", {		
			method : 'POST',
		    cache: 'no-cache',
			body: new FormData(register)	
		})
		.then(response => response.json())
		.then(jsonResult => {
			if (jsonResult.status==true) {
				alert("문의 등록 성공");
				location.href = jsonResult.url;
			}
			else{
				alert("문의 등록 실패");
			}
		});
		return false;
	});
</script>
</body>
</html>
