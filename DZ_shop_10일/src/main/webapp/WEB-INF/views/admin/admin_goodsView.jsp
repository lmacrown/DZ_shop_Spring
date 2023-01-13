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
						제목 : ${goods.goods_title}
					</h3>
					
						<label>분류 : ${goods.goods_sort}
						</label><br/>
						<br><label>작가 : ${goods.goods_writer}
						</label><br/>
						<br><label>내용 : ${goods.goods_intro}
						</label><br/>
						<br><label>가격 : ${goods.goods_price}
						</label><br/>
						<br><label>이미지 : <img width="121" height="154" style="align-items: center;"
								src="${path}/thumbnails.do?goods_id=${goods.goods_id}&fileName=${goods.goods_title}">
						</label><br/>
					
						<div style="width: 300px; margin-top:10px; justify-content: space-between; ">

							<button type="button" onClick="location.href='${path}/admin/admin_post.do'">뒤로가기</button>
							<input type="button" id="update" value="수정하기" 
							onclick="location.href='${path}/admin/goodsFix.do?goods_id=${goods.goods_id}'">
							<button type="button" id="delete" 
							onclick="location.href='${path}/admin/goodsDelete.do?goods_id=${goods.goods_id}'">삭제</button>
						</div>
					
				</form>
			</div>
		</div>
	</div>
<script type="text/javascript">

</script>
</body>
</html>
