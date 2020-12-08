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
			<c:param name="filteractive" value="active"></c:param>
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
												<h4 class="text-center mt-3 mb-3">Thông tin dữ liệu
													được lọc</h4>
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

															<th data-toggle="tooltip" data-placement="top" title="">Chi
																tiết</th>
															<th></th>
														</tr>
													</thead>

													<tbody id="content-table">
														<tr>

															<td>Hệ điều hành</td>
															<td>Chuỗi</td>
															<td><a href='#' data-target="#detail-string"
																data-toggle="modal" data-toggle="tooltip"
																data-placement="top"> Chi tiết <i
																	class="fa fa-external-link-alt"></i></a></td>


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
															<td><a href='#' data-target="#detail-number"
																data-toggle="modal" data-toggle="tooltip"
																data-placement="top"> Chi tiết <i
																	class="fa fa-external-link-alt"></i></a></td>


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
						<div class="modal fade " id="detail-string" tabindex="-1"
							role="dialog" aria-labelledby="exampleModalCenterTitle"
							aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered detail-attribute"
								role="document">
								<div class="modal-content ">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLongTitle">Chi
											tiết</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body ">

										<table id="bootstrap-data-table" class="table table-hover ">
											<thead class="thead-light">
												<tr>
													<th>Tiêu đề</th>

													<th data-toggle="tooltip" data-placement="top"
														title="Số lượng đã bán">Giá trị lọc</th>


													<th>
														<button data-toggle="modal"
															data-target="#add-string-attribute" data-placement="top"
															data-toggle="tooltip" data-placement="top"
															title="Thêm sản phẩm" style="margin: 0;"
															class="btn btn-success btn-add">
															<i class="fas fa-plus-square"></i>
														</button>
													</th>

												</tr>
											</thead>

											<tbody>
												<tr>

													<td><input type="text" class="title-attribute"
														value="Android"></td>
													<td><select class="select-choose">
															<option value="Andriod">Android</option>
															<option value="IOS">IOS</option>
															<option value="Khác">Khác</option>
													</select></td>


													<td class="row"
														style="border: none; margin: auto; float: right;">

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

													<td><input type="text" class="title-attribute"
														value="IOS"></td>
													<td><select class="select-choose">
															<option value="IOS">IOS</option>
															<option value="Andriod">Android</option>
															<option value="Khác">Khác</option>
													</select></td>


													<td class="row"
														style="border: none; margin: auto; float: right;">

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

													<td><input type="text" class="title-attribute"
														value="Khác"></td>
													<td><select class="select-choose">
															<option value="Khác">Khác</option>
															<option value="Andriod">Android</option>
															<option value="Khác">IOS</option>
													</select></td>


													<td class="row"
														style="border: none; margin: auto; float: right;">

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

									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">Đóng</button>
										<button type="button" class="btn btn-primary">Lưu lại</button>
									</div>
								</div>
							</div>
						</div>
						<div class="modal fade " id="detail-number" tabindex="-1"
							role="dialog" aria-labelledby="exampleModalCenterTitle"
							aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered detail-attribute"
								role="document">
								<div class="modal-content ">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLongTitle">Chi
											tiết</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body ">

										<table id="bootstrap-data-table" class="table table-hover ">
											<thead class="thead-light">
												<tr>
													<th>Tiêu đề</th>

													<th data-toggle="tooltip" data-placement="top"
														title="Số lượng đã bán">Giá trị lọc</th>


													<th>
														<button data-toggle="modal"
															data-target="#add-number-attribute" data-placement="top"
															data-toggle="tooltip" data-placement="top"
															title="Thêm sản phẩm" style="margin: 0;"
															class="btn btn-success btn-add">
															<i class="fas fa-plus-square"></i>
														</button>
													</th>

												</tr>
											</thead>

											<tbody>
												<tr>
													<td><input type="text" class="title-attribute"
														value="Màn hình nhỏ (Dưới 5 INCH)"></td>
													<td>Từ <input type="number" min=0 value=0
														class="input-number"> đến <input type="number"
														min=0 value=5 class="input-number">
													</td>


													<td class="row"
														style="border: none; margin: auto; float: right;">

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
													<td><input type="text" class="title-attribute"
														value="Vừa tay (5 INCH đến 6 INCH)"></td>
													<td>Từ <input type="number" min=0 value=5
														class="input-number"> đến <input type="number"
														value=6 min=0 class="input-number">
													</td>


													<td class="row"
														style="border: none; margin: auto; float: right;">

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
													<td><input type="text" class="title-attribute"
														value="Trên 6 INCH"></td>
													<td>Từ <input type="number" min=0 value=6
														class="input-number"> đến <input type="number"
														value=999 min=0 class="input-number">
													</td>


													<td class="row"
														style="border: none; margin: auto; float: right;">

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

									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">Đóng</button>
										<button type="button" class="btn btn-primary">Lưu lại</button>
									</div>
								</div>
							</div>
						</div>




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
									<div class="modal-body">
										<h5>Nhập tiêu đề</h5>
										<input type="text" class="title-attribute" autofocus name="">
										<h5>Chọn giá trị</h5>
										<select class="select-choose">
											<option value="Khác">Khác</option>
											<option value="Andriod">Android</option>
											<option value="Khác">IOS</option>
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
						<div class="modal fade" id="add-number-attribute" tabindex="-1"
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
										<h5>Nhập tiêu đề</h5>
										<input type="text" class="title-attribute" autofocus name="">
										<h5>Chọn giá trị</h5>
										Từ <input type="number" min=0 class="input-number">
										đến <input type="number" min=0 class="input-number">
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

										<h5>Chọn thuộc tính</h5>
										<select class="select-choose">
											<option value="Khác">Hệ điều hành</option>
											<option value="Andriod">Kích cỡ màn hình</option>
											<option value="Khác">Bộ nhớ trong</option>
											<option value="Khác">Dung lượng RAM</option>
											<option value="Khác">Camera trước</option>
											<option value="Khác">Camera sau</option>
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
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Không</button>
							<button type="button" data-dismiss="modal"
								class="btn btn-primary">Đồng ý</button>
						</div>
					</div>
				</div>
			</div>
		</div>
</body>

</html>