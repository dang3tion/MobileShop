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
					<div class="mt-5">
						
						
					</div>
					
					
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

							<!-- 						START ĐƠN HÀNG -->
							<c:forEach var="order" items="${LIST_ORDER}">
								<tr>
									<td>${order.orderID}</td>
									<td>${order.customerID}</td>

									<td><fmt:formatNumber type="number" maxFractionDigits="3"
											value="${order.totalMoney}" /> <span> đ</span> </td>
									<td>${order.timeCreate}</td>

									<td class="detail"><a data-toggle="modal"
										data-target="#orderDetail${order.orderID}" > Chi tiết <i
											class="fa fa-external-link-alt"></i></a> <!-- Modal --></td>
									<td class="confirm"><span> <input
											class="confirm-check" type="checkbox" value="confirm-check"
											name="confirm-check"> <label
											title="Xác nhận đơn hàng" class="label-check active"
											data-toggle="modal"><i class="fas fa-check-square"></i></label>
											<div class="modal fade" tabindex="-1"
												aria-labelledby="exampleModalLabel" aria-hidden="true">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header">
															<h5 class="modal-title" id="exampleModalLabel">Xác
																nhận đơn hàng</h5>
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<i aria-hidden="true">&times;</i>
															</button>
														</div>
														<div class="modal-body">Bạn có muốn xác nhận đơn
															hàng này không?</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-secondary"
																data-dismiss="modal">Hủy</button>
															<button type="button" class="btn btn-primary"
																data-dismiss="modal">Xác nhận</button>
														</div>
													</div>
												</div>
											</div>
									</span> <span> <input class="confirm-check" type="checkbox"
											value="confirm-delivered" name="confirm-deliverd"> <label
											title="Xác nhận vận chuyển thành công"
											class="label-delivered disable"><i
												class="fas fa-truck"></i></label>
											<div class="modal fade" tabindex="-1"
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
																data-dismiss="modal">Xác nhận</button>
														</div>
													</div>
												</div>
											</div>
									</span> <span> <input class="confirm-check" type="checkbox"
											value="confirm-cancel" name="confirm-cancel"> <label
											title="Hủy đơn hàng" data-toggle="modal"
											class="label-cancel warning"><i class="fas fa-trash"></i></label>
											<div class="modal fade" tabindex="-1"
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
																data-dismiss="modal">Xác nhận</button>
														</div>
													</div>
												</div>
											</div> 
											
											<!-- 						START CHI TIẾT ĐƠN HÀNG					 -->
											<div class="modal fade" id="orderDetail${order.orderID}" tabindex="-1"
												aria-labelledby="exampleModalLabel" aria-hidden="true">
												<div class="modal-dialog  detail-modal">
													<div class="modal-content">
														<div class="modal-header">
															<h5 class="modal-title" id="exampleModalLabel">Chi
																tiết đơn hàng</h5>
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
														</div>
														<div class="modal-body">
															<h5>Đơn hàng: ${order.orderID}</h5>
															<table width="100%"
																class="text-center  table content-detail  table-hover">
																<thead class="thead-light">
																	<tr>
																		<th>Mã khách hàng</th>
																		<th>Tên khách hàng</th>
																		<th><span title="Số điện thoại"> Số điện
																				thoại</span></th>
																		<th>Hình thức thanh toán</th>
																		<th style="min-width: 300px;">Địa chỉ</th>

																	</tr>
																</thead>
																<tr>


																	
																	<td>${order.customerID}</td>
												
																	<td>${order.name}</td>
																	<td><span title="Số điện thoại">
																			${order.phoneNumber}</span></td>
																	<td>${order.paymentMethods}</td>
																	<td style="min-width: 300px;">${order.address}
																	</th>

																</tr>
															</table>
															<table width="100%"
																class="text-center  table content-detail  table-hover">
																<thead class="thead-light">
																	<tr>
																		<th>Hình ảnh</th>
																		<th>Mã sản phẩm</th>
																		<th>Tên sản phẩm</th>
																		<th>Màu sắc</th>
																		<th>Số lượng</th>
																		<th>Giá</th>

																	</tr>
																</thead>
																
																<c:forEach var="pro" items="${order.listProduct}">
																<tr>
																	<td style="max-width: 140px;"><img
																		src="${pro.img}" width="100px"
																		height="100px" alt=""></td>
																	<td>${pro.id}</td>
																	<td>${pro.name}</td>
																	<td><span title="Số điện thoại">${pro.color}</span></td>
																	<td style="min-width: 300px;">${pro.quantityInCart}
																	</th>
																	<td style="min-width: 300px;">${pro.price}<span
																		style="text-decoration: underline;">đ</span>
																	</th>
																</tr>
																	</c:forEach>														
															
															</table>

														</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-secondary"
																data-dismiss="modal">Đóng</button>
														</div>
													</div>
												</div>
											</div> <!-- 				END CHI TIẾT ĐƠN HÀNG	 -->


									</span></td>
								</tr>
							</c:forEach>

							<!--END ĐƠN HÀNG -->

						</tbody>
					</table>


				</div>
				<div class="page-navigation">
					<div class="beta">
						<button onclick="previous_page()">Trước</button>
						<span id="page-number"> </span>
						<button onclick="next_page()">Sau</button>
					</div>
				</div>


			</div>

		</div>
		<script src="${url}/js/js-page/confirmed.js"></script>
</body>

</html>