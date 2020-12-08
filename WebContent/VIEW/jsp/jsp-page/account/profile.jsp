<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<jsp:include page="/VIEW/jsp/jsp-component/head-css.jsp" />
<c:url var="url" scope="application" value="/VIEW"></c:url>
<link rel="stylesheet" type="text/css"
	href="${url}/css/css-page/profile.css">
</head>

<body>
	<jsp:include page="/VIEW/jsp/jsp-component/menu.jsp"></jsp:include>
	<!-- Thanh menu loc du lieu va sap xep-->
	<%--<jsp:include page="/VIEW/jsp/jsp-component/filter.jsp"></jsp:include>--%>

	<%--breadcumb--%>
	<!-- Page Content -->
	<div class=" container m-2 mb-5">

		<div class="row">
			<jsp:include page="/VIEW/jsp/jsp-page/account/menu_profile.jsp"></jsp:include>
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
										<input type="text" name="name" class="form-control py-4"
											value="Nguyễn Dũng">
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
										<input type="text" name="numPhone" class="form-control py-4"
											value="0954547984">
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
											value="vandung123@gmail.com" disabled>
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
											value="13/10/2020" disabled>
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
										<input type="text" name="address" class="form-control py-4"
											value="Khu Phố 6, Phường Linh Trung, Quận Thủ Đức">
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
										<input type="text" name="password" id="changePass"
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
										<input name="repassword" type="text" id="reCheckPass"
											onfocusout="check_password3(this.id,'changePass')"
											class="form-control py-4" placeholder="***********">
									</div>
									<h6 style="color: red; margin-left: 20px; display: none"
										id="displayErr">Mật khẩu không khớp</h6>
								</div>

								<h2 style="color: red">${message}Tàikhoản đã tồn tại</h2>
							</div>

							<!-- @@@@@@@@@@@@@@@@@ -->

							<button type="" class="btn btn-primary spacing_form px-5 "
								style="float: right">
								<i class="far fa-save"></i> Lưu
							</button>
							<button href="#" class="btn btn-danger spacing_form px-5 mx-3"
								style="float: right">
								<i class="far fa-trash-alt"></i> Hủy
							</button>
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