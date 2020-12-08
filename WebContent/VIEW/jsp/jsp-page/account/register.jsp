<%@ page language="java" contentType="text/html; charset=utf-8"
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


	<%--breadcumb--%>
	<c:import url="/VIEW/jsp/jsp-component/breadcumb.jsp">
		<c:param name="title" value="Đăng ký"></c:param>
	</c:import>
	<!-- Page Content -->

	<form action="${pageContext.request.contextPath}/register"
		method="post" onsubmit="return checkRegister()" class="form-signin"
		id="register">
		<img class="mb-4" src="${url}/image/img-sys/register.png" alt=""
			width="100" height="100">
		<h1 class="h3 mb-3 font-weight-normal">Đăng kí tài khoản mới</h1>
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12">
				<div class="frame-register">
					<div class="form-input">
						<i class="fas fa-user"></i> <input name="name" type="text"
							id="inputame" class="form-control" placeholder="Họ tên"
							onfocusout="check_name(this.id)">
					</div>
					<div class="require mt-1 ml-5" id="require-lname">Họ tên
						không được để trống</div>
					<div class="require mt-1 ml-5" id="require-lname2">Họ tên
						Không bao gồm các ký tự đặc biệt</div>
				</div>
			</div>

			<div class="col-lg-12 col-md-12 col-sm-12">
				<div class="frame-register">
					<div class="form-input">
						<label class="">+84</label> <input type="number"
							name="phoneNumber" class=" form-control" id="inputphone"
							placeholder="Nhập số điện thoại "
							onfocusout="check_phone(this.id)">
					</div>
					<div class="require mt-1 ml-5" id="require-phone">Vui lòng
						nhập đúng số điện thoại</div>
				</div>
			</div>
			<div class="col-lg-12 col-md-12 col-sm-12">
				<div class="frame-register">

					<div class="form-input">
						<i class="fas fa-key"></i> <input name="password" type="password"
							id="inputPassword" class="form-control" placeholder="Mật Khẩu"
							onfocusout="check_password(this.id)">
					</div>
					<div class="require mt-1 ml-5" id="require-password">Mật khẩu
						tối thiểu 8 ký tự, bao gồm chữ và số</div>
				</div>
			</div>
			<div class="col-lg-12 col-md-12 col-sm-12">
				<div class="frame-register">

					<div class="form-input">
						<i class="fas fa-key"></i> <input type="password"
							id="inputPassword-confirm" class="form-control"
							placeholder="Nhập lại mật khẩu"
							onfocusout="check_password2(this.id,'inputPassword')">
					</div>
					<div class=" require mt-1 ml-5" id="require-password2">Nhập
						lại mật khẩu không khớp</div>
				</div>
			</div>
			<div class="col-lg-12 col-md-12 col-sm-12">
				<div class="frame-register">

					<div class="form-input">
						<i class="fas fa-map-marked-alt"></i> <input name="address"
							type="text" class="form-control" placeholder="Địa chỉ ">
					</div>
					<!-- <div class="require mt-1 ml-5" id="require-name"> Tên không được để trống </div>
                <div class="require mt-1 ml-5" id="require-name2">Không bao gồm các ký tự đặc biệt </div> -->
				</div>
			</div>
			<div class="col-lg-12 col-md-12 col-sm-12">
				<div class="frame-register">

					<div class="form-input">
						<i class="fas fa-mail-bulk"></i> <input name="email" type="text"
							id="inputemail" class="form-control"
							onfocusout="check_email(this.id)" placeholder="Email">
					</div>

					<div class="require mt-1 ml-5" id="require-email">Vui lòng
						nhập đúng định dạng email</div>
				</div>
			</div>


		</div>


		</div>
		<h5 style="color: red">${message}</h5>
		<div class="checkbox">
			<br /> <a href="${pageContext.request.contextPath}/login">Quay lại trang đăng nhập</a>
		</div>
		<button class="btn btn-lg btn-primary btn-block">Đăng kí</button>

	</form>
	<!-- /.container -->


	<jsp:include page="/VIEW/jsp/jsp-component/footer.jsp"></jsp:include>
	<!-- Bootstrap core JavaScript -->

	 
	   
	<script src="${url}/js/js-page/form-register.js"></script>
</body>

</html>