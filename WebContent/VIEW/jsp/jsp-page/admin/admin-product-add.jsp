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
<link href="${url}/css/css-page/admin1.css" type="text/css"
	rel="stylesheet" />
</head>

<body>
	<!-- Page Content -->
	<div class="d-flex" id="wrapper">
		<c:import url="/VIEW/jsp/jsp-component/sidebar-admin.jsp">
			<c:param name="listProductactive" value="active"></c:param>
		</c:import>

		<!-- /#sidebar-wrapper -->

		<!-- Page Content -->
		<div id="page-content-wrapper">

			<!-- 		toggle logout -->
			<jsp:include page="/VIEW/jsp/jsp-component/toggle-logout-bar.jsp"></jsp:include>


			<div class="container mt-5 " style="width: 95%">
				<h2 style="text-align: center;">Thêm sản phẩm</h2>
				<form action="${pageContext.request.contextPath}/admin/product-add"
					method="post">
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
									name="nameProduct" placeholder="Nhập tên sản phẩm">
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
									placeholder="20.000.000" name="price">
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
									placeholder="Nhập tên thương hiệu" name="brand">
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
									placeholder="20.000.000" name="priceSale">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 space-top">
							<h5 class="spacing_form">Loại sản phẩm</h5>
							<select class="form-control w" id="exampleFormControlSelect1"
								name="type">
								<option value="Mới">Mới</option>
								<option value="Cũ">Cũ</option>
							</select>
						</div>
						<div class="col-sm-6 space-top">
							<h5 class="spacing_form ">Trình trạng</h5>
							<select class="form-control w" id="exampleFormControlSelect1">
								<option value="Đang bán">Đang bán</option>
								<option value="Ngưng bán">Ngưng bán</option>
							</select>
						</div>
						<div class="col-sm-6 space-top">
							<h5 class="spacing_form">Số lượng</h5>
							<div class="input-group mb-2">
								<div class="input-group-prepend">
									<div class="input-group-text">
										<i class="fas fa-tag "></i>
									</div>
								</div>
								<input type="number" class="form-control py-4" value=""
									placeholder="Nhập số lượng" name="quatity">
							</div>
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
										<input class="form-control w " value=""
											placeholder="Nhập màu sắc">
									</div>
								</div>

								<div class="col-4 space-top">
									<h5 class="spacing_form ">URL hình ảnh nền</h5>
									<input class="mt-2" type="file" accept=".jpg,.png,.jpge">
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



					<div class="form-group space-top">
						<h5 class="spacing_form">Giới thiệu sản phẩm</h5>

						<div
							style="border: 1px solid #dadada; padding: 15px; border-radius: 5px;">
							<!-- (2): textarea sẽ được thay thế bởi CKEditor -->
							<form action="${pageContext.request.contextPath}/admin/xxxxx"
								method="GET" style="margin-top: 70px; border: 1px solid black">
								<textarea name="productTopic" id="editor">${value}</textarea>
								<button class="btn btn-primary col-sm-3 row"
									style="margin: 15px 0px;" type="submit">Lưu</button>
							</form>
						</div>
						<!-- (3): Code Javascript thay thế textarea có id='editor1' bởi CKEditor -->
						<script src="${url}/js/js-static/ckeditor/ckeditor.js"></script>
						<script src="${url}/js/js-static/ckeditor/samples/js/sample.js"></script>
						<script>
							initSample();
						</script>
					</div>

					<hr>
					<!-- thong so ki thuat -->
					<h3 class="text-center">Thông số kĩ thuật</h3>
					<div class="row">
						<div class="col-12 space-top">
							<h5 class="spacing_form">Màn hình</h5>
							<div class="input-group mb-2">
								<div class="input-group-prepend">
									<div class="input-group-text">
										<i class="fas fa-mobile-alt"></i>
									</div>
								</div>
								<input type="text" class="form-control py-4 mr-4" value=""
									placeholder="Nhập thông số màn hình">
								<div class="input-group-prepend">
									<div class="input-group-text">
										<i class="fas fa-at"></i>
									</div>
								</div>
								<input type="text" class="form-control py-4 mr-4" value=""
									placeholder="Nhập giá trị tương đuong">
								<button class="btn btn-danger" title="Xóa thuộc tính này">
									<span><i class="fas fa-trash-alt"></i></span>
								</button>
							</div>

						</div>
						<div class="col-12 space-top">
							<h5 class="spacing_form">Hệ điều hành</h5>
							<div class="input-group mb-2">
								<div class="input-group-prepend">
									<div class="input-group-text">
										<i class="fas fa-cogs"></i>
									</div>
								</div>
								<input type="text" class="form-control py-4 mr-4" value=""
									placeholder="Nhập tên hệ điều hành">
								<div class="input-group-prepend">
									<div class="input-group-text">
										<i class="fas fa-at"></i>
									</div>
								</div>
								<input type="text" class="form-control py-4 mr-4" value=""
									placeholder="Nhập giá trị tương đuong">
								<button class="btn btn-danger" title="Xóa thuộc tính này">
									<span><i class="fas fa-trash-alt"></i></span>
								</button>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-12 space-top">
							<h5 class="spacing_form">Camera sau</h5>
							<div class="input-group mb-2">
								<div class="input-group-prepend">
									<div class="input-group-text">
										<i class="fas fa-camera"></i>
									</div>
								</div>
								<input type="text" class="form-control py-4 mr-4" value=""
									placeholder="Nhập thông số camera sau">
								<div class="input-group-prepend">
									<div class="input-group-text">
										<i class="fas fa-at"></i>
									</div>
								</div>
								<input type="text" class="form-control py-4 mr-4" value=""
									placeholder="Nhập giá trị tương đuong">
								<button class="btn btn-danger" title="Xóa thuộc tính này">
									<span><i class="fas fa-trash-alt"></i></span>
								</button>
							</div>
						</div>
						<div class="col-12 space-top">
							<h5 class="spacing_form">Camera trước</h5>
							<div class="input-group mb-2">
								<div class="input-group-prepend">
									<div class="input-group-text">
										<i class="fas fa-camera"></i>
									</div>
								</div>
								<input type="text" class="form-control py-4 mr-4" value=""
									placeholder="Nhập thông số camera trước">
								<div class="input-group-prepend">
									<div class="input-group-text">
										<i class="fas fa-at"></i>
									</div>
								</div>
								<input type="text" class="form-control py-4 mr-4" value=""
									placeholder="Nhập giá trị tương đuong">
								<button class="btn btn-danger" title="Xóa thuộc tính này">
									<span><i class="fas fa-trash-alt"></i></span>
								</button>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-12 space-top">
							<h5 class="spacing_form">CPU</h5>
							<div class="input-group mb-2">
								<div class="input-group-prepend">
									<div class="input-group-text">
										<i class="fas fa-hdd"></i>
									</div>
								</div>
								<input type="text" class="form-control py-4 mr-4" value=""
									placeholder="Nhập thông số CPU">
								<div class="input-group-prepend">
									<div class="input-group-text">
										<i class="fas fa-at"></i>
									</div>
								</div>
								<input type="text" class="form-control py-4 mr-4" value=""
									placeholder="Nhập giá trị tương đuong">
								<button class="btn btn-danger" title="Xóa thuộc tính này">
									<span><i class="fas fa-trash-alt"></i></span>
								</button>
							</div>
						</div>
						<div class="col-12 space-top">
							<h5 class="spacing_form">Bộ nhớ</h5>
							<div class="input-group mb-2">
								<div class="input-group-prepend">
									<div class="input-group-text">
										<i class="fas fa-sd-card"></i>
									</div>
								</div>
								<input type="text" class="form-control py-4 mr-4" value=""
									placeholder="Nhập thông số bộ nhớ">
								<div class="input-group-prepend">
									<div class="input-group-text">
										<i class="fas fa-at"></i>
									</div>
								</div>
								<input type="text" class="form-control py-4 mr-4" value=""
									placeholder="Nhập giá trị tương đuong">
								<button class="btn btn-danger" title="Xóa thuộc tính này">
									<span><i class="fas fa-trash-alt"></i></span>
								</button>
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
							<input type="text" class="form-control py-4 mr-4" value=""
								placeholder="Nhập loại kết nối">
							<div class="input-group-prepend">
								<div class="input-group-text">
									<i class="fas fa-at"></i>
								</div>
							</div>
							<input type="text" class="form-control py-4 mr-4" value=""
								placeholder="Nhập giá trị tương đuong">
							<button class="btn btn-danger" title="Xóa thuộc tính này">
								<span><i class="fas fa-trash-alt"></i></span>
							</button>
						</div>
					</div>
					<div class="space-top">
						<h5 class="spacing_form">Tên thông số kỹ thuật mới</h5>
						<div class="input-group mb-2">
							<div class="input-group-prepend">
								<div class="input-group-text">
									<i class="fas fa-cog"></i>
								</div>
							</div>
							<input type="text" class="form-control py-4 mr-4" value=""
								placeholder="Nhập loại tên thông số kỹ thuật mới">
							<div class="input-group-prepend">
								<div class="input-group-text">
									<i class="fas fa-at"></i>
								</div>
							</div>
							<input type="text" class="form-control py-4 mr-4" value=""
								placeholder="Nhập giá trị tương đuong">
							<button data-target="#delete-attribute" data-toggle="modal"
								data-toggle="tooltip" class="btn btn-danger"
								title="Xóa thuộc tính này">
								<span><i class="fas fa-trash-alt"></i></span>
							</button>
						</div>
					</div>
					<a data-target="#add-attribute" data-toggle="modal"
						data-toggle="tooltip" style="float: right; color: white;" name="1"
						class="btn icon-btn btn-success mt-2"> <span><i
							style="font-size: 1.2em;" class="fa fa-plus-circle"
							aria-hidden="true"></i></span> Thêm thông số kĩ thuật
					</a>

					<div class="modal fade" id="add-attribute" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog" style="max-width: 50%;">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">Thêm thuộc
										tính cho sản phẩm</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">

									<h5>Chọn thuộc tính</h5>
									<div style="float: left">
										<select style="width: 200px;" class="select-choose">
											<option value="Khác">Hệ điều hành</option>
											<option value="Andriod">Kích cỡ màn hình</option>
											<option value="Khác">Bộ nhớ trong</option>
											<option value="Khác">Dung lượng RAM</option>
											<option value="Khác">Camera trước</option>
											<option value="Khác">Camera sau</option>

										</select>
									</div>
									<div style="float: right">
										<a href="#">
											<button class="btn btn-success ">
												<span><i style="font-size: 1.2em; margin: 0px 5px;"
													class="fa fa-plus-circle" aria-hidden="true"></i></span>Tạo thuộc
												tính mới
											</button>
										</a>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">Đóng</button>
									<button type="button" class="btn btn-primary">Lưu</button>
								</div>
							</div>
						</div>
					</div>
					<div class="modal fade" id="delete-attribute" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">Xóa thông
										số kỹ thuật</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<p>Bạn có muốn xóa thuộc tính này của sản phẩm?</p>

								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-primary">Xóa</button>
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">Hủy</button>
								</div>
							</div>
						</div>
					</div>
					<div class="row" style="margin-top: 60px;">
						<div class="col-4"></div>
						<div class="col-8">
							<button
								class="btn btn-primary col-sm-3 row space-top space-bottom "
								style="margin: 15px 10px 20px 10px;" type="submit">Thêm
								sản phẩm</button>

						</div>
					</div>
				</form>
			</div>
		</div>

		<!-- /#page-content-wrapper -->
	</div>
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


	<script src="${url}/js/js-page/addProduct.js"></script>
</body>
</html>
