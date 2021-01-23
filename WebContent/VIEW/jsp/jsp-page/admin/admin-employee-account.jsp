<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<c:url var="url" scope="page" value="/VIEW"></c:url>
<jsp:include page="/VIEW/jsp/jsp-component/head-css-admin.jsp"></jsp:include>
<link href="${url }/css/css-page/admin1.css" style="sheet">
</head>

<body>

	<div class="d-flex" id="wrapper">
		<!-- Sidebar left -->
		<c:import url="/VIEW/jsp/jsp-component/sidebar-admin.jsp">
			<c:param name="employeeaccountactive" value="active"></c:param>
		</c:import>
		<!-- Page right -->
		<div id="page-content-wrapper">
			<!-- 		toggle logout -->
			<jsp:include page="/VIEW/jsp/jsp-component/toggle-logout-bar.jsp"></jsp:include>
			<!-- 			main content -->
			<div class="container-fluid " style="padding: 50px;">
				<div class="mb-5 mt-3 "></div>

				<h1>svzvzvzvz</h1>
				<h1>svzvzvzvz</h1>
				<h1>svzvzvzvz</h1>
				<h1>svzvzvzvz</h1>
				<h1>svzvzvzvz</h1>
				<h1>svzvzvzvz</h1>
				<h1>svzvzvzvz</h1>
				<h1>svzvzvzvz</h1>
				<h1>svzvzvzvz</h1>
				<h1>svzvzvzvz</h1>
				<h1>svzvzvzvz</h1>
				<h1>svzvzvzvz</h1>
				<h1>svzvzvzvz</h1>

			</div>
		</div>
	</div>
</body>
</html>
