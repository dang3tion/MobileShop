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
													<!-- 													<div class="show-page mb-3 ml-3"> -->
													<!-- 														Hiển thị <span> <select id="show" -->
													<!-- 															onclick="select_page()"> -->
													<!-- 																<option value="10">10</option> -->
													<!-- 																<option value="20">20</option> -->
													<!-- 																<option value="50">50</option> -->
													<!-- 														</select></span> cột -->
													<!-- 													</div> -->
													<form
														action="${pageContext.request.contextPath}/admin/branch"
														method="post">
														<div class="ml-5 mb-2 form-row align-items-center">
															<div class="col-auto">
																<div class="input-group mb-2">
																	<div class="input-group-prepend">
																		<div class="input-group-text">
																			<i class="fas fa-search"></i>
																		</div>
																	</div>
																	<input name="searchBranch" type="text"
																		class="form-control" placeholder="Nhập từ khóa">
																</div>
															</div>
															<div class="col-auto">
																<button type="submit" class="btn btn-primary mb-2">Tìm
																	kiếm</button>
															</div>
														</div>
													</form>
												</div>
												<table id="bootstrap-data-table" class="table table-hover ">
													<thead class="thead-light">
														<tr>
															<th>STT</th>
															<th>Mã thương hiệu</th>
															<th>Tên thương hiệu</th>
															<th>Số lượng điện thoại</th>
															<th>Trạng thái</th>
															<th></th>
														</tr>
													</thead>
													<tbody id="content-table">
														<c:forEach items="${listBranch}" var="pp">
															<tr>
																<td>${pp.numOrder}</td>
																<td>${pp.id}</td>
																<td>${pp.name}</td>


																<td>${pp.quantity_product}</td>
																<td>${pp.state}</td>
																<td class="row" style="border: none;">
																	<button
																		class="edit3 btn 
																	<c:if test ="${pp.state == 'Còn kinh doanh'}">
																		 btn-success
																	</c:if>
																	<c:if test ="${pp.state == 'Ngừng kinh doanh'}">
																		 btn-danger
																	</c:if>
																	"
																		data-toggle="modal" data-target="#del${pp.id}"
																		style="margin: auto;" title='Xóa thương hiệu'>
																		<i class="txt-center menu-icon fas fa-lock"></i>
																	</button>
																</td>
															</tr>
															<div class="modal fade" id="del${pp.id}" tabindex="-1"
																role="dialog" aria-labelledby="exampleModalLabel"
																aria-hidden="true">
																<div class="modal-dialog" role="document">
																	<div class="modal-content">
																		<div class="modal-header">
																			<h5 class="modal-title" id="exampleModalLabel">Xác
																				nhận thay đổi trạng thái thương hiệu ${pp.name}.</h5>
																			<button type="button" class="close"
																				data-dismiss="modal" aria-label="Close">
																				<span aria-hidden="true">&times;</span>
																			</button>
																		</div>
																		<div class="modal-body">Bạn có muốn thay đổi trạng thái thương hiệu
																			hiệu này.</div>
																		<div class="modal-footer">
																			<form
																				action="${pageContext.request.contextPath}/admin/branch"
																				method="post">
																				<input style="display: none" name="id"
																					value="${pp.id}">
																				<button type="button" class="btn btn-secondary"
																					data-dismiss="modal">Không</button>
																				<button type="submit" class="btn btn-primary">Đồng
																					ý</button>
																		</div>
																		</form>
																	</div>
																</div>
															</div>
														</c:forEach>
													</tbody>
												</table>


												<!-- 				PHÂN TRANG -->
												<div class="page-navigation" id="page-navigation"
													value="3">
													<div class="beta">
														<button onclick="previousPage()">Trước</button>
														<span id="page-number"> </span>
														<button onclick="nextPage()">Sau</button>
													</div>
												</div>
											</div>
											<!-- 				PHÂN TRANG -->
											
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
	<!-- @@@@@@@@@@ HIỆN THÔNG BÁO NGƯNG KINH DOANH  @@@@@@@@@@@@@ -->
	<c:if test="${messageblock != null}">

		<script>
			window.onload = function() {
				document.getElementById('btn-message').click();
			}
		</script>

		<!-- Button trigger modal -->
		<button style="display: none" type="button" id="btn-message"
			class="btn btn-white" data-toggle="modal"
			data-target="#exampleModalCenter"></button>

		<!-- Modal -->
		<div class="modal fade" id="exampleModalCenter" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalCenterTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLongTitle">${messageblock}</h5>
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-success" data-dismiss="modal">Đóng</button>
					</div>
				</div>
			</div>
		</div>

	</c:if>
	<!-- @@@@@@@@@@ END HIỆN THÔNG BÁO NGƯNG KINH DOANH @@@@@@@@@@@@@ -->
</body>

</html>