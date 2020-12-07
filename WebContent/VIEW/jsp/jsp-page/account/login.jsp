<%@ page language="java" contentType="text/html; charset=utf-8;"
	pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="en">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<jsp:include page="/VIEW/jsp/jsp-component/head-css.jsp" />
<%@ page import="model.utility.Config"%>

<c:url var="url" scope="application" value="/VIEW"></c:url>
<link rel="stylesheet" type="text/css"
	href="${url}/css/css-page/signin.css">

</head>

<body>
	<jsp:include page="/VIEW/jsp/jsp-component/menu.jsp"></jsp:include>
	<!-- Thanh menu loc du lieu va sap xep-->

	<c:import url="/VIEW/jsp/jsp-component/breadcumb.jsp">
		<c:param name="title" value="Đăng nhập"></c:param>
	</c:import>

	<!-- Page Content -->
	<form onsubmit="" action="${pageContext.request.contextPath}/login"
		method="POST">
		<div class="form-signin color_tt" id="login">
			<img class="mb-4" src="${url}/image/img-sys/user.png" width="72"
				height="72">
			<h1 class="h3 mb-3 font-weight-normal">Đăng nhập</h1>

			<input type="text" name="email" id="inputEmail" class="form-control"
				placeholder="Email hoặc số điện thoại" value=""
				onfocusout=" check_email(this.id)">
			<div class="require" id="require-email">
				Yêu cầu nhập email theo đúng theo định dạng email <br>Ví dụ:
				nlumobile@gmail.com
			</div>
			<input type="password" id="inputPassword" name="password"
				class="form-control " placeholder="Mật khẩu" value=""
				onfocusout="check_password(this)">
			<div class="require" id="require-password">Mật khẩu phải có ít
				nhất 8 ký tự</div>
			<h5 style="color: red">${message}</h5>
			<div class="checkbox mb-3">
				<a href="${pageContext.request.contextPath}/forgot" class="mx-2">Quên
					mật khẩu</a> <a href="${pageContext.request.contextPath}/register"
					class="mx-2">Đăng kí</a>
			</div>

			<button class="btn btn-lg btn-primary btn-block" type="submit">
				Đăng nhập</button>

			<div class="or-seperator">
				<b>hoặc</b>
			</div>

			<a id="google-login-button" href="${Config.GOOGLE_URL_HREF_JSP}"
				class="btn btn-danger btn-lg  btn-block" role="button"
				aria-pressed="true"><i id="icon-google"
				class="fab fa-google-plus-g mr-3" aria-hidden="true"></i> Đăng nhập
				bằng google</a>



		</div>
	</form>



	<!-- /.container -->


	<jsp:include page="/VIEW/jsp/jsp-component/footer.jsp"></jsp:include>

	<c:url var="url" scope="application" value="/VIEW"></c:url>
	<script src="${url}/js/js-page/form-login.js"></script>
</body>

</html>