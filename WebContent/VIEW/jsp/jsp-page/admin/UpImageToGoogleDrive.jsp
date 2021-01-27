<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
<c:url var="url" scope="page" value="/VIEW"></c:url>
<jsp:include page="/VIEW/jsp/jsp-component/head-css-admin.jsp"></jsp:include>
<link href="${url}/css/css-page/admin-user.css" type="text/css"
	rel="stylesheet" />
</head>

<body>
	<!-- Page Content -->
	<div class="d-flex" id="wrapper">
		<!-- Sidebar -->
		<c:import url="/VIEW/jsp/jsp-component/sidebar-admin.jsp">
			<c:param name="receiptactive" value="active"></c:param>
		</c:import>


		<!-- Page Content -->
		<div id="page-content-wrapper">


			<!-- 		toggle logout -->
			<jsp:include page="/VIEW/jsp/jsp-component/toggle-logout-bar.jsp"></jsp:include>

			<!-- main content page -->
			<div class="container-fluid" style="margin-top: 20px;">
				<div class="border mb-2">
					<h4 class="text-center mt-3 mb-3">Quản lí đơn hàng</h4>
					<div class="mt-5"></div>



					<table class="table table-hover " id="receipt-table">
						<thead class="thead-light">
							<tr>
								<th scope="col">Mã đơn hàng</th>
								<th scope="col">Mã khách hàng</th>

								<th scope="col">Tổng giá trị</th>
								<th scope="col">Ngày lập</th>

								<th scope="col">Chi tiết đơn hàng</th>
								<th scope="col">Xác nhận đơn hàng</th>

							</tr>
						</thead>
						<tbody id="content-table">
							<tr>
								<td>DH01</td>
								<td>KH01</td>

								<td>20,200,000</td>
								<td>20/11/2020</td>

								<td class="detail"><a data-toggle="modal"
									data-target="#exampleModal" href='#'> Chi tiết <i
										class="fa fa-external-link-alt"></i></a> <!-- Modal --></td>
								<td class="confirm">
								
								
								
								<span> <label
										title="Xác nhận đơn 	hàng" data-target="#confirm-id"
										class="label-check active" data-toggle="modal"><i
											class="fas fa-check-square"></i></label>
										<div class="modal fade" id="confirm-id" tabindex="-1"
											aria-labelledby="exampleModalLabel" aria-hidden="true">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title">Xác nhận đơn hàng</h5>
														<button type="button" class="close" data-dismiss="modal"
															aria-label="Close">
															<i aria-hidden="true">&times;</i>
														</button>
													</div>
													<div class="modal-body">Bạn có muốn xác nhận đơn hàng
														này không?</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-secondary"
															data-dismiss="modal">Hủy</button>
														<button type="button" class="btn btn-primary"
															onclick="confirmedCheck(id)" data-dismiss="modal">Xác
															nhận</button>
													</div>
												</div>
											</div>
										</div>
								</span> <span> <label title="Xác nhận vận chuyển thành công"
										data-target="#delivery-id" class="label-delivered disable"><i
											class="fas fa-truck"></i></label>
										<div class="modal fade" id="delivery-id" tabindex="-1"
											aria-labelledby="exampleModalLabel" aria-hidden="true">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title" id="exampleModalLabel">Xác
															nhận vận chuyển</h5>
														<button type="button" class="close" data-dismiss="modal"
															aria-label="Close">
															<i aria-hidden="true">&times;</i>
														</button>
													</div>
													<div class="modal-body">Bạn có muốn xác nhận vận
														chuyển thành công?</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-secondary"
															data-dismiss="modal">Hủy</button>
														<button type="button" class="btn btn-primary"
															onclick="confirmedDelivery(id)" data-dismiss="modal">Xác
															nhận</button>
													</div>
												</div>
											</div>
										</div>
								</span> <span> <label title="Hủy đơn hàng"
										data-target="#cancel-id" data-toggle="modal"
										class="label-cancel warning"><i class="fas fa-trash"></i></label>
										<div class="modal fade" tabindex="-1" id="cancel-id"
											aria-labelledby="exampleModalLabel" aria-hidden="true">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title" id="exampleModalLabel">Xác
															nhận hủy đơn</h5>
														<button type="button" class="close" data-dismiss="modal"
															aria-label="Close">
															<i aria-hidden="true">&times;</i>
														</button>
													</div>
													<div class="modal-body">Bạn có muốn xác nhận hủy đơn
														hàng này không?</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-secondary"
															data-dismiss="modal">Hủy</button>
														<button type="button" class="btn btn-primary"
															onclick="confirmCancel(id)" data-dismiss="modal">Xác
															nhận</button>
													</div>
												</div>
											</div>
										</div>
								</span>
								
								
								</td>
							</tr>

						</tbody>
					</table>


				</div>
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
</body>

</html>