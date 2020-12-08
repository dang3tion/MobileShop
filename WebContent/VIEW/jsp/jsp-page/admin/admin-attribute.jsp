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
			<c:param name="attributeactive" value="active"></c:param>
		</c:import>




		<div id="page-content-wrapper">


			<!-- 		toggle logout -->
			<jsp:include page="/VIEW/jsp/jsp-component/toggle-logout-bar.jsp"></jsp:include>

			<!-- main content page -->
			<div class="container-fluid">
				<div class="mb-5 mt-3 ">
					<div class="content">
						<div class="animated fadeIn">
							<div class="row">

								<div class="col-md-12">
									<div class="card">
										<div class="card-body">
											<div class=" mb-2">
												<h4 class="text-center mt-3 mb-3">Danh sách các thuộc
													tính/thông số kĩ thuật</h4>
												<div class="row">
													<div class="show-page mb-3 ml-3">

														Hiển thị <span> <select id="show"
															onclick="select_page()">
																<option value="10">10</option>
																<option value="20">20</option>
																<option value="50">50</option>
														</select></span> cột
													</div>

													<div class="show-page  arrange">

														Sắp xếp <span> <select id="show"
															onclick="select_page()">
																<option value="10">A-Z</option>
																<option value="20">Z-A</option>
														</select></span>
													</div>
													<div class="show-page  arrange">

														Tìm kiếm <span> <input id="myInput"
															style="padding-left: 15px; border: 0.5px solid grey;"
															placeholder="Search.."></span>
													</div>

												</div>
												<a><button data-target="#add-attribute"
														data-toggle="modal" data-toggle="tooltip"
														style="margin-right: 10px;" data-placement="top"
														title="Thêm thuộc tính" class="btn btn-success btn-add">
														<i class="fas fa-plus-square"></i>
													</button></a>
												<table id="bootstrap-data-table" class="table table-hover">
													<thead class="thead-light">
														<tr>
															<th>Tên thuộc tính</th>

															<th data-toggle="tooltip" data-placement="top" title="">Loại
																giá trị lọc</th>

															<th></th>
														</tr>
													</thead>

													<tbody id="content-table">
														<tr>

															<td>Hệ điều hành</td>
															<td>Văn bản</td>



															<td class="row" style="margin: auto; float: right">

																<div style="margin: auto;">

																	<button class="btn btn-danger sizeTh1"
																		data-toggle="modal" data-target="#delete"
																		data-toggle="tooltip" data-placement="top" title="Xóa">
																		<i class="txt-center menu-icon fas fa-trash-alt"></i>
																	</button>
																</div>

															</td>
														</tr>
														<tr>

															<td>Kích cỡ màn hình</td>
															<td>Số</td>


															<td class="row"
																style="border: none; margin: auto; float: right">

																<div style="margin: auto;">

																	<button class="btn btn-danger sizeTh1"
																		data-toggle="modal" data-target="#delete"
																		data-toggle="tooltip" data-placement="top" title="Xóa">
																		<i class="txt-center menu-icon fas fa-trash-alt"></i>
																	</button>
																</div>

															</td>
														</tr>
													</tbody>
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



						<!-- Modal -->
						<div class="modal fade" id="add-string-attribute" tabindex="-1"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel"></h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>

									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">Đóng</button>
										<button type="button" class="btn btn-primary">Lưu</button>
									</div>
								</div>
							</div>
						</div>



						<div class="modal fade" id="add-attribute" tabindex="-1"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel"></h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<h5>Nhập tên thuộc tính</h5>
										<input type="text" class="title-attribute" autofocus name="">
										<h5>Chọn loại thuộc tính</h5>

										<select class="select-choose">
											<option value="Khác">Văn bản</option>
											<option value="Andriod">Số</option>
										</select>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">Đóng</button>
										<button type="button" class="btn btn-primary">Lưu</button>
									</div>
								</div>
							</div>
						</div>
						<!--Modal edit-->

						<!--/Modal edit-->


					</div>
					<!-- /#right-panel -->
				</div>
			</div>
			<div class="modal fade" id="delete" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Xác nhận xóa
								thuộc tính</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">Bạn có muốn xóa thuộc tính này
							không?</div>
						<div class="modal-footer">	<button type="button" data-dismiss="modal"
								class="btn btn-primary">Đồng ý</button>
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Không</button>
						
						</div>
					</div>
				</div>
			</div>
		</div>
</body>

</html>