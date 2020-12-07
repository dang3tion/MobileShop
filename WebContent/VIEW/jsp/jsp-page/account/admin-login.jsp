<%@ page language="java" contentType="text/html; charset=utf-8;"
	pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="en">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<jsp:include page="/VIEW/jsp/jsp-component/head-css.jsp" />
<c:url var="url" scope="application" value="/VIEW"></c:url>
<link rel="stylesheet" type="text/css"
	href="${url}/css/css-page/signin.css">


</head>

<body>
	<jsp:include page="/VIEW/jsp/jsp-component/menu.jsp"></jsp:include>
	<!-- Thanh menu loc du lieu va sap xep-->


	<c:import url="/VIEW/jsp/jsp-component/breadcumb.jsp">
		<c:param name="title" value="Nhập OTP"></c:param>
	</c:import>
	<link rel="stylesheet" href="${url}/css/AdminLogin.css">
	<!-- form dang nhập -->
	<form action="${pageContext.request.contextPath}/adminlogin"
		method="POST" class="form-signin" id="login">
		<div class="container">
			<div class="row d-flex justify-content-center">
				<div class="col-12">
					<h2>${message}</h2>
				</div>
			</div>
		</div>

		<img class="mb-4" src="${url}/image/img-sys/AdminIcon.png" width="110">
		<h1 class="h3 mb-3 font-weight-normal">Admin đăng nhập</h1>

		<input name="email" id="inputEmail" class="form-control"
			placeholder="Email "> <input name="password" type="password"
			id="inputPassword" class="form-control " placeholder="Mật khẩu">

		<div class="checkbox mb-3"></div>
		<button class="btn btn-lg btn-primary btn-block" type="submit">Đăng
			nhập</button>
		<p class="mt-3">
			<a href="${pageContext.request.contextPath}/index">trở về trang
				chủ</a>
		</p>

	</form>


	<jsp:include page="/VIEW/jsp/jsp-component/footer.jsp"></jsp:include>
	<!-- Bootstrap core JavaScript -->

	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<c:url var="url" scope="application" value="/VIEW"></c:url>
	<script src="${url}/js/js-page/form-login.js"></script>
</body>

</html>

