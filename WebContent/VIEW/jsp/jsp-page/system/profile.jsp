<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<jsp:include page="/VIEW/jsp/jsp-component/head-css.jsp" />
<c:url var="url" scope="session" value="/VIEW"></c:url>
<link rel="stylesheet" type="text/css"
	href="${url}/css/css-page/profile.css">
</head>

<%@page import="model_DAO.DAO_IconMenu"%>
<%
	DAO_IconMenu dao = new DAO_IconMenu();
request.setAttribute("color", dao.colorWeb());
%>
<body
	style="color: ${color.colorText};background-color: ${color.colorBody}">
	<jsp:include page="/VIEW/jsp/jsp-component/menu.jsp"></jsp:include>
	<!-- Thanh menu loc du lieu va sap xep-->
	<c:import url="/VIEW/jsp/jsp-component/filter.jsp">
	</c:import>

	<c:import url="/VIEW/jsp/jsp-component/breadcumb.jsp">
		<c:param name="title" value="Thông tin giao nhận hàng"></c:param>
	</c:import>
	<!-- Page Content -->
	<div class=" container m-2 mb-5">

		<div class="row">


			<c:import url="/VIEW/jsp/jsp-component/menu_profile.jsp">
				<c:param name="infoactive" value="active"></c:param>
			</c:import>

			<div class="col-sm-8">
				<form method="post" onsubmit="return checknhap()"
					action="${pageContext.request.contextPath}/member/profile">
					<div id="Card_ThongTinCaNhan" class="card block_component">
						<div class="card-header">
							<span> <img
								src="${url}/image/image-user/product/config.png"
								class=" config card-img-top" alt="..."></span> <span><strong>Chỉnh
									sửa thông tin cá nhân</strong></span>
						</div>
						<div class="card-body">

							<!-- @@@@@@@@@@@@@@@@@ -->
							<div class="row">


								<div class="col-lg-12 col-md-12 col-sm-12">
									<h5 class="spacing_form">Họ tên</h5>
									<div class="input-group mb-2">
										<div class="input-group-prepend">
											<div class="input-group-text">
												<i class="fas fa-user-circle"></i>
											</div>
										</div>
										<input placeholder="hãy nhập họ tên" type="text" name="name"
											class="form-control py-4" value="${CUSTOMER_LOGINED.name}">
									</div>
								</div>

								<div class="col-12">
									<h5 class="spacing_form">SĐT liên hệ</h5>
									<div class="input-group mb-2">
										<div class="input-group-prepend">
											<div class="input-group-text">
												<i class="fas fa-mobile-alt"></i>
											</div>
										</div>
										<input placeholder="Hãy nhập số điện thoại để giao nhận hàng"
											type="text" name="phoneNumber" class="form-control py-4"
											value="${CUSTOMER_LOGINED.phoneNumber}">
									</div>
								</div>
								<div class="col-12">
									<h5 class="spacing_form">Email</h5>
									<div class="input-group mb-2">
										<div class="input-group-prepend">
											<div class="input-group-text">
												<i class="fas fa-mail-bulk"></i>
											</div>
										</div>
										<input type="text" name="email" class="form-control py-4"
											value="${CUSTOMER_LOGINED.email}" disabled>
									</div>
								</div>

								<div class="col-12">
									<h5 class="spacing_form">Ngày tạo</h5>
									<div class="input-group mb-2">
										<div class="input-group-prepend">
											<div class="input-group-text">
												<i class="far fa-clock"></i>
											</div>
										</div>
										<input type="text" class="form-control py-4"
											value="${CUSTOMER_LOGINED.timeCreate}" disabled>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-12">
									<h5 class="spacing_form">Địa chỉ giao hàng mặc định</h5>

									<div class="input-group">
										<div class="input-group-prepend">
											<div class="input-group-text">
												<i class="fas fa-map-marked-alt"></i>
											</div>
										</div>
										<input placeholder="Hãy nhập địa chỉ giao hàng" type="text"
											name="address" class="form-control py-4"
											value="${CUSTOMER_LOGINED.address}">
									</div>
								</div>
							</div>

							<div class="row">


								<div class="col-6">
									<h5 class="spacing_form">Thay đổi mật khẩu</h5>
									<div class="input-group mb-2">
										<div class="input-group-prepend">
											<div class="input-group-text">
												<i class="fas fa-key"></i>
											</div>
										</div>
										<input type="password" name="password" id="changePass"
											onfocusout="check_password(this.id)"
											class="form-control py-4" placeholder="***********">
									</div>
								</div>
								<div class="col-6">
									<h5 class="spacing_form">Nhập lại mật khẩu</h5>
									<div class="input-group mb-2">
										<div class="input-group-prepend">
											<div class="input-group-text">
												<i class="fas fa-key"></i>
											</div>
										</div>
										<input name="repassword" type="password" id="reCheckPass"
											onfocusout="check_password3(this.id,'changePass')"
											class="form-control py-4" placeholder="***********">
									</div>
									<h6 style="color: red; margin-left: 20px; display: none"
										id="displayErr">Mật khẩu không khớp</h6>
								</div>

								<h2 style="color: green">${message}</h2>
							</div>

							<!-- @@@@@@@@@@@@@@@@@ -->

							<button type="submit" class="btn btn-primary spacing_form px-5 "
								style="float: right">
								<i class="far fa-save"></i> Lưu
							</button>
							<a role="button" href="${pageContext.request.contextPath}/index"
								class="btn btn-danger spacing_form px-5 mx-3"
								style="float: right"> <i class="far fa-trash-alt"></i> Hủy
							</a>
						</div>
					</div>
				</form>

			</div>
		</div>
	</div>
	<!-- /.container -->


	<jsp:include page="/VIEW/jsp/jsp-component/footer.jsp"></jsp:include>
	<!-- Bootstrap core JavaScript -->

	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="${url}/js/js-page/form-forgot.js"></script>
</body>

</html>