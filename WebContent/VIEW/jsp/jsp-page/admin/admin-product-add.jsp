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
<link rel="stylesheet" href="${url }/css/css-page/detail-product.css">
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
							<div class="frame" style="box-shadow: 1px 1px 3px -1px #5f5f5f;">
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
											<select name="branch">
												<c:forEach items="${listBranch }" var="b">
													<option value="${b.id}">${b.name }</option>
												</c:forEach>
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
												<option value="Đang bán">Đang bán</option>
												<option value="Hết hàng">Hết hàng</option>
												<option value="Ngưng kinh doanh">Ngưng kinh doanh</option>

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

							<div class="frame-number" id="color-1"
								style="width: 94%; box-shadow: 1px 1px 3px -1px #5f5f5f;">

								<h5>Màu sắc sản phấm</h5>
								<div class="frame-cog-content">
									<div class="frame">
										<ul class="information">
											<li class="content-input">
												<div class="title">
													<p>Tên màu sắc</p>
												</div>

												<div class="input">
													<select class="" name="color-name">
														<c:forEach items="${listColor }" var="c">

															<option value="${c.idColor }">${c.typeColor }</option>
														</c:forEach>
													</select>
												</div>

											</li>
											<li class="content-input">
												<div class="title">
													<p>Chọn màu sắc</p>
												</div>

												<div class="input">
													<input name="color-rgb" placeHolder="" type="color"
														value="">
												</div>

											</li>
											<li class="content-input">
												<div class="title">
													<p>Chọn ảnh nền</p>
												</div>

												<div class="input">
													<input type="file" id="" name="color-imgmain"
														id="color-imgmain-1" hidden /> <label class="choose-file"
														style="margin: 0;" for="color-imgmain-1">Chọn ảnh</label>
												</div>

											</li>
											<div id="color-sub1">
												<input type="number" id="number-color-sub1" value="2"
													name="number-color-sub1" hidden>
												<li class="content-input">
													<div class="title">
														<p>Chọn ảnh mô tả</p>
													</div>

													<div class="input">
														<input type="file" name="color1" id="color1-sub1" hidden />
														<label class="choose-file" style="margin: 0;"
															for="color1-sub1">Chọn ảnh</label>
													</div>

												</li>
												<li class="content-input">
													<div class="title">
														<p>Chọn ảnh mô tả</p>
													</div>

													<div class="input">
														<input type="file" name="color1" id="color1-sub2" hidden />
														<label class="choose-file" style="margin: 0;"
															for="color1-sub2">Chọn ảnh</label>
													</div>

												</li>

											</div>
											<li class="content-input">
												<div class="title">
													<button class="btn-primary"
														style="box-shadow: 1px 1px 2px 0px #a5a5a5; padding: 5px; border-radius: 3px; outline: 0; border: 0"
														onclick="addSubimg('color-sub1');">Thêm ảnh mô tả</button>
												</div>
											</li>
										</ul>
									</div>
								</div>

							</div>

						</div>
						<div>
							<input type="number" value="1" id="number-color"
								name="number-color" disabled="disabled" hidden>
							<button class="btn-primary" data-toggle="modal"
								data-target="#add-color-btn"
								style="background: #FFC107; margin-right: 30px; float: right; box-shadow: 1px 1px 2px 0px #a5a5a5; padding: 10px; border-radius: 3px; outline: 0; border: 0;">Thêm
								màu sắc</button>
						</div>
					</div>
				</div>

				<script>
					var numberColor = document.getElementById('number-color').value;

					function addColor() {
						numberColor++;
						document.getElementById('number-color').setAttribute(
								'value', numberColor);
						$('#frame-content')
								.append(
										'<div class="frame-number"  id="color-'
												+ numberColor
												+ '" style="width: 94%;box-shadow: 1px 1px 3px -1px #5f5f5f;">'

												+ '<h5>Màu sắc sản phấm</h5>'
												+ '	<div class="frame-cog-content">'
												+ '<div class="frame">'
												+ '	<ul class="information">'
												+ '		<li class="content-input">'
												+ '			<div class="title">'
												+ '					<p>Tên màu sắc</p>'
												+ '				</div>'

												+ '				<div class="input">'
												+ '					<select class="" name="color-name">'
												+ '			<c:forEach items="${listColor }" var="c">'

												+ '		<option value="${c.idColor }">${c.typeColor }</option>'
												+ '		</c:forEach>'
												+ '			</select>'
												+ '				</div>'

												+ '		</li>'
												+ '			<li class="content-input">'
												+ '				<div class="title">'
												+ '					<p>Chọn màu sắc</p>'
												+ '				</div>'

												+ '				<div class="input">'
												+ '					<input name="color-rgb" placeHolder="" type="text" value="">'
												+ '				</div>'

												+ '			</li>'
												+ '		<li class="content-input">'
												+ '			<div class="title">'
												+ '					<p>Chọn ảnh nền</p>'
												+ '				</div>'

												+ '				<div class="input">'
												+ '				<input type="file" name="color-imgmain" id="color-imgmain-'+numberColor+'" hidden /> <label'
												+ '					class="choose-file" style="margin: 0;" for="color-imgmain-'+numberColor+'">Chọn'
												+ '											ảnh</label>'
												+ '					</div>'

												+ '				</li>'
												+ '				<div id="color-sub'+numberColor+'">'

												+ '		<input type="number" id="number-color-sub'+numberColor+'"'
												+ '			 value="1" name="number-color-sub1"'
												+ '			hidden>'
												+ '					<li class="content-input">'
												+ '						<div class="title">'
												+ '							<p>Chọn ảnh mô tả</p>'
												+ '						</div>'

												+ '						<div class="input">'
												+ '							<input type="file"  name="color'+numberColor+'" id="color'+numberColor+'-sub1" hidden /> <label'
								+ '								class="choose-file" style="margin: 0;" for="color'+numberColor+'-sub1">Chọn'
												+ '								ảnh</label>'
												+ '						</div>'

												+ '					</li>'

												+ '				</div>'
												+ '				<li class="content-input">'
												+ '					<div class="title">'
												+ '					<button class="btn-primary"'
												+ '							style="box-shadow: 1px 1px 2px 0px #a5a5a5; padding: 5px; border-radius: 3px; outline: 0; border: 0"'
												+ '							onclick="addSubimg(\'color-sub'
												+ numberColor + '\');"'
												+ '>Thêm ảnh mô tả</button>'
												+ '					</div>' + '				</li>'
												+ '			</ul>' + '		</div>'
												+ '		</div>'

												+ '		</div>');
					}
					function addSubimg(id) {
						var numberImgSub = document.getElementById('number-'
								+ id).value;
						var color = id.charAt(id.length - 1);
						numberImgSub++;
						document.getElementById('number-' + id).setAttribute(
								'value', numberImgSub);

						$('#' + id)
								.append(
										'<li class="content-input">'
												+ '<div class="title">'
												+ '<p>Chọn ảnh mô tả</p>'
												+ '	</div>'
												+ '<div class="input">'
												+ '	<input type="file"  name="color'+numberColor+'" id="color'+color+'-'+'sub'+numberImgSub+'" hidden /> <label'
							+'		class="choose-file" style="margin: 0;" for="color'+color+'-'+'sub'+numberImgSub+'">Chọn'
												+ '		ảnh</label> </div>'
												+ '</li>')

					}
				</script>

				<!-- color -->



				<!-- thong so ki thuat -->
				<div class="">


					<div class="modal-content modal-attribute"
						style="width: 90%; margin: auto; margin-top: 90px;">
						<div class="modal-header" style="text-align: center;">
							<h5 class="modal-title" id="exampleModalLongTitle"
								style="font-size: 20px; padding-left: 20px; font-size: 21px;">Thông
								số kỹ thuật</h5>

						</div>
						<div class="modal-body" style="padding-bottom: 0px"
							id="table-attribute">

							<c:forEach items="${arrMap }" var="att" varStatus="x">
								<ul class="modal-attribute" id="${att.key.id }">

									<div class="title-attribute">${att.key.name }</div>
									<c:forEach items="${att.value }" var="attri" varStatus="lo">
										<li class="item" id="${att.key.id }-item${lo.index+1 }">
											<div class="title">
												<select class=""
													style="min-width: 240px; padding: 3px; outline: 0; border: 1px solid #b7b7b7; border-radius: 3px;"
													name="att-id">
													<c:forEach items="${attri }" var="i">
														<option value="${i.id }">${i.title }</option>
													</c:forEach>
												</select>
											</div>
											<div class="value">

												<div class="input">
													<input
														style="border: 1px solid #b7b7b7; outline: 0; padding: 2px 5px; border-radius: 3px; min-width: 300px;"
														name="att-value" type="text" value="">
												</div>

											</div>
											<div class="button">

												<button class="btn btn-warning mb-2"
													onclick="deleteAttribute('${att.key.id}-item${lo.index+1 }')">Xóa</button>

											</div>

										</li>
									</c:forEach>


								</ul>
								<div class="item">
									<button class="btn btn-primary"
										onclick="getListAttribute('${att.key.id}')"
										style="outline: 0; border: 0; border-radius: 3px; margin: 10px 10px;">Thêm</button>
								</div>
							</c:forEach>

						</div>

					</div>
				</div>
				<script>
					function addAttribute(id) {
						var el = document.getElementById(id)
								.getElementsByClassName('item');
						var count = el.length;
						count++;
						var log = id.charAt(id.length - 1);
						$("#" + id)
								.append(
										'<li class="item" id="${ke.id}-item'+count+'">'
												+ '<div class="title">'
												+ '<select class=""'
							+'		style="min-width: 240px; padding: 3px; outline: 0; border: 1px solid #b7b7b7; border-radius: 3px;"'
							+'		name="att-id">'
												+ '		<c:forEach items="${att1}"	 var="i">'

												+ '	<option value="${i.id }">${i.title }</option>'
												+ '</c:forEach>'
												+ '	</select>'
												+ '	</div>'
												+ '	<div class="value">'

												+ '		<div class="input">'
												+ '			<input'
									+'				style="border: 1px solid #b7b7b7; outline: 0; padding: 2px 5px; border-radius: 3px; min-width: 300px;"'
										+'				name="att-value" type="text" value="">'
												+ '		</div>'

												+ '	</div>'
												+ '	<div class="button">'

												+ '	<button class="btn btn-warning mb-2"'
												+ '		onclick="deleteAttribute(\'${ke.id}-item'
												+ count + '\')">Xóa</button>'

												+ '	</div>'

												+ '	</li>');

					}
					function deleteAttribute(id) {
						$("#" + id).remove();
					}
				</script>

				<div class="form-group space-top">
					<h5 class="spacing_form">Giới thiệu sản phẩm</h5>

					<div
						style="border: 1px solid #dadada; padding: 15px; border-radius: 5px;">
						<!-- (2): textarea sẽ được thay thế bởi CKEditor -->

						<textarea name="productTopic" id="editor">${value}</textarea>
						<button class="btn btn-primary col-sm-3 row"
							style="margin: 15px 0px;" type="submit">Lưu</button>
					</div>
					<!-- (3): Code Javascript thay thế textarea có id='editor1' bởi CKEditor -->
					<script src="${url}/js/js-static/ckeditor/ckeditor.js"></script>
					<script src="${url}/js/js-static/ckeditor/samples/js/sample.js"></script>
					<script>
						initSample();
					</script>
				</div>
				<div class="modal fade" id="delete-attribute" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Xóa thông số
									kỹ thuật</h5>
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
			</div>
		</div>

		<!-- /#page-content-wrapper -->
	</div>
	<!-- Modal -->
	<div class="modal fade" id="add-color-btn" tabindex="-1" role="dialog"
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
					<button type="button" onclick="addColor();" id="btnAddColor"
						data-dismiss="modal" class="btn btn-primary">Đồng ý</button>
				</div>
			</div>
		</div>
	</div>



	<script type="text/javascript">
		function getListAttribute(ID) {

			$.ajax({
				type : 'POST',
				url : '${pageContext.request.contextPath}/AJAXAdminAddProduct',
				data : {

					IDAttribute : ID

				},
				success : function(response) {
					$('#'+ID).append(response);
				}

			});

		}
	</script>



	<%-- 	<script src="${url}/js/js-page/addProduct.js"></script> --%>
</body>
</html>
