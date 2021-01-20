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
												<div class="row" style="margin-bottom: 10px">
													<div class="col-9"></div>
													<div class="col-3">
														<button class="btn btn-success" data-toggle="modal"
															data-target="#addBranch">
															<i class="fas fa-plus-square"></i> Thêm thương hiệu
														</button>
													</div>

													<form
														action="${pageContext.request.contextPath}/admin/branch"
														method="post"></form>
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
																<td>${pp.productQuantity}</td>
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
																		style="margin: auto;" title='Thay đổi trạng thái'>
																		<i
																			class="txt-center menu-icon <c:if test ="${pp.state == 'Còn kinh doanh'}">
																			fas fa-lock-open
																	</c:if>
																	<c:if test ="${pp.state == 'Ngừng kinh doanh'}">
																		 	
																		 	fas fa-lock
																	</c:if>"></i>
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
																			<form
																				action="${pageContext.request.contextPath}/admin/branch"
																				method="post">
																		<div class="modal-body">Bạn có muốn thay đổi
																			trạng thái thương hiệu hiệu này.</div>
																		<div class="modal-footer">
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


<!-- 																PHÂN TRANG -->
<!-- 												<div class="page-navigation" id="page-navigation" value="3"> -->
<!-- 													<div class="beta"> -->
<!-- 														<button onclick="previousPage()">Trước</button> -->
<!-- 														<span id="page-number"> </span> -->
<!-- 														<button onclick="nextPage()">Sau</button> -->
<!-- 													</div> -->
<!-- 												</div> -->
<!-- 											</div> -->
<!-- 															PHÂN TRANG -->

										</div>
									</div>
								</div>


							</div>
						</div>
						<!-- .animated -->
					</div>
					<!-- .content -->


					
			</div>
		</div>
	</div>

	<!-- 	Thêm thương hiệu -->
	<div class="modal fade" id="branch" tabindex="-1" role="dialzog"
		aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">Thêm thương
						hiệu</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form action="${pageContext.request.contextPath}/admin/branch"
						method="post">        
					<div class="modal-body">
						<label for="exampleInputEmail1" style=""><h3>Nhập tên thương hiệu mới</h3></label> <input
							type="text" class="form-control" name="newBranch"
							placeholder="Nhập tên thương hiệu mới">
				</div>
					<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Hủy</button>
					<button type="submit" class="btn btn-primary">Thêm</button>
				</div></form>
			</div>
		</div>
	</div>
	<!-- end thêm thương hiệu -->

	<!-- 	Thêm thương hiệu -->
	<!-- Modal -->
	<div class="modal fade" id="addBranch" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Xác nhận thêm
						thương hiệu</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">Bạn có chắc chắn muốn thêm thương hiệu
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Đóng</button>
					<button type="button" class="btn btn-primary" data-toggle="modal"
						data-target="#branch" data-dismiss="modal">Có</button>
				</div>
			</div>
		</div>
	</div>
	<!-- end thêm thương hiệu -->

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

	<!-- @@@@@@@@@@ HIỆN THÔNG BÁO THÊM THƯƠNG HIỆU  @@@@@@@@@@@@@ -->
	<c:if test="${messageAdd != null}">

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
						<h5 class="modal-title" id="exampleModalLongTitle" >${messageAdd}</h5>
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-success" data-dismiss="modal">Đóng</button>
					</div>
				</div>
			</div>
		</div>

	</c:if>
	<!-- @@@@@@@@@@ END HIỆN THÔNG BÁO THÊM THƯƠNG HIỆU @@@@@@@@@@@@@ -->
	


</body>

</html>