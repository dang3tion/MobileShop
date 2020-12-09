<%@ page language="java" contentType="text/html; charset=utf-8;"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="/VIEW/jsp/jsp-component/head-css.jsp" />
<c:url var="url" scope="session" value="/VIEW"></c:url>
<link rel="stylesheet" type="text/css"
	href="${url}/css/css-page/signin.css">

</head>

<body>
	<jsp:include page="/VIEW/jsp/jsp-component/menu.jsp"></jsp:include>
	<!-- Thanh menu loc du lieu va sap xep-->


	<c:import url="/VIEW/jsp/jsp-component/breadcumb.jsp">
		<c:param name="title" value="Admin đăng nhập"></c:param>
	</c:import>
	<link rel="stylesheet" href="${url}/css/AdminLogin.css">
	<!-- form dang nhập -->
	<form action="${pageContext.request.contextPath}/adminlogin"
		method="POST" class="form-signin" id="login">
		<div class="container">
			<div class="row d-flex justify-content-center">
				<div class="col-12">
					<h5 style="color: red">${message}</h5>
				</div>
			</div>
		</div>

		<img class="mb-4" src="${url}/image/img-sys/AdminIcon.png" width="110">
		<h1 class="h3 mb-3 font-weight-normal">Admin đăng nhập</h1>

		<input name="username" id="inputEmail" class="form-control"
			placeholder="Email "> <input name="password" type="password"
			id="inputPassword" class="form-control " placeholder="Mật khẩu">

		<div class="checkbox mb-3"></div>
		<button class="btn btn-lg btn-primary btn-block" type="submit">Đăng
			nhập</button>
		<p class="mt-3">
			<a href="${pageContext.request.contextPath}/home">trở về trang
				chủ</a>
		</p>

	</form>


	<jsp:include page="/VIEW/jsp/jsp-component/footer.jsp"></jsp:include>
	<!-- Bootstrap core JavaScript -->
	<jsp:include page="/VIEW/jsp/jsp-component/footer-admin.jsp"></jsp:include>
	<c:url var="url" scope="application" value="/VIEW"></c:url>
	<script src="${url}/js/js-page/form-login.js"></script>
</body>

</html>

