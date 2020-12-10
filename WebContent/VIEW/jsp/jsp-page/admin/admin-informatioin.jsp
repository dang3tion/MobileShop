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
<link href="${url}/css/css-page/admin-infor.css" type="text/css"
	rel="stylesheet" />
</head>

<body>
	<div class="d-flex" id="wrapper">
		<!-- Sidebar -->

		<c:import url="/VIEW/jsp/jsp-component/sidebar-admin.jsp">
			<c:param name="filteractive" value="active"></c:param>
		</c:import>




		<div id="page-content-wrapper" style="background-color: #e6e6e682;">


			<!-- 		toggle logout -->
			<jsp:include page="/VIEW/jsp/jsp-component/toggle-logout-bar.jsp"></jsp:include>

			<!-- main content page -->
			<div class="container-fluid">
				<div class="frame-cog">
					<h3>Thông tin cửa hàng</h3>
					<div class="save">
						<button data-toggle="modal" data-target="#save">Lưu lại
							toàn bộ</button>
						<div class="modal fade" id="save" tabindex="-1" role="dialog"
							aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLongTitle">Xác
											nhận thay đổi</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">Bạn có muốn xác nhận thay đổi
										này?</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">Không</button>
										<button type="button" onclick="themMau()" id="btnAddColor"
											data-dismiss="modal" class="btn btn-primary">Đồng ý</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="frame-cog-content">
						<div class="frame">
							<h5>Thông tin chung</h5>
							<ul class="information">
								<li class="content-input">
									<div class="title">
										<p>Tên cửa hàng</p>
									</div>

									<div class="input">
										<input type="text" value="asdfassafdsadf">
									</div>

								</li>
								<li class="content-input">
									<div class="title">
										<p>Biểu tượng</p>
									</div>

									<div class="input">
										<input accept="image/png, image/jpeg" type="file" value="">
									</div>

								</li>
								<li class="content-input">
									<div class="title">
										<p>Địa chỉ thực</p>
									</div>
									<div class="input">
										<input type="text">
									</div>
								</li>
								<li class="content-input">
									<div class="title">
										<p>Địa chỉ Facebook</p>
									</div>
									<div class="input">
										<input type="text">
									</div>
								</li>
								<li class="content-input">
									<div class="title">
										<p>Địa chỉ Youtube</p>
									</div>
									<div class="input">
										<input type="text">
									</div>
								</li>
							</ul>
						</div>

						<div class="frame-number">
							<h5>Thông tin liên hệ</h5>
							<div class="tab">
								<div class="title-number">
									<ul>
										<li>Tiêu đề</li>
										<li>Số điện thoại</li>
										<li>Giờ hoạt động</li>
									</ul>
								</div>
								<ul class="number">
									<li>
										<div class="content-number">
											<input type="text" value="asdfassafdsadf">
										</div>
										<div class="content-number">
											<input type="number">
										</div>
										<div class="content-number">
											<input type="text">
										</div>
										<div class="content-number">
											<button>
												<i class="fas  fa-trash-alt"></i>
										</div>
									</li>
								</ul>
							</div>
							<button class="plus">
								<i class="fas fa-plus"></i>
							</button>
						</div>
						<div class="frame-liscen">
							<div class="form-group space-top">
								<h5 class="spacing_form">Chính sách</h5>

								<!-- 								@@@@@@@@@@@@@@@CKEDITOR@@@@@@@@@@@@@@@@@@ -->
								<div class="form-group space-top">
									<h5 class="spacing_form">Giới thiệu sản phẩm</h5>

									<div
										style="border: 1px solid #dadada; padding: 15px; border-radius: 5px;">
										<!-- (2): textarea sẽ được thay thế bởi CKEditor -->
										<form action="${pageContext.request.contextPath}/admin/xxxxx"
											method="GET"
											style="margin-top: 70px; border: 1px solid black">
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
								<!-- 								@@@@@@@@@@@@@@@CKEDITOR@@@@@@@@@@@@@@@@@@ -->



								</form>
							</div>

						</div>
					</div>
				</div>

			</div>

		</div>
</body>

</html>