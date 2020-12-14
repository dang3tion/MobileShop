<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<jsp:include page="/VIEW/jsp/jsp-component/head-css.jsp" />
<c:url var="url" scope="session" value="/VIEW"></c:url>
<link rel="stylesheet" type="text/css"
	href="${url}/css/css-page/signin.css">
</head>

<body>
	<jsp:include page="/VIEW/jsp/jsp-component/menu.jsp"></jsp:include>
<c:import url="/VIEW/jsp/jsp-component/filter.jsp">
	</c:import>

	<%--breadcumb--%>
	<c:import url="/VIEW/jsp/jsp-component/breadcumb.jsp">
		<c:param name="title" value="Đăng ký"></c:param>
	</c:import>
	<!-- Page Content -->


	<!-- Page Content -->
	<form style="margin-top: -55px"
		action="${pageContext.request.contextPath}/register" method="post"
		onsubmit="return checkRegister()" class="form-signin" id="register">

		<div class="form-signin color_tt" id="login">

			<img class="mb-4" src="${url}/image/img-sys/register.png" alt=""
				width="100" height="100">
			<h1 class="h3 mb-3 font-weight-normal">Đăng kí tài khoản mới</h1>
			<label style="margin-bottom: -25px" for="recipient-name" class="d-flex justify-content-start align-baseline col-form-label">Email:</label>
			<input name="email" type="text" id="inputemail" class="form-control"
				onfocusout="check_email(this.id)" placeholder="Email">
			<div class="require mt-1 ml-5" id="require-email">Vui lòng nhập
				đúng định dạng email</div>
				<label style="margin-bottom: -25px" for="recipient-name" class="d-flex justify-content-start align-baseline col-form-label">Mật khẩu:</label>
			<input name="password" type="password" id="inputPassword"
				class="form-control" placeholder="Mật Khẩu"
				onfocusout="check_password(this.id)">
			<div class="require" id="require-password">Mật khẩu tối thiểu 8
				ký tự, bao gồm chữ và số</div>
				<label style="margin-bottom: -25px" for="recipient-name" class="d-flex justify-content-start align-baseline col-form-label">Nhập lại mật khẩu:</label>
			<input type="password" id="inputPassword-confirm"
				class="form-control" placeholder="Nhập lại mật khẩu"
				onfocusout="check_password2(this.id,'inputPassword')">
			<div class=" require" id="require-password2">Nhập lại mật khẩu
				không khớp</div>
			<h5 style="color: red">${message}</h5>
			<br /> <a href="${pageContext.request.contextPath}/login">Quay
				lại trang đăng nhập</a>
			<button class="btn btn-lg btn-primary btn-block">Đăng kí</button>
		</div>
	</form>

	<jsp:include page="/VIEW/jsp/jsp-component/footer.jsp"></jsp:include>

	<script src="${url}/js/js-page/form-register.js"></script>
</body>

</html>