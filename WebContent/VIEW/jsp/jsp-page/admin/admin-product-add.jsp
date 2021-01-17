<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<html lang="en">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<c:url var="url" scope="page" value="/VIEW"></c:url>
<jsp:include page="/VIEW/jsp/jsp-component/head-css-admin.jsp"></jsp:include>
<link href="${url}/css/css-page/admin-user.css" type="text/css"
	rel="stylesheet" />
<link href="${url}/css/css-page/admin1.css" type="text/css"
	rel="stylesheet" />
<link href="${url}/css/css-page/admin-infor.css" type="text/css"
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
		<div id="page-content-wrapper" style="background-color: #e6e6e682;">

			<!-- 		toggle logout -->
			<jsp:include page="/VIEW/jsp/jsp-component/toggle-logout-bar.jsp"></jsp:include>


			<div class="container mt-5 " style="width: 95%">


				<div class="container-fluid">
					<div class="frame-cog">
						<h3>Thêm sản phẩm mới</h3>
						<div class="save">
							<button type="submit">Lưu lại toàn bộ</button>

						</div>
						<div class="frame-cog-content" id="frame-content">
							<div class="frame">
								<h5>Thông tin chung</h5>
								<ul class="information">
									<li class="content-input">
										<div class="title">
											<p>Tên sản phẩm</p>
										</div>

										<div class="input">
											<input name="name" placeHolder="Nhập tên sản phẩm"
												type="text" value="">
										</div>

									</li>
									<li class="content-input">
										<div class="title">
											<p>Thương hiệu</p>
										</div>
										<div class="input">
											<select class="" name="type">
												<option value="Mới">Mới</option>
												<option value="Cũ">Cũ</option>
											</select>
										</div>


									</li>
									<li class="content-input">
										<div class="title">
											<p>Loại sản phẩm</p>
										</div>
										<div class="input">
											<select class="" name="type">
												<option value="Mới">Mới</option>
												<option value="Cũ">Cũ</option>
											</select>
										</div>
									</li>
									<li class="content-input">
										<div class="title">
											<p>Tình trạng</p>
										</div>
										<div class="input">
											<select class="" name="type">
												<option value="Mới">Mới</option>
												<option value="Cũ">Cũ</option>
											</select>
										</div>
									</li>
									<li class="content-input">
										<div class="title">
											<p>Giá bán (VND)</p>
										</div>
										<div class="input">
											<input name="name" type="text" value="">
										</div>
									</li>
									<li class="content-input">
										<div class="title">
											<p>Giá bán khuyến mãi (VND)</p>
										</div>
										<div class="input">
											<input name="name" type="text" value="">
										</div>
									</li>
									<li class="content-input">
										<div class="title">
											<p>Giá bán (VND)</p>
										</div>
										<div class="input">
											<input type="file" id="actual-btn" hidden /> <label
												class="choose-file" for="actual-btn">Chọn ảnh</label>
										</div>
									</li>
								</ul>
							</div>

							<div class="frame-number" style="width: 94%;">

								<h5>Màu sắc sản phấm</h5>
								<div class="frame-cog-content">
									<div class="frame">
										<ul class="information">
											<li class="content-input">
												<div class="title">
													<p>Tên màu sắc</p>
												</div>

												<div class="input">
													<input name="name" placeHolder="Nhập tên màu sắc"
														type="text" value="">
												</div>

											</li>
											<li class="content-input">
												<div class="title">
													<p>Chọn màu sắc</p>
												</div>

												<div class="input">
													<input name="color" placeHolder="" type="text" value="">
												</div>

											</li>
											<li class="content-input">
												<div class="title">
													<p>Chọn ảnh nền</p>
												</div>

												<div class="input">
													<input type="file" id="actual-btn" hidden /> <label
														class="choose-file" style="margin: 0;" for="actual-btn">Chọn
														ảnh</label>
												</div>

											</li>
											<div id="color-sub1">
												<li class="content-input">
													<div class="title">
														<p>Chọn ảnh mô tả</p>
													</div>

													<div class="input">
														<input type="file" id="actual-btn" hidden /> <label
															class="choose-file" style="margin: 0;" for="actual-btn">Chọn
															ảnh</label>
													</div>

												</li>
												<li class="content-input">
													<div class="title">
														<p>Chọn ảnh mô tả</p>
													</div>

													<div class="input">
														<input type="file" id="actual-btn" hidden /> <label
															class="choose-file" style="margin: 0;" for="actual-btn">Chọn
															ảnh</label>
													</div>

												</li>
											</div>
											<li class="content-input">
												<div class="title">
													<button class="btn-primary"
														style="box-shadow: 1px 1px 2px 0px #a5a5a5; padding: 5px; border-radius: 3px; outline: 0; border: 0"
														onclick="addSubimg('â');">Thêm ảnh mô tả</button>
												</div>
											</li>
										</ul>
									</div>
								</div>

							</div>
							<div class="frame-number" style="width: 94%;">

								<h5>Màu sắc sản phấm</h5>
								<div class="frame-cog-content">
									<div class="frame">
										<ul class="information">
											<li class="content-input">
												<div class="title">
													<p>Tên màu sắc</p>
												</div>

												<div class="input">
													<input name="name" placeHolder="Nhập tên màu sắc"
														type="text" value="">
												</div>

											</li>
											<li class="content-input">
												<div class="title">
													<p>Chọn màu sắc</p>
												</div>

												<div class="input">
													<input name="color" placeHolder="" type="text" value="">
												</div>

											</li>
											<li class="content-input">
												<div class="title">
													<p>Chọn ảnh nền</p>
												</div>

												<div class="input">
													<input type="file" id="actual-btn" hidden /> <label
														class="choose-file" style="margin: 0;" for="actual-btn">Chọn
														ảnh</label>
												</div>

											</li>
											<div id="color-sub1">
												<li class="content-input">
													<div class="title">
														<p>Chọn ảnh mô tả</p>
													</div>

													<div class="input">
														<input type="file" id="actual-btn" hidden /> <label
															class="choose-file" style="margin: 0;" for="actual-btn">Chọn
															ảnh</label>
													</div>

												</li>
												<li class="content-input">
													<div class="title">
														<p>Chọn ảnh mô tả</p>
													</div>

													<div class="input">
														<input type="file" id="actual-btn" hidden /> <label
															class="choose-file" style="margin: 0;" for="actual-btn">Chọn
															ảnh</label>
													</div>

												</li>
											</div>
											<li class="content-input">
												<div class="title">
													<button class="btn-primary"
														style="box-shadow: 1px 1px 2px 0px #a5a5a5; padding: 5px; border-radius: 3px; outline: 0; border: 0"
														onclick="addSubimg('â');">Thêm ảnh mô tả</button>
												</div>
											</li>
										</ul>
									</div>
								</div>

							</div>
						</div>
						<div>
							<button class="btn-primary"
								style="background: #FFC107; margin-right: 30px; float: right; box-shadow: 1px 1px 2px 0px #a5a5a5; padding: 10px; border-radius: 3px; outline: 0; border: 0;"
								onclick="addColor('â');">Thêm màu sắc</button>
						</div>
					</div>
				</div>

				<script>
					function addSubimg(id) {
						var ele = document.getElementById(id);
						$("#color-sub1")
								.append(
										'<li class="content-input">'
												+ '<div class="title">'
												+ '<p>Chọn ảnh mô tả</p>'
												+ '	</div>'
												+ '<div class="input">'
												+ '	<input type="file" id="actual-btn" hidden /> <label'
							+'		class="choose-file" style="margin: 0;" for="actual-btn">Chọn'
												+ '		ảnh</label> </div>'
												+ '</li>')

					}

					function addColor(id) {
						$('#frame-content')
								.append(
										'<div class="frame-number" style="width: 94%;">'

												+ '<h5>Màu sắc sản phấm</h5>'
												+ '	<div class="frame-cog-content">'
												+ '<div class="frame">'
												+ '	<ul class="information">'
												+ '		<li class="content-input">'
												+ '			<div class="title">'
												+ '					<p>Tên màu sắc</p>'
												+ '				</div>'

												+ '				<div class="input">'
												+ '					<input name="name" placeHolder="Nhập tên màu sắc"'
								+ '						type="text" value="">'
												+ '				</div>'

												+ '		</li>'
												+ '			<li class="content-input">'
												+ '				<div class="title">'
												+ '					<p>Chọn màu sắc</p>'
												+ '				</div>'

												+ '				<div class="input">'
												+ '					<input name="color" placeHolder="" type="text" value="">'
												+ '				</div>'

												+ '			</li>'
												+ '		<li class="content-input">'
												+ '			<div class="title">'
												+ '					<p>Chọn ảnh nền</p>'
												+ '				</div>'

												+ '				<div class="input">'
												+ '				<input type="file" id="actual-btn" hidden /> <label'
								+ '						class="choose-file" style="margin: 0;" for="actual-btn">Chọn'
												+ '											ảnh</label>'
												+ '					</div>'

												+ '				</li>'
												+ '				<div id="color-sub1">'
												+ '					<li class="content-input">'
												+ '						<div class="title">'
												+ '							<p>Chọn ảnh mô tả</p>'
												+ '						</div>'

												+ '						<div class="input">'
												+ '							<input type="file" id="actual-btn" hidden /> <label'
								+ '								class="choose-file" style="margin: 0;" for="actual-btn">Chọn'
												+ '								ảnh</label>'
												+ '						</div>'

												+ '					</li>'
												+ '					<li class="content-input">'
												+ '						<div class="title">'
												+ '							<p>Chọn ảnh mô tả</p>'
												+ '						</div>'

												+ '						<div class="input">'
												+ '							<input type="file" id="actual-btn" hidden /> <label'
								+ '								class="choose-file" style="margin: 0;" for="actual-btn">Chọn'
												+ '								ảnh</label>'
												+ '						</div>'

												+ '					</li>'
												+ '				</div>'
												+ '				<li class="content-input">'
												+ '					<div class="title">'
												+ '					<button class="btn-primary"'
												+ '							style="box-shadow: 1px 1px 2px 0px #a5a5a5; padding: 5px; border-radius: 3px; outline: 0; border: 0"'
												+ '							onclick="addSubimg(a);">Thêm ảnh mô tả</button>'
												+ '					</div>' + '				</li>'
												+ '			</ul>' + '		</div>'
												+ '		</div>'

												+ '		</div>');
					}
					addSubimg('â');
				</script>
				<form action="${pageContext.request.contextPath}/admin/product-add"
					method="post">

					<!-- color -->


					<div class="form-group space-top" style="margin-top: 50px">
						<h5 class="spacing_form" style="margin-left: 10px;">Giới
							thiệu sản phẩm</h5>

						<div
							style="border: 1px solid #dadada; padding: 15px; border-radius: 5px; background: white;">
							<!-- (2): textarea sẽ được thay thế bởi CKEditor -->

							<textarea name="topic" id="editor">${value}</textarea>

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

	<script type="text/javascript">
		/// thêm màu
		var dem = 1;
		function themMau() {
			dem++;
			document.getElementById("countColor").value = dem;
			console.log(dem);
			/// lấy số lượng form hiện tại
			var current = document.getElementById("btnAddColor").name;
			n = parseInt(current) + 1;

			$("#color")
					.append(
							"<div>"
									+ ' <div class="boder-color">'
									+ '        <div class="row boder-color1">'
									+ '          <div class="col-4 space-top " id="chooseColor" name="1">'
									+ '            <h5 class="spacing_form">Màu sắc</h5>'
									+ '            <div class="input-group mb-2 ">'
									+ '              <div class="input-group-prepend">'
									+ '                <div class="input-group-text"><i class="fas fa-mobile-alt"></i></div>'
									+ "              </div>"
									+ '             <input class="form-control w " value="" placeholder="Nhập màu sắc" name="color'+dem+'">'
									+ "            </div>"
									+ "          </div>"
									+ '<div class="col-4 space-top " id="chooseColor" name="1">'
									+ '						<h5 class="spacing_form">Chọn mã màu</h5>'
									+ '						<div class="input-group mb-2 ">'
									+ '							<div class="input-group-prepend">'
									+ '								<div class="input-group-text">'
									+ '									<i class="fas fa-mobile-alt"></i>'
									+ '								</div>'
									+ '							</div>'
									+ '							<input type="color" class="form-control w " value="'+
				'								placeholder="Nhập màu sắc" name="codeColor'+dem+'">'
									+ '						</div>'
									+ '					</div>'
									+

									'          <div class="col-4 space-top">'
									+ '            <h5 class="spacing_form ">URL hình ảnh nền</h5>'
									+ '            <input class="mt-2" type="file" accept=".jpg,.png,.jpge" name ="anhnen'+dem+'">'
									+ "          </div>"
									+

									"        </div>"
									+ '        <div class="row boder-color2">'
									+ '          <div class="col-3 space-top">'
									+ '            <h5 class="spacing_form ">URL ảnh mô tả 1</h5>'
									+ '            <input class="mt-2" type="file" accept=".jpg,.png,.jpge" name="anhMT1'+dem+'">'
									+ "          </div>"
									+ '          <div class="col-3 space-top">'
									+ '            <h5 class="spacing_form ">URL ảnh mô tả 2</h5>'
									+ '            <input class="mt-2" type="file" accept=".jpg,.png,.jpge" name="anhMT2'+dem+'">'
									+ "          </div>"
									+ '          <div class="col-3 space-top">'
									+ '            <h5 class="spacing_form ">URL ảnh mô tả 3</h5>'
									+ '            <input class="mt-2" type="file" accept=".jpg,.png,.jpge" name="anhMT3'+dem+'">'
									+ "          </div>"
									+ '          <div class="col-3 space-top">'
									+ '            <h5 class="spacing_form ">URL ảnh mô tả 4</h5>'
									+ '            <input class="mt-2" type="file" accept=".jpg,.png,.jpge" name="anhMT4'+dem+'">'
									+ "          </div>" + "        </div>"
									+ "      </div>");
			var textnode = document.createTextNode("Demo" + n);
			node.appendChild(textnode);
			document.getElementById("addColorForm").appendChild(node);

			///cập nhật lại số lượng form
			document.getElementById("btnAddColor").name = parseInt(current) + 1;
		}

		function thongSoKt() {
			/// lấy số lượng form hiện tại
			var current = document.getElementById("btnAddColor").name;
			n = parseInt(current) + 1;

			$("#thongSoMoi")
					.append(
							'<div class="boder-color top-s">'
									+ '<div class="space-top bodertt">'
									+ ' <h5 class="spacing_form">Loại thông số kĩ thuật mới</h5>'
									+ ' <div class="input-group mb-2">'
									+ '   <div class="input-group-prepend">'
									+ '     <div class="input-group-text"></div>'
									+ "   </div>"
									+ '   <input type="text" class="form-control py-4" value="" placeholder="Nhập tên thông số kĩ thuật mới">'
									+ " </div>"
									+ '   <h5 class="spacing_form">Nội dung thông số kĩ thuật mới</h5>'
									+ ' <div class="input-group mb-2">'
									+ '   <div class="input-group-prepend">'
									+ '     <div class="input-group-text"></i></div>'
									+ "   </div>"
									+ '   <input type="text" class="form-control py-4" value="" placeholder="Nhập nội dung">'
									+ " </div>" + "</div>" + "</div>");
			var textnode = document.createTextNode("Demo" + n);
			node.appendChild(textnode);
			document.getElementById("addColorForm").appendChild(node);

			///cập nhật lại số lượng form
			document.getElementById("btnAddColor").name = parseInt(current) + 1;
		}

		function thongSoKt() {
			/// lấy số lượng form hiện tại
			var current = document.getElementById("btnAddColor").name;
			n = parseInt(current) + 1;

			$("#thongSoMoi")
					.append(
							'<div class="boder-color top-s">'
									+ '<div class="space-top bodertt">'
									+ ' <h5 class="spacing_form">Loại thông số kĩ thuật mới</h5>'
									+ ' <div class="input-group mb-2">'
									+ '   <div class="input-group-prepend">'
									+ '     <div class="input-group-text"></div>'
									+ "   </div>"
									+ '   <input type="text" class="form-control py-4" value="" placeholder="Nhập tên thông số kĩ thuật mới">'
									+ " </div>"
									+ '   <h5 class="spacing_form">Nội dung thông số kĩ thuật mới</h5>'
									+ ' <div class="input-group mb-2">'
									+ '   <div class="input-group-prepend">'
									+ '     <div class="input-group-text"></i></div>'
									+ "   </div>"
									+ '   <input type="text" class="form-control py-4" value="" placeholder="Nhập nội dung">'
									+ " </div>" + "</div>" + "</div>");
			var textnode = document.createTextNode("Demo" + n);
			node.appendChild(textnode);
			document.getElementById("addColorForm").appendChild(node);

			///cập nhật lại số lượng form
			document.getElementById("btnAddColor").name = parseInt(current) + 1;
		}
	</script>

	<%-- 	<script src="${url}/js/js-page/addProduct.js"></script> --%>
</body>
</html>
