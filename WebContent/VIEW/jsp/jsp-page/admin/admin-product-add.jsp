<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<c:url var="url" scope="page" value="/VIEW"></c:url>
<jsp:include page="/VIEW/jsp/jsp-component/head-css-admin.jsp"></jsp:include>
<link href="${url}/css/css-page/admin-user.css" type="text/css"
	rel="stylesheet" />
</head>

<body>
	<!-- Page Content -->
	<div class="d-flex" id="wrapper">
		<!-- Sidebar -->
		<jsp:include page="/VIEW/jsp/jsp-component/sidebar-admin.jsp"></jsp:include>
		<!--Nav-->

		<!-- /#sidebar-wrapper -->

		<!-- Page Content -->
		<div id="page-content-wrapper">

			<nav
				class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
				<button class="btn btn-primary" id="menu-toggle">
					<i class="fas fa-bars"></i>
				</button>
				<div class=""></div>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav ml-auto mt-2 mt-lg-0">
						<li class="nav-item active"><a class="nav-link" href="#"
							data-toggle="modal" data-target="#log-out">Đăng xuất <span
								class="log-out"><i class="fas fa-arrow-right"></i></span></a></li>
						<!-- <li class="nav-item">
              <a class="nav-link" href="#">Link</a>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                aria-haspopup="true" aria-expanded="false">
                Dropdown
              </a>
              <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                <a class="dropdown-item" href="#">Action</a>
                <a class="dropdown-item" href="#">Another action</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#">Something else here</a>
              </div>
            </li> -->
					</ul>
					<div class="modal fade" id="log-out" tabindex="-1" role="dialog"
						aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLongTitle">Xác
										nhận đăng xuất</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">Bạn có muốn đăng xuất?</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">Hủy</button>
									<button type="button" class="btn btn-primary">Đăng
										xuất</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</nav>
			<div class="container mt-5 " style="width: 95%">
				<h2 style="text-align: center;">Thêm sản phẩm</h2>
				<form>
					<div class="row">
						<div class="col-6 space-top">
							<h5 class="spacing_form">Tên sản phẩm</h5>
							<div class="input-group mb-2">
								<div class="input-group-prepend">
									<div class="input-group-text">
										<i class="fas fa-mobile-alt"></i>
									</div>
								</div>
								<input type="text" class="form-control py-4" value=""
									placeholder="Nhập tên sản phẩm">
							</div>
						</div>
						<div class="col-6 space-top">
							<h5 class="spacing_form">Giá bán(VND)</h5>
							<div class="input-group mb-2">
								<div class="input-group-prepend">
									<div class="input-group-text">
										<i class="fas fa-dollar-sign"></i>
									</div>
								</div>
								<input type="text" class="form-control py-4" value=""
									placeholder="20.000.000">
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-6 space-top">
							<h5 class="spacing_form">Tên Thương hiệu</h5>
							<div class="input-group mb-2">
								<div class="input-group-prepend">
									<div class="input-group-text">
										<i class="fas fa-mobile-alt"></i>
									</div>
								</div>
								<input type="text" class="form-control py-4" value=""
									placeholder="Nhập tên thương hiệu">
							</div>
						</div>
						<div class="col-6 space-top">
							<h5 class="spacing_form">Giá bán Khuyến mãi(VND)</h5>
							<div class="input-group mb-2">
								<div class="input-group-prepend">
									<div class="input-group-text">
										<i class="fas fa-dollar-sign"></i>
									</div>
								</div>
								<input type="text" class="form-control py-4" value=""
									placeholder="20.000.000">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 space-top">
							<h5 class="spacing_form">Loại sản phẩm</h5>
							<select class="form-control w" id="exampleFormControlSelect1">
								<option>Mới</option>
								<option>Cũ</option>
							</select>
						</div>
						<div class="col-sm-6 space-top">
							<h5 class="spacing_form ">Trình trạng</h5>
							<select class="form-control w" id="exampleFormControlSelect1">
								<option>Còn hàng</option>
								<option>Hết hàng</option>
							</select>
						</div>
					</div>


					<!-- color -->
					<div id="color">
						<div class="boder-color">
							<div class="row boder-color1">
								<div class="col-4 space-top " id="chooseColor" name="1">
									<h5 class="spacing_form">Màu sắc</h5>
									<div class="input-group mb-2 ">
										<div class="input-group-prepend">
											<div class="input-group-text">
												<i class="fas fa-mobile-alt"></i>
											</div>
										</div>
										<select name="" class="form-control w ">
											<option value="">Đen</option>
											<option value="">Trắng</option>
											<option class="active" value="">Đỏ</option>
											<option value="">Xanh</option>
											<option value="">Hồng</option>
											<option value="">Lam</option>
										</select>
									</div>
								</div>

								<div class="col-4 space-top">
									<h5 class="spacing_form ">URL hình ảnh nền</h5>
									<input class="mt-2" type="file" accept=".jpg,.png,.jpge">
								</div>



								<div class="col-4 space-top">
									<h5 class="spacing_form">Số lượng</h5>
									<div class="input-group mb-2">
										<div class="input-group-prepend">
											<div class="input-group-text">
												<i class="fas fa-tag "></i>
											</div>
										</div>
										<input type="number" class="form-control py-4" value=""
											placeholder="Nhập số lượng">
									</div>
								</div>
							</div>


							<div class="row boder-color2">
								<div class="col-3 space-top">
									<h5 class="spacing_form ">URL ảnh mô tả 1</h5>
									<input class="mt-2" type="file" accept=".jpg,.png,.jpge">
								</div>
								<div class="col-3 space-top">
									<h5 class="spacing_form ">URL ảnh mô tả 2</h5>
									<input class="mt-2" type="file" accept=".jpg,.png,.jpge">
								</div>
								<div class="col-3 space-top">
									<h5 class="spacing_form ">URL ảnh mô tả 3</h5>
									<input class="mt-2" type="file" accept=".jpg,.png,.jpge">
								</div>
								<div class="col-3 space-top">
									<h5 class="spacing_form ">URL ảnh mô tả 4</h5>
									<input class="mt-2" type="file" accept=".jpg,.png,.jpge">
								</div>
							</div>
						</div>
					</div>

					<!-- add color -->
					<a data-toggle="modal" data-target="#themMau" style="float: right;"
						name="1" class="btn icon-btn btn-success" href="#"> <span><i
							style="font-size: 1.2em;" class="fa fa-plus-circle"
							aria-hidden="true"></i></span> Thêm màu
					</a>



					<div class="form-group space-top" style="margin-top: 70px;">
						<h5 class="spacing_form">Giới thiệu sản phẩm</h5>
						<form action="" method="post">

							<!-- (2): textarea sẽ được thay thế bởi CKEditor -->
							<form action="${pageContext.request.contextPath}/admin/xxxxx"
								method="GET">
								<textarea name="productTopic" id="editor">${value}</textarea>
								<button type="submit">Lưu</button>
							</form>

							<!-- (3): Code Javascript thay thế textarea có id='editor1' bởi CKEditor -->
							<script src="${url}/js/js-static/ckeditor/ckeditor.js"></script>
							<script src="${url}/js/js-static/ckeditor/samples/js/sample.js"></script>
							<script>
								initSample();
							</script>



						</form>
					</div>

					<hr>
					<!-- thong so ki thuat -->
					<h3 class="text-center">Thông số kĩ thuật</h3>
					<div class="row">
						<div class="col-6 space-top">
							<h5 class="spacing_form">Màn hình</h5>
							<div class="input-group mb-2">
								<div class="input-group-prepend">
									<div class="input-group-text">
										<i class="fas fa-mobile-alt"></i>
									</div>
								</div>
								<input type="text" class="form-control py-4" value=""
									placeholder="Nhập thông số màn hình">
							</div>
						</div>
						<div class="col-6 space-top">
							<h5 class="spacing_form">Hệ điều hành</h5>
							<div class="input-group mb-2">
								<div class="input-group-prepend">
									<div class="input-group-text">
										<i class="fas fa-cogs"></i>
									</div>
								</div>
								<input type="text" class="form-control py-4" value=""
									placeholder="Nhập tên hệ điều hành">
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-6 space-top">
							<h5 class="spacing_form">Camera sau</h5>
							<div class="input-group mb-2">
								<div class="input-group-prepend">
									<div class="input-group-text">
										<i class="fas fa-camera"></i>
									</div>
								</div>
								<input type="text" class="form-control py-4" value=""
									placeholder="Nhập thông số camera sau">
							</div>
						</div>
						<div class="col-6 space-top">
							<h5 class="spacing_form">Camera trước</h5>
							<div class="input-group mb-2">
								<div class="input-group-prepend">
									<div class="input-group-text">
										<i class="fas fa-camera"></i>
									</div>
								</div>
								<input type="text" class="form-control py-4" value=""
									placeholder="Nhập thông số camera trước">
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-6 space-top">
							<h5 class="spacing_form">CPU</h5>
							<div class="input-group mb-2">
								<div class="input-group-prepend">
									<div class="input-group-text">
										<i class="fas fa-hdd"></i>
									</div>
								</div>
								<input type="text" class="form-control py-4" value=""
									placeholder="Nhập thông số CPU">
							</div>
						</div>
						<div class="col-6 space-top">
							<h5 class="spacing_form">Bộ nhớ</h5>
							<div class="input-group mb-2">
								<div class="input-group-prepend">
									<div class="input-group-text">
										<i class="fas fa-sd-card"></i>
									</div>
								</div>
								<input type="text" class="form-control py-4" value=""
									placeholder="Nhập thông số bộ nhớ">
							</div>
						</div>
					</div>
					<div class="space-top">
						<h5 class="spacing_form">Kết nối</h5>
						<div class="input-group mb-2">
							<div class="input-group-prepend">
								<div class="input-group-text">
									<i class="fas fa-wifi"></i>
								</div>
							</div>
							<input type="text" class="form-control py-4" value=""
								placeholder="Nhập loại kết nối">
						</div>
					</div>

					<div id="thongSoMoi">
						<div class="boder-color top-s">
							<div class="space-top bodertt">
								<h5 class="spacing_form">Loại thông số kĩ thuật mới</h5>
								<div class="input-group mb-2">
									<div class="input-group-prepend">
										<div class="input-group-text"></div>
									</div>
									<input type="text" class="form-control py-4" value=""
										placeholder="Nhập tên thông số kĩ thuật mới">
								</div>

								<h5 class="spacing_form">Nội dung thông số kĩ thuật mới</h5>
								<div class="input-group mb-2">
									<div class="input-group-prepend">
										<div class="input-group-text">
											</i>
										</div>
									</div>
									<input type="text" class="form-control py-4" value=""
										placeholder="Nhập nội dung">
								</div>
							</div>
						</div>
					</div>


					<a onclick="thongSoKt()" style="float: right; color: white;"
						name="1" class="btn icon-btn btn-success"> <span><i
							style="font-size: 1.2em;" class="fa fa-plus-circle"
							aria-hidden="true"></i></span> Thêm thông số kĩ thuật
					</a>


					<div class="row" style="margin-top: 60px;">
						<input
							class="btn btn-primary col-sm-3 row space-top space-bottom "
							type="submit" value="Thêm sản phẩm">
					</div>

				</form>
			</div>
		</div>

		<!-- /#page-content-wrapper -->
	</div>
	<!-- /#wrapper -->
	<!-- Modal -->
	<div class="modal fade" id="themMau" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">Xác nhận
						thêm màu</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">Bạn có muốn thêm màu mới.</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Không</button>
					<button type="button" onclick="themMau()" id="btnAddColor"
						data-dismiss="modal" class="btn btn-primary">Đồng ý</button>
				</div>
			</div>
		</div>
	</div>
	<!-- /#wrapper -->

	<!-- Bootstrap core JavaScript -->

	<!-- Menu Toggle Script -->
	<script>
		$("#menu-toggle").click(function(e) {
			e.preventDefault();
			$("#wrapper").toggleClass("toggled");
		});
	</script>


	<!-- search -->
	<script>
		$(document)
				.ready(
						function() {
							$("#myInput")
									.on(
											"keyup",
											function() {
												var value = $(this).val()
														.toLowerCase();
												$("#content-table tr")
														.filter(
																function() {
																	$(this)
																			.toggle(
																					$(
																							this)
																							.text()
																							.toLowerCase()
																							.indexOf(
																									value) > -1);
																});
											});
						});
	</script>

	<script>
		$(document).ready(function() {
			$('[data-toggle="tooltip"]').tooltip();
		});
	</script>

	<jsp:include page="/VIEW/jsp/jsp-component/footer-admin.jsp"></jsp:include>

	<!-- /.container -->

	<!-- Bootstrap core JavaScript -->
</body>
</html>
