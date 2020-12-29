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
					<div class="content">
						<div class="animated fadeIn">
							<div class="row">

								<div class="col-md-12">
									<div class="card">
										<div class="card-body">
											<div class=" mb-2">
												<h4 class="text-center mt-3 mb-3">Danh sách sản phẩm</h4>
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
															text" placeholder="Search.."></span>
													</div>

												</div>
												<a
													href=" ${pageContext.request.contextPath}/admin/product-add"><button
														data-toggle="tooltip" data-placement="top"
														title="Thêm một sản phẩm mới vào danh sách"
														class="btn btn-success btn-add">
														<i class="fas fa-plus-square"></i> Thêm sản phẩm
													</button></a>
												<table id="bootstrap-data-table" class="table table-hover ">
													<thead class="thead-light">
														<tr>
															<th>STT</th>
															<th>Ảnh</th>
															<th data-toggle="tooltip" data-placement="top"
																title="Mã sản phẩm">Mã SP</th>
															<th>Tên</th>
															<th data-toggle="tooltip" data-placement="top"
																title="Hãng sản xuất">Hãng SX</th>
															<th>Ngày cập nhật</th>
															<th data-toggle="tooltip" data-placement="top"
																title="Số lượng còn lại">SL còn lại</th>
															<th data-toggle="tooltip" data-placement="top"
																title="Số lượng đã bán">SL đã bán</th>
															<th>Giá gốc</th>
															<th>Giá KM</th>
															<th>Trạng thái</th>
															<th></th>

														</tr>
													</thead>

													<tbody id="content-table">
														<tr>
															<c:forEach items="${listProduct}" var="pro">
																<td>${pro.numOrder}</td>
																<td style="max-width: 140px;"><img
																	src="${pro.img}" width="100px"
																	height="100px" alt=""></td>
																<td>${pro.id}</td>
																<td>${pro.name}</td>
																<td>${pro.branch}</td>
																<td>${pro.date}</td>
																<td>${pro.quatity}</td>


																<td>${pro.quatityRemain}</td>
																<td class="color-price">${pro.price}</td>
																<td class="color-price">${pro.priceSale}</td>
																<td class="color-price">${pro.state}</td>
																
								
																<td class="row" style="border: none;">
																	<div style="margin: auto;">
																		<a
																			href="${pageContext.request.contextPath}/product-edit"><button
																				class="m-wTD btn btn-primary" data-toggle="tooltip"
																				data-placement="top" title="Chỉnh sửa"
																				data-toggle="modal" data-target="#editUser">
																				<i class="txt-center fas fa-edit"></i>
																			</button></a>
																		<button class="btn btn-danger sizeTh1"
																			data-toggle="modal" data-target="#delete${pro.id}"
																			data-toggle="tooltip" data-placement="top"
																			title="Xóa">
																			<i class="txt-center menu-icon fas fa-trash-alt"></i>
																		</button>
																	</div>

																</td>
														</tr>

														<!-- Modal -->
														<div class="modal fade" id="delete${pro.id}" tabindex="-1"
															role="dialog" aria-labelledby="exampleModalLabel"
															aria-hidden="true">
															<div class="modal-dialog" role="document">
																<div class="modal-content">
																	<div class="modal-header">
																		<h5 class="modal-title" id="exampleModalLabel">Xác
																			nhận thay đổi trạng thái sản phẩm</h5>
																		<button type="button" class="close"
																			data-dismiss="modal" aria-label="Close">
																			<span aria-hidden="true">&times;</span>
																		</button>
																	</div>
																	<div class="modal-body">Bạn có muốn thay đổi trạng thái sản phẩm ${pro.name}.
																		 </div>
																	<div class="modal-footer">
																		<button type="button" class="btn btn-secondary"
																			data-dismiss="modal">Không</button>
																		<button type="button" 
																			class="btn btn-primary">Đồng ý</button>
																	</div>
																</div>
															</div>
														</div>
														</c:forEach>





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
						<!--Modal add-->
						<div class="modal fade" id="add" tabindex="-1" role="dialog"
							aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLongTitle">Thêm
											sản phẩm</h5>
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
						<!--/Modal add-->

						<!--Modal edit-->
						<div class="modal fade" id="editUser" tabindex="-1" role="dialog"
							aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLongTitle">Chỉnh
											sửa sản phẩm</h5>
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
						<!--/Modal edit-->


					</div>
					<!-- /#right-panel -->
				</div>
			</div>
			<!-- /#page-content-wrapper -->
		</div>
		<!-- delete product -->
		<!-- Modal -->
		<div class="modal fade" id="delete" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Xác nhận xóa
							sản phẩm</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">Bạn có muốn xóa sản phẩm này.</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Không</button>
						<button type="button" data-dismiss="modal" class="btn btn-primary">Đồng
							ý</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>