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
<style>/* information */
.frame-cog {
	
}

.frame-cog h3 {
	text-align: center;
	/* margin-bottom: 26px; */
	margin: 20px;
}

.frame-cog .frame-cog-content {
	
}

.frame-cog .frame-cog-content .frame {
	background-color: white;
	padding: 30px;
	margin: auto;
	width: 95%;
	border-radius: 7px;
}

.frame-cog-content .frame h5 {
	margin-bottom: 25px;
}

.frame .information {
	
}

.frame .information .content-input {
	display: flex;
	margin: 10px;
}

.frame .information .content-input .title {
	min-width: 230px;
	color: #484848;
}

.frame .information .content-input .input {
	
}

.frame .information .content-input .input input[type="text"] {
	color: #505050;
	min-width: 450px;
	padding: 6px 6px;
	font-size: 16px;
	outline: 0px;
	border: 1px solid rgb(158, 158, 158);
	border-radius: 3px;
}

.frame .information .content-input .input input[type="file"] {
	color: #505050;
	min-width: 450px;
	padding: 6px 6px;
	font-size: 16px;
	outline: 0px;
	border-radius: 3px;
}

.frame .information .content-input .symbol {
	
}
/* number */
.frame-number h5 {
	margin-bottom: 25px;
}

.frame-number {
	padding: 30px;
	margin: 30px 0px 20px 30px;
	background-color: white;
	width: 70%;
	padding: 30px;
	border-radius: 7px;
}

.frame-number .title-number {
	
}

.frame-number .title-number ul {
	padding: 2px;
	display: flex;
	text-align: center;
	background-color: #c3c3c36e;
	color: black;
}

.frame-number .title-number li {
	margin: 0px auto;
}

.frame-number .number {
	
}

.frame-number .number li {
	display: flex;
}

.frame-number .number li .content-number {
	margin: 0px auto;
}

.frame-number .number li .content-number input {
	color: #505050;
	min-width: 200px;
	padding: 4px 6px;
	font-size: 16px;
	outline: 0px;
	border: 1px solid rgb(158, 158, 158);
	border-radius: 3px;
}

.frame-number .number li .content-number button {
	margin: 0px 10px;
	border-radius: 4px;
	padding: 2px 5px;
	border: 0;
	outline: 0;
	font-size: 16px;
	color: #ffffff;
	background-color: #f44336;
	transition: all ease-in 0.2s;
}

.frame-number .number li .content-number button:hover {
	background-color: #b60e02;
}

.frame-number .plus {
	border-radius: 3px;
	border: 5px;
	background: #2196f3;
	border: 0;
	font-size: 14px;
	color: white;
	padding: 3px 7px;
	transition: all ease-in 0.2s;
}

.frame-number .plus:hover {
	background: #0865b1;
}

.tab {
	padding-bottom: 10px;
	background-color: whitesmoke;
}

.frame-liscen {
	margin: 0px 30px;
	padding: 30px 30px;
	border-radius: 10px;
	background-color: white;
}

.save {
	width: 95%;
	margin: auto;
	overflow: auto;
}

.save button {
	min-width: 100px;
	border-radius: 5px;
	padding: 10px;
	border: 0;
	float: right;
	background: #2196f3;
	color: white;
	border: 1px solid #50637575;
	transition: all ease-in 0.2s;
}

.save button:hover {
	background: #0068bd;
}
</style>
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
								<form action="" method="post">

									<!-- (2): textarea sẽ được thay thế bởi CKEditor -->
									<textarea id="edit" name="edit" cols="200" rows="80">
  
                      </textarea>

									<!-- (3): Code Javascript thay thế textarea có id='editor1' bởi CKEditor -->
									<script>
										CKEDITOR.replace('edit');
									</script>

								</form>
							</div>

						</div>
					</div>
				</div>

			</div>

		</div>
</body>

</html>