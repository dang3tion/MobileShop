<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<html lang="en" ng-app="driveApp">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<c:url var="url" scope="page" value="/VIEW"></c:url>

<c:url var="urlDrive" scope="session" value="/VIEW/js/js-static"></c:url>
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
			<div ng-controller="driveController">
				<form action="${pageContext.request.contextPath}/admin/warehouse/product-add"
					method="post">
					<div class="container mt-5 " style="width: 95%">

						<input type="file" id="uploadImage" accept="image/*"
							onchange="angular.element(this).scope().upload()" hidden>

						<div class="container-fluid">
							<div class="frame-cog">
								<h3>Cập nhật sản phẩm</h3>

								<div class="save">
									<a
										href="${pageContext.request.contextPath}/admin/warehouse/manager-product"><button
											type="button" style="float: left">
											<i class="far fa-arrow-alt-circle-left"></i> Quay lại
										</button></a>
									<button type="button" data-toggle="modal"
										data-target="#add-product">Lưu lại toàn bộ</button>

								</div>

								<div class="frame-cog-content" id="frame-content">
									<div class="frame"
										style="box-shadow: 1px 1px 3px -1px #5f5f5f;">
										<div>
											<p style="font-style: italic; color: #2196f3;">
												<i class="fas fa-check-circle"></i> ${reString }
											</p>
										</div>
										<h5>Thông tin chung</h5>
										<ul class="information">
											<li class="content-input">
												<div class="title">
													<p>Tên sản phẩm</p>
												</div>

												<div class="input">
													<input name="name" placeHolder="Nhập tên sản phẩm"
														type="text" value="${product.name }">
												</div>

											</li>
											<li class="content-input">
												<div class="title">
													<p>Thương hiệu</p>
												</div>
												<div class="input">
													<select name="branch">
														<c:forEach items="${listBranch }" var="b">
															<h3>${product.branch.id }</h3>
															<h4>${b.id }</h4>
															<c:choose>
																<c:when test="${b.id==product.branch.id }">
																	<option value="${b.id}" selected>${b.name }</option>
																</c:when>

																<c:otherwise>
																	<option value="${b.id}">${b.name }</option>
																</c:otherwise>

															</c:choose>
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
														<c:choose>
															<c:when test="${product.type=='Mới' }">
																<option value="MOI" selected>Mới</option>
																<option value="CU">Cũ</option>
															</c:when>

															<c:otherwise>
																<option value="MOI">Mới</option>
																<option value="CU" selected>Cũ</option>
															</c:otherwise>

														</c:choose>


													</select>
												</div>
											</li>
											<li class="content-input">
												<div class="title">
													<p>Tình trạng</p>
												</div>
												<div class="input">
													<select class="" name="status">


														<c:choose>
															<c:when test="${product.status=='Đang bán' }">
																<option value="DANG BAN" selected>Đang bán</option>
																<option value="HET HANG">Hết Hàng</option>
																<option value="NGUNG KINH DOANH">Ngưng kinh
																	doanh</option>
															</c:when>
															<c:when test="${product.status=='Hết hàng' }">
																<option value="DANG BAN">Đang bán</option>
																<option value="HET HANG" selected>Hết Hàng</option>
																<option value="NGUNG KINH DOANH">Ngưng kinh
																	doanh</option>
															</c:when>

															<c:otherwise>
																<option value="DANG BAN">Đang bán</option>
																<option value="HET HANG">Hết Hàng</option>
																<option value="NGUNG KINH DOANH" selected>Ngưng
																	kinh doanh</option>
															</c:otherwise>

														</c:choose>


													</select>
												</div>
											</li>
											<li class="content-input">
												<div class="title">
													<p>Giá bán (VND)</p>
												</div>
												<div class="input">
													<input name="price" type="number"
														value="${product.prices.price }"
														placeHolder="Nhập giá bán">
												</div>
											</li>
											<li class="content-input">
												<div class="title">
													<p>Giá bán khuyến mãi (VND)</p>
												</div>
												<div class="input">
													<input name="priceSale" type="number"
														value="${product.prices.priceSales }"
														placeHolder="Nhập giá sau khi khuyến mãi (trường này có thể trống)">
												</div>
											</li>

										</ul>
									</div>
									<c:forEach items="${product.colors }" var="color" varStatus="i">
										<c:set value="${i.index+1 }" var="sizeColor"></c:set>
										<div class="frame-number" id="color-${i.index+1 }"
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
																		<c:choose>
																			<c:when test="${color.id==c.idColor}">
																				<option value="${c.idColor }" selected>${c.typeColor }</option>
																			</c:when>

																			<c:otherwise>
																				<option value="${c.idColor }">${c.typeColor }</option>
																			</c:otherwise>

																		</c:choose>

																	</c:forEach>
																</select>
															</div>

														</li>
														<li class="content-input">
															<div class="title">
																<p>Nhập số lượng</p>
															</div>

															<div class="input">
																<input name="quantity" type="number"
																	value="${color.quantity }">
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
																<input type="text" value="${ color.imgMain}"
																	style="min-width: 310px;" name="color-imgmain"
																	id="color-imgmain-${i.index+1}">
															</div>
															<div class="input">
																<label class="choose-file"
																	style="margin: 0; margin-left: 15px;"
																	onclick="clickFileUpload('color-imgmain-${i.index+1}')">Chọn
																	ảnh</label>
															</div> <img
															style="width: 40; height: 60px; object-fit: contain; margin-left: 10px;"
															id="color-imgmain-${i.index+1 }-img"
															src="${ color.imgMain}">
														</li>


														<div id="color-sub${i.index+1 }">
															<c:forEach items="${color.imgSubs }" var="img"
																varStatus="j">
																<c:if test="${j.last }">
																	<input type="number" id="number-color-sub${i.index+1 }"
																		value="${j.index+1 }"
																		name="number-color-sub${i.index+1 }" hidden>

																</c:if>

																<li class="content-input">
																	<div class="title">
																		<p>Chọn ảnh mô tả</p>
																	</div>

																	<div class="input">
																		<input type="text" value="${ img}" 		style="min-width: 310px;" 
																			name="color${i.index+1 }"
																			id="color${i.index+1 }-sub${j.index+1}" />
																		<!-- <label class="choose-file" style="margin: 0;"
																for="color1-sub1">Chọn ảnh</label> -->
																	</div>
																<div class="input">
																		<label class="choose-file"
																			style="margin: 0; margin-left: 15px;"
																			onclick="clickFileUpload('color${i.index+1}-sub${j.index+1 }')">Chọn
																			ảnh</label>
																	</div> <img
																	style="width: 40; height: 60px; object-fit: contain; margin-left: 10px; "
																	id="color${i.index+1 }-sub${j.index+1 }-img" src="${img }">
																</li>


															</c:forEach>
														</div>
														<li class="content-input">
															<div class="title">
																<button type="button" class="btn-primary"
																	style="box-shadow: 1px 1px 2px 0px #a5a5a5; padding: 5px; border-radius: 3px; outline: 0; border: 0"
																	onclick="addSubimg('color-sub${i.index+1}');">Thêm
																	ảnh mô tả</button>
															</div>
														</li>
													</ul>
												</div>
											</div>

										</div>
									</c:forEach>
								</div>
								<div>
									<input type="number" value="${sizeColor }" id="number-color"
										name="number-color" disabled="disabled" hidden>
									<button type="button" class="btn-primary" data-toggle="modal"
										data-target="#add-color-btn"
										style="background: #FFC107; margin-right: 30px; float: right; box-shadow: 1px 1px 2px 0px #a5a5a5; padding: 10px; border-radius: 3px; outline: 0; border: 0;">Thêm
										màu sắc</button>
								</div>
							</div>
						</div>



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

									<c:forEach items="${listAttribute }" var="att" varStatus="x">
										<c:forEach items="${product.attributes }" var="attPro">
											<c:if test="${att.key.id==attPro.id }">
												<c:set value="${attPro.id }" var="tmp">
												</c:set>
												<ul class="modal-attribute" id="${att.key.id }">

													<div class="title-attribute">${att.key.name }</div>
													<c:forEach items="${attPro.lstAtribute }" var="mapAtt">


														<c:forEach items="${mapAtt.value }" var="it"
															varStatus="mapIndex">
															<li class="item"
																id="${att.key.id }-item${mapIndex.index+1 }">
																<div class="title">
																	<select class=""
																		style="min-width: 240px; padding: 3px; outline: 0; border: 1px solid #b7b7b7; border-radius: 3px;"
																		name="att-id">
																		<c:forEach items="${att.value }" var="i">


																			<c:choose>
																				<c:when test="${i.id==mapAtt.key.id}">
																					<option value="${i.id }" selected>${i.title }</option>


																				</c:when>
																				<c:otherwise>
																					<option value="${i.id }">${i.title }</option>
																				</c:otherwise>
																			</c:choose>

																		</c:forEach>
																	</select>
																</div>
																<div class="value">

																	<div class="input">
																		<input
																			style="border: 1px solid #b7b7b7; outline: 0; padding: 2px 5px; border-radius: 3px; min-width: 300px;"
																			name="att-value" type="text" value="${it }">
																	</div>

																</div>
																<div class="button">

																	<button type="button" class="btn btn-warning mb-2"
																		onclick="deleteAttribute('${att.key.id}-item${mapIndex.index+1 }')">Xóa</button>

																</div>

															</li>
														</c:forEach>


													</c:forEach>
												</ul>


												<div class="item">
													<button type="button" class="btn btn-primary"
														onclick="getListAttribute('${att.key.id}')"
														style="outline: 0; border: 0; border-radius: 3px; margin: 10px 10px;">Thêm</button>
												</div>
											</c:if>

										</c:forEach>
										<c:if test="${tmp!=att.key.id }">

											<ul class="modal-attribute" id="${att.key.id }">

												<div class="title-attribute">${att.key.name }</div>

												<li class="item" id="${att.key.id }-item${x.index+1 }">
													<div class="title">
														<select class=""
															style="min-width: 240px; padding: 3px; outline: 0; border: 1px solid #b7b7b7; border-radius: 3px;"
															name="att-id">
															<c:forEach items="${att.value }" var="attri">
																<option value="${attri.id }">${attri.title }</option>
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

														<button type="button" class="btn btn-warning mb-2"
															onclick="deleteAttribute('${att.key.id}-item${x.index+1 }')">Xóa</button>

													</div>

												</li>


											</ul>
											<div class="item">
												<button type="button" class="btn btn-primary"
													onclick="getListAttribute('${att.key.id}')"
													style="outline: 0; border: 0; border-radius: 3px; margin: 10px 10px;">Thêm</button>
											</div>
										</c:if>
									</c:forEach>

								</div>

							</div>
						</div>


						<div class="form-group space-top">
							<h5 class="spacing_form">Giới thiệu sản phẩm</h5>

							<div
								style="border: 1px solid #dadada; padding: 15px; border-radius: 5px;">
								<!-- (2): textarea sẽ được thay thế bởi CKEditor -->

								<textarea name="introduce" id="editor">${product.posts }</textarea>

							</div>
							<!-- (3): Code Javascript thay thế textarea có id='editor1' bởi CKEditor -->
							<script src="${url}/js/js-static/ckeditor/ckeditor.js"></script>
							<script src="${url}/js/js-static/ckeditor/samples/js/sample.js"></script>
							<script>
								initSample();
							</script>
						</div>
						<div class="modal fade" id="add-product" tabindex="-1"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">Xác nhận
											cập nhật sản phẩm</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<p>Bạn có muốn cập nhật lại dữ liệu sản phẩm sau khi cập nhật toàn bộ dữ liệu sẽ bị thay đổi?</p>

									</div>
									<div class="modal-footer">
										<input type="submit" class="btn btn-primary"
											name="confirm-edit-product" value="Đồng ý">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">Hủy</button>
									</div>
								</div>
							</div>
						</div>
						<div class="modal fade" id="add-color-btn" tabindex="-1"
							role="dialog" aria-labelledby="exampleModalCenterTitle"
							aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLongTitle">Xác
											nhận thêm màu</h5>
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

					</div>
				</form>
			</div>
		</div>
		<!-- /#page-content-wrapper -->
	</div>
	<!-- Modal -->


	<script>
		function deleteAttribute(id) {
			$("#" + id).remove();
		}
	</script>

	<script>
		var numberColor = document.getElementById('number-color').value;

		function addColor() {
			numberColor++;
			document.getElementById('number-color').setAttribute('value',
					numberColor);
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
									+ '	<li class="content-input">'
									+ '	<div class="title">'
									+ '		<p>Nhập số lượng</p>'
									+ '	</div>'

									+ '	<div class="input">'
									+ '		<input name="quantity"  type="number"'
									+ '			value="0">'
									+ '	</div>'

									+ '	</li>'

									+ '			<li class="content-input">'
									+ '				<div class="title">'
									+ '					<p>Chọn màu sắc</p>'
									+ '				</div>'

									+ '				<div class="input">'
									+ '					<input name="color-rgb" placeHolder="" type="color" value="">'
									+ '				</div>'

									+ '			</li>'
									+ '		<li class="content-input">'
									+ '			<div class="title">'
									+ '					<p>Chọn ảnh nền</p>'
									+ '				</div>'

									+ '				<div class="input">'
									+ '				<input type="text" style="min-width: 310px;" name="color-imgmain" id="color-imgmain-'+numberColor+'"  > '
									/* <label'
												+ '					class="choose-file" style="margin: 0;" for="color-imgmain-'+numberColor+'">Chọn'
									+ '											ảnh</label>' */
									+ '					</div>'

									+ '		<div class="input">'
									+ '		<label class="choose-file"'
									+ '			style="margin: 0; margin-left: 15px;"'
									+ '			onclick="clickFileUpload(\'color-imgmain-'
									+ numberColor
									+ '\')">Chọn'
									+ '			ảnh</label>'
									+ '		</div> <img'
									+ '		style="width: 40; height: 60px; object-fit: contain; margin-left: 10px; display:none" '
									+ '		id="color-imgmain-'+numberColor+'-img" src="">'
									+ '				</li>'
									+ '				<div id="color-sub'+numberColor+'">'

									+ '		<input type="number"  id="number-color-sub'+numberColor+'"'
												+ '			 value="1" name="number-color-sub1"'
												+ '			hidden>'
									+ '					<li class="content-input">'
									+ '						<div class="title">'
									+ '							<p>Chọn ảnh mô tả</p>'
									+ '						</div>'

									+ '						<div class="input">'
									+ '							<input type="text"  style="min-width: 310px;" name="color'+numberColor+'" id="color'+numberColor+'-sub1"  > '

									/* 	<label'
								+ '								class="choose-file" style="margin: 0;" for="color'+numberColor+'-sub1">Chọn'
										+ '								ảnh</label>' */
									+ '						</div>'
									+ '	<div class="input">'
									+ '	<label class="choose-file"'
									+ '			style="margin: 0; margin-left: 15px;"'
									+ '			onclick="clickFileUpload(\'color'
									+ numberColor
									+ '-sub1\')">Chọn'
									+ '			ảnh</label>'
									+ '		</div> <img' 
								+ '	style="width: 40; height: 60px; object-fit: contain; margin-left: 10px;  display:none"'
								+ '	id="color'+numberColor+'-sub1-img" src=""> '
									+ '					</li>'

									+ '				</div>'
									+ '				<li class="content-input">'
									+ '					<div class="title">'
									+ '					<button type="button" class="btn-primary"'
									+ '							style="box-shadow: 1px 1px 2px 0px #a5a5a5; padding: 5px; border-radius: 3px; outline: 0; border: 0"'
									+ '							onclick="addSubimg(\'color-sub'
									+ numberColor + '\');"'
									+ '>Thêm ảnh mô tả</button>'
									+ '					</div>' + '				</li>' + '			</ul>'
									+ '		</div>' + '		</div>'

									+ '		</div>');
		}
		function addSubimg(id) {
			var numberImgSub = document.getElementById('number-' + id).value;
			var color = id.charAt(id.length - 1);
			numberImgSub++;
			document.getElementById('number-' + id).setAttribute('value',
					numberImgSub);

			$('#' + id)
					.append(
							'<li class="content-input">'
									+ '<div class="title">'
									+ '<p>Chọn ảnh mô tả</p>'
									+ '	</div>'
									+ '<div class="input">'
									+ '	<input type="text" style="min-width: 310px;"  name="color'+numberColor+'" id="color'+color+'-'+'sub'+numberImgSub+'"  /> '

									/*  <label'
							+'		class="choose-file" style="margin: 0;" for="color'+color+'-'+'sub'+numberImgSub+'">Chọn'
											ảnh</label>  */
									+ '</div>'

									+ '	<div class="input">'
									+ '	<label class="choose-file"'
									+ '			style="margin: 0; margin-left: 15px;"'
									+ '			onclick="clickFileUpload(\'color'
									+ numberColor
									+ '-sub'
									+ numberImgSub
									+ '\')">Chọn'
									+ '			ảnh</label>'
									+ '		</div> <img'
								+ '	style="width: 40; height: 60px; object-fit: contain; margin-left: 10px; display:none" '
								+ '	id="color'+numberColor+'-sub'+numberImgSub+'-img" src="">'

									+ '</li>')

		}
	</script>
	<script type="text/javascript">
		function getListAttribute(ID) {

			$.ajax({
				type : 'POST',
				url : '${pageContext.request.contextPath}/AJAXAdminAddProduct',
				data : {

					IDAttribute : ID

				},
				success : function(response) {
					$('#' + ID).append(response);
				}

			});

		}
	</script>

	<script>
		window.gapiCallbacks = [];

		function gapiLoaded() {
			gapi.auth.init(function() {
				gapi.client.load('drive', 'v2').then(function() {
					var GapiQueue = function() {
						this.push = function(callback) {
							setTimeout(callback, 0);
						};
					};

					var _old_gapiCallbacks = window.gapiCallbacks;

					window.gapiCallbacks = new GapiQueue();

					_old_gapiCallbacks.forEach(function(callback) {
						window.gapiCallbacks.push(callback);
					});
				}, function(reason) {
					console.err(reason);
				});
			});
		}
	</script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.15/angular.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.2/moment.min.js"></script>
	<script src="https://apis.google.com/js/client.js?onload=gapiLoaded"></script>
	<script src="${urlDrive}/drive-controller.js"></script>
	<script src="${urlDrive}/gapi-auth-service.js"></script>
	<script src="${urlDrive}/drive-service.js"></script>

	<%-- 	<script src="${url}/js/js-page/addProduct.js"></script> --%>
</body>
</html>
