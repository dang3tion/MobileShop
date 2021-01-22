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
			<c:param name="informationactive" value="active"></c:param>
		</c:import>






		<div id="page-content-wrapper" style="background-color: #e6e6e682;">


			<!-- 		toggle logout -->
			<jsp:include page="/VIEW/jsp/jsp-component/toggle-logout-bar.jsp"></jsp:include>
			<form action="${pageContext.request.contextPath}/employee/information"
				method="POST">
				<!-- main content page -->
				<div class="container-fluid">
					<div class="frame-cog">
						<h3>Thông tin cửa hàng</h3>
						<div class="save">
							<button type="submit">Lưu lại toàn bộ</button>
							
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
											<input name="name" type="text" value="${SHOPINFO.name}">
										</div>

									</li>
									<li class="content-input">
										<div class="title">
											<p>Biểu tượng</p>
										</div>

										<div style="margin-top: -20px" class="input">
											<input type="file" id="actual-btn" hidden /> <label
												class="choose-file" for="actual-btn">Chọn ảnh</label>

										</div>

									</li>
									<li class="content-input">
										<div class="title">
											<p>Địa chỉ thực</p>
										</div>
										<div class="input">
											<input value="${SHOPINFO.address}" name="realAddress"
												type="text">
										</div>
									</li>
									<li class="content-input">
										<div class="title">
											<p>Địa chỉ Facebook</p>
										</div>
										<div class="input">
											<input name="facebookURL" value="${SHOPINFO.URL_facebook}"
												type="text">
										</div>
									</li>
									<li class="content-input">
										<div class="title">
											<p>Địa chỉ Youtube</p>
										</div>
										<div class="input">
											<input name="youtubeURL" value="${SHOPINFO.URL_youtube}"
												type="text">
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

												<i class="fas  fa-trash-alt"></i>
											</div>
										</li>
									</ul>
								</div>
								<button class="plus">
									<i class="fas fa-plus"></i>
								</button>
							</div>
						</div>
					</div>
				</div>

				<div class="frame-liscen">
					<div class="form-group space-top">


						<!-- 								@@@@@@@@@@@@@@@CKEDITOR@@@@@@@@@@@@@@@@@@ -->


						<div
							style="border: 1px solid #dadada; padding: 0px; border-radius: 5px;">
							<!-- (2): textarea sẽ được thay thế bởi CKEditor -->
							<h5 class="spacing_form"
								style="padding: 10px; background-color: #dfdfdf;">Chính
								sách</h5>
							<div>
								<textarea name="policy" id="editor">${SHOPINFO.policy}</textarea>

							</div>
						</div>

						<!-- (3): Code Javascript thay thế textarea có id='editor1' bởi CKEditor -->
						<script src="${url}/js/js-static/ckeditor/ckeditor.js"></script>
						<script src="${url}/js/js-static/ckeditor/samples/js/sample.js"></script>
						<script>
							initSample();
						</script>


						<!-- 								@@@@@@@@@@@@@@@CKEDITOR@@@@@@@@@@@@@@@@@@ -->
					</div>
				</div>
			</form>


		</div>
	</div>




</body>

</html>