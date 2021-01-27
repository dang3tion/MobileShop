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
	<div class="d-flex" id="wrapper">
		<!-- Sidebar -->
		<c:import url="/VIEW/jsp/jsp-component/sidebar-admin.jsp">
			<c:param name="listProductactive" value="active"></c:param>
		</c:import>
		<!--Nav-->


		<!-- Page Content -->
		<div id="page-content-wrapper">

			<!-- 		toggle logout -->
			<jsp:include page="/VIEW/jsp/jsp-component/toggle-logout-bar.jsp"></jsp:include>

			<div class="container-fluid">
				<div class="mb-5 mt-3 ">
					<h4 class="mt-3 mb-3">Thống kê sản phẩm</h4>



					<table class="table">
						<thead class="thead-dark">
							<tr>
								<th scope="col">Tổng số sản phẩm</th>
								<th scope="col">Số sản phẩm đang bán</th>
								<th scope="col">Số sản phẩm ngưng kinh doanh</th>
								<th scope="col">Tổng số lượng tồn kho</th>
								<th scope="col">Tổng số lượng đã bán</th>
							</tr>
						</thead>
						<tbody>
							<tr class="">
								<th scope="row"> ${total} </th>
								<td>${numProduct}</td>
								<td>${productStop}</td>
								<td> ${productSale} </td>
								<td>${numProductStop}</td>

							</tr>
						</tbody>
					</table>

					<div class="content">
						<div class="animated fadeIn">
							<div class="row">

								<div class="col-md-12">
									<div class="card">
										<div class="card-body">
											<div class=" mb-2">
												<h4 class="text-center mt-3 mb-3">Danh sách sản phẩm</h4>
												<div class="row">


													<div class="ml-5 mb-2 form-row align-items-center">
														<div class="col-auto">
															<div class="input-group mb-2">
																<div class="input-group-prepend">
																	<div class="input-group-text">
																		<i class="fas fa-search"></i>
																	</div>
																</div>
																<input id="key-search" type="text" class="form-control"
																	placeholder="Nhập từ khóa">
															</div>
														</div>
														<div class="col-auto">
															<button type="button" onclick="getkeysearch()"
																class="btn btn-primary mb-2">Tìm kiếm</button>
														</div>
													</div>


												</div>
												<a
													href=" ${pageContext.request.contextPath}/admin/warehouse/product-add"><button
														data-toggle="tooltip" data-placement="top"
														title="Thêm một sản phẩm mới vào danh sách"
														style="float: right;" class="btn btn-success btn-add">
														<i class="fas fa-plus-square"></i> Thêm sản phẩm
													</button></a>
												<table id="bootstrap-data-table" class="table table-hover ">
													<thead class="thead-light">
														<tr style="font-size: 14px;">
															<th>STT</th>
															<th>Ảnh</th>
															<th data-toggle="tooltip" data-placement="top"
																title="Mã sản phẩm">Mã SP</th>
															<th>Tên</th>
															<th data-toggle="tooltip" data-placement="top"
																title="Hãng sản xuất">Hãng SX</th>
															<th data-toggle="tooltip" data-placement="top"
																title="Ngày cập nhật">NCN</th>
															<th data-toggle="tooltip" data-placement="top"
																title="Số lượng còn lại">SLCL</th>
															<th data-toggle="tooltip" data-placement="top"
																title="Số lượng đã bán">SLĐB</th>
															<th>Giá gốc</th>
															<th data-toggle="tooltip" data-placement="top"
																title="Giá khuyến mãi">Giá KM</th>
															<th>Trạng thái</th>
															<th></th>

														</tr>
													</thead>

													<tbody id="content-table">


														<!-- Modal -->



													</tbody>
												</table>

												<div class="page-navigation" id="page-navigation"
													value="${totalPage}">
													<div class="beta">
														<button onclick="previousPage()">Trước</button>
														<span id="page-number"> </span>
														<button onclick="nextPage()">Sau</button>
													</div>
												</div>
											</div>
										</div>
									</div>


								</div>
							</div>
							<!-- .animated -->
						</div>
						<!-- .content -->
						<!--Modal add-->

						<!--/Modal add-->

						<!--Modal edit-->

						<!--/Modal edit-->


					</div>
					<!-- /#right-panel -->
				</div>
			</div>
			<!-- /#page-content-wrapper -->
		</div>
		<!-- delete product -->
		<!-- Modal -->

	</div>
	<input id="curent-page" value="${current_page}" style="display: none"></input>



	<script>
		function getCurrentPage() {
			return document.getElementById("curent-page").value;
		}
		function SendDataToServlet(number) {
			getNumberPageDefault(number);
			$
					.ajax({
						type : 'GET',
						url : '${pageContext.request.contextPath}/AJAXAdminProductManager',
						data : {

							page : parseInt(number)

						},
						success : function(responseText) {
							$('#content-table').html(responseText);
						}

					});

		}

		function getkeysearch() {
			var key = document.getElementById('key-search').value;
			$
					.ajax({
						type : 'GET',
						url : '${pageContext.request.contextPath}/AJAXAdminProductManager',
						data : {

							key : key

						},
						success : function(responseText) {
							$('#content-table').html(responseText);
						}

					});

		}
		// 		function SendDataLock(emailvalue) {

		// 			$
		// 					.ajax({
		// 						type : 'POST',
		// 						url : '${pageContext.request.contextPath}/AJAXAdminUserManager',
		// 						data : {

		// 							page : getMove(),
		// 							email : emailvalue
		// 						},
		// 						success : function(responseText) {
		// 							$('#content-table').html(responseText);
		// 						}

		// 					});

		// 		}
		// 		function switchChedoXem(value) {

		// 			$
		// 					.ajax({
		// 						type : 'GET',
		// 						url : '${pageContext.request.contextPath}/AJAXswitchChedoXemAdminManageUser',
		// 						data : {

		// 							statusAccount : value

		// 						},
		// 						success : function(responseText) {
		// 							document.getElementById('page-navigation').value = responseText;
		// 							// 					alert(responseText);
		// 						}

		// 					});

		// 			$
		// 		.ajax({
		// 						type : 'GET',
		// 						url : '${pageContext.request.contextPath}/AJAXAdminUserManager',
		// 						data : {

		// 							cheDoXem : value

		// 						},
		// 						success : function(responseText) {
		// 							$('#content-table').html(responseText);
		// 						}

		// 					});

		// 		}
	</script>

	<script src="${url}/js/js-page/devide-page-admin.js"></script>
	<!-- @@@@@@@@@@ HIỆN THÔNG BÁO THAY ĐỔI  @@@@@@@@@@@@@ -->

	<!-- @@@@@@@@@@ END HIỆN THÔNG BÁO THAY ĐỔI @@@@@@@@@@@@@ -->
</body>

</html>