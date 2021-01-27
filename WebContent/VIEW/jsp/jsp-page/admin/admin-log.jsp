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
			<c:param name="logactive" value="active"></c:param>
		</c:import>
		<!-- Page right -->
		<div id="page-content-wrapper">
			<!-- 		toggle logout -->
			<jsp:include page="/VIEW/jsp/jsp-component/toggle-logout-bar.jsp"></jsp:include>
			<!-- 			main content -->
			<div class="container-fluid " style="padding: 50px;">

				<div class="border mb-2">
					<h4 class="text-center mt-3 mb-3">Lịch sử quản trị</h4>
					<div class="row"></div>
					<table class="table table-hover">
						<thead class="thead-light">
							<tr>
								<th scope="col">Ngày câp nhật</th>
								<th scope="col">Nhân viên</th>
								<th scope="col">Nội dung</th>
								<th scope="col">Chi tiết</th>
							</tr>
						</thead>
						<tbody id="content-table">
							
							
							<c:forEach items="${listLog}" var="log">
								<td>${log.date}</td>
							<td>${log.name}</td>
							<td>${log.content}</td>
							<td>${log.detail}</td>
							</c:forEach>
							
						</tbody>
					</table>
					<div class="page-navigation" id="page-navigation" value="3">
						<div class="beta">
							<button onclick="previousPage()">Trước</button>
							<span id="page-number"> </span>
							<button onclick="nextPage()">Sau</button>
						</div>
					</div>
				</div>
				<input id="curent-page" value="2" style="display: none"></input>

			</div>

		</div>
	</div>

	<script src="${url}/js/js-page/devide-page-admin.js"></script>

</body>
</html>
