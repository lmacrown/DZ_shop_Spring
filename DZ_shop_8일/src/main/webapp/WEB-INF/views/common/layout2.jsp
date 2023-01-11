<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>  
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${path}/resources/assets/css/demo_1/style.css" />
<link rel="stylesheet"
	href="${path}/resources/assets/css/demo_5/style.css">
<!-- End layout styles -->
<link rel="shortcut icon"
	href="${path}/resources/assets/images/favicon.png" />
</head>

<body class="sidebar-dark">
	<div class="main-wrapper">
		<tiles:insertAttribute name="side" />
		<div class="page-wrapper">
			<div class="navbar" id="header">
				<tiles:insertAttribute name="header" />
			</div>
			<div id="bestItem">
				<tiles:insertAttribute name="bestitem" />
			</div>
			<div id="body">
				<tiles:insertAttribute name="body" />
			</div>
		</div>

	</div>
	
	<script src="${path}/resources/assets/vendors/core/core.js"></script>

		<script src="${path}/resources/assets/vendors/chartjs/Chart.min.js"></script>
		<script
			src="${path}/resources/assets/vendors/jquery.flot/jquery.flot.js"></script>
		<script
			src="${path}/resources/assets/vendors/jquery.flot/jquery.flot.resize.js"></script>
		<script
			src="${path}/resources/assets/vendors/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
		<script
			src="${path}/resources/assets/vendors/apexcharts/apexcharts.min.js"></script>
		<script
			src="${path}/resources/assets/vendors/progressbar.js/progressbar.min.js"></script>
		<!-- end plugin js for this page -->
		<!-- inject:js -->
		<script
			src="${path}/resources/assets/vendors/feather-icons/feather.min.js"></script>
		<script src="${path}/resources/assets/js/template.js"></script>
		<!-- endinject -->
		<!-- custom js for this page -->
		<script src="${path}/resources/assets/js/dashboard.js"></script>
		<script src="${path}/resources/assets/js/datepicker.js"></script>
		<!-- end custom js for this page -->
</body>
</html>
