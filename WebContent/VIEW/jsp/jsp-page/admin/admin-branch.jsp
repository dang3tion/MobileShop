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
			<c:param name="branchactive" value="active"></c:param>
		</c:import>

		<div id="page-content-wrapper">

			<!-- 		toggle logout -->
			<jsp:include page="/VIEW/jsp/jsp-component/toggle-logout-bar.jsp"></jsp:include>
			<!-- Page Content -->
			<div class="container-fluid">
				<div class="mb-5 mt-3 ">
					<div class="content">
						<div class="animated fadeIn">
							<div class="row">

								<div class="col-md-12">
									<div class="card">
										<div class="card-body">
											<div class=" mb-2">
												<h4 class="text-center mt-3 mb-3">Danh sách thương hiệu</h4>
												<div class="row">
													<div class="show-page mb-3 ml-3">
														Hiển thị <span> <select id="show"
															onclick="select_page()">
																<option value="10">10</option>
																<option value="20">20</option>
																<option value="50">50</option>
														</select></span> cột
													</div>
													<div class="show-page " style="margin-left: 50px;">

														Tìm kiếm <span> <input id="myInput"
															style="padding-left: 15px; border: 0.5px solid grey;"
															type="text" placeholder="Search.."></span>
													</div>
												</div>
												<table id="bootstrap-data-table" class="table table-hover ">
													<thead class="thead-light">
														<tr>
															<th>Mã thương hiệu</th>
															<th>Tên thương hiệu</th>
															<th>Số lượng điện thoại</th>
															<th></th>
														</tr>
													</thead>
													<tbody id="content-table">
														<tr>
															<td>TH01</td>
															<td>Apple</td>


															<td>10</td>

															<td class="row" style="border: none;">
																<button class="edit3 btn btn-danger" data-toggle="modal"
																	data-target="#del" style="margin: auto;"
																	title='Xóa thương hiệu'>
																	<i class="txt-center menu-icon fas fa-trash-alt"></i>
																</button>
															</td>
														</tr>
														<tr>
															<td>TH02</td>
															<td>Samsung</td>


															<td>10</td>

															<td class="row" style="border: none;">
																<button class="edit3 btn btn-danger" data-toggle="modal"
																	data-target="#del" style="margin: auto;"
																	title='Xóa thương hiệu'>
																	<i class="txt-center menu-icon fas fa-trash-alt"></i>
																</button>
															</td>
														</tr>
														<tr>
															<td>TH03</td>
															<td>Huawei</td>


															<td>10</td>

															<td class="row" style="border: none;">
																<button class="edit3 btn btn-danger" data-toggle="modal"
																	data-target="#del" style="margin: auto;"
																	title='Xóa thương hiệu'>
																	<i class="txt-center menu-icon fas fa-trash-alt"></i>
																</button>
															</td>
														</tr>
														<tr>
															<td>TH04</td>
															<td>Vivo</td>


															<td>10</td>

															<td class="row" style="border: none;">
																<button class="edit3 btn btn-danger" data-toggle="modal"
																	data-target="#del" style="margin: auto;"
																	title='Xóa thương hiệu'>
																	<i class="txt-center menu-icon fas fa-trash-alt"></i>
																</button>
															</td>
														</tr>

														<tr>
															<td>TH05</td>
															<td>OPPO</td>


															<td>10</td>

															<td class="row" style="border: none;">
																<button class="edit3 btn btn-danger" data-toggle="modal"
																	data-target="#del" style="margin: auto;"
																	title='Xóa thương hiệu'>
																	<i class="txt-center menu-icon fas fa-trash-alt"></i>
																</button>
															</td>
														</tr>
														<tr>
															<td>TH06</td>
															<td>Xiaomi</td>


															<td>10</td>

															<td class="row" style="border: none;">
																<button class="edit3 btn btn-danger" data-toggle="modal"
																	data-target="#del" style="margin: auto;"
																	title='Xóa thương hiệu'>
																	<i class="txt-center menu-icon fas fa-trash-alt"></i>
																</button>
															</td>
														</tr>
														<tr>
															<td>TH07</td>
															<td>Realmi</td>


															<td>10</td>

															<td class="row" style="border: none;">
																<button class="edit3 btn btn-danger" data-toggle="modal"
																	data-target="#del" style="margin: auto;"
																	title='Xóa thương hiệu'>
																	<i class="txt-center menu-icon fas fa-trash-alt"></i>
																</button>
															</td>
														</tr>
												</table>

												<div class="page-navigation">
													<div class="beta">
														<button onclick="previous_page()">Trước</button>
														<span id="page-number"> </span>
														<button onclick="next_page()">Sau</button>
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


						<!-- Add -->
						<div class="modal fade" id="add" tabindex="-1" role="dialog"
							aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLongTitle">Thêm
											User</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">...</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">Đóng</button>
										<button type="button" class="btn btn-primary">Lưu</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- /#right-panel -->
				</div>
			</div>
		</div>
		<div class="modal fade" id="del" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Xác nhận xóa
							thương hiệu.</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">Bạn có muốn xóa thương hiệu này.</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Không</button>
						<button type="button" class="btn btn-primary" data-dismiss="modal">Đồng
							ý</button>
					</div>
				</div>
			</div>
		</div>
</body>

</html>