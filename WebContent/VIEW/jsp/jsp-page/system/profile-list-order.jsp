<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
<jsp:include page="/VIEW/jsp/jsp-component/head-css.jsp" />
<c:url var="url" scope="session" value="/VIEW"></c:url>
<jsp:include page="/VIEW/jsp/jsp-component/head-css-admin.jsp"></jsp:include>
<link rel="stylesheet" type="text/css"
	href="${url}/css/css-page/profile.css">

</head>

<%@page import="model_DAO.DAO_IconMenu"%>
<%
DAO_IconMenu dao = new DAO_IconMenu();
request.setAttribute("color", dao.colorWeb());
%>
<body
	style="color: ${color.colorText};background-color: ${color.colorBody}">
	<jsp:include page="/VIEW/jsp/jsp-component/menu.jsp"></jsp:include>
	<!-- Thanh menu loc du lieu va sap xep-->
	<c:import url="/VIEW/jsp/jsp-component/filter.jsp">
	</c:import>

	<c:import url="/VIEW/jsp/jsp-component/breadcumb.jsp">
		<c:param name="title" value="Đơn hàng đã đặt"></c:param>
	</c:import>
	<!-- Page Content -->
	<div class=" container m-2 mb-5">

		<div class="row">


			<c:import url="/VIEW/jsp/jsp-component/menu_profile.jsp">
				<c:param name="receiptedactive" value="active"></c:param>
			</c:import>

			<div class="col-sm-8">
				<!-- 				<form method="post" onsubmit="return checknhap()" -->
				<%-- 					action="${pageContext.request.contextPath}/member/profile"> --%>
				<div id="Card_ThongTinCaNhan" class="card block_component">
					<div class="card-header">
						<span> </span> <span><strong>Danh sách đơn hàng</strong></span>
					</div>

					<div class="card-body">

						<!-- @@@@@@@@@@@@@@@@@ -->

						<table class="table table-hover " id="receipt-table">
							<thead class="thead-light">
								<tr>
									<th scope="col">Mã đơn hàng</th>
									<th scope="col">Mã khách hàng</th>

									<th scope="col">Tổng giá trị</th>
									<th scope="col">Ngày lập</th>

									<th scope="col">Chi tiết đơn hàng</th>
									<th scope="col">Trạng thái</th>
									<th></th>
								</tr>
							</thead>
							<tbody id="content-table">

								<!-- 						START ĐƠN HÀNG -->
								<c:forEach var="order" items="${LIST_ORDER}">
									<tr>
										<td>${order.orderID}</td>
										<td>${order.customerID}</td>

										<td><fmt:formatNumber type="number" maxFractionDigits="3"
												value="${order.totalMoney}" /> đ</td>
										<td>${order.timeCreate}</td>

										<td class="detail"><a data-toggle="modal"
											data-target="#orderDetail${order.orderID}"> Chi tiết <i
												class="fa fa-external-link-alt"></i></a> <!-- Modal --> <!-- 						START CHI TIẾT ĐƠN HÀNG					 -->
											<div class="modal fade" id="orderDetail${order.orderID}"
												tabindex="-1" aria-labelledby="exampleModalLabel"
												aria-hidden="true">
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
																			src="${pro.img}" width="100px" height="100px" alt=""></td>
																		<td>${pro.id}</td>
																		<td>${pro.name}</td>
																		<td><span title="Số điện thoại">${pro.color}</span></td>
																		<td style="min-width: 300px;">${pro.quantityInCart}
																		</th>
																		<td style="min-width: 300px;"><fmt:formatNumber
																				type="number" maxFractionDigits="3"
																				value="${pro.price}" /> <span
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
											</div> <!-- 				END CHI TIẾT ĐƠN HÀNG	 --> <!-- 						START CHI TIẾT ĐƠN HÀNG					 -->


										</td>

										<td>${order.status}</td>
										<td>
											<button class="btn btn-danger sizeTh1" data-toggle="modal"
												data-target="#can${order.orderID}" data-toggle="tooltip"
												data-placement="top" title="Xóa">
												<i class="txt-center menu-icon fas fa-trash-alt"></i>
											</button>
										</td>




									</tr>

									<!-- Modal -->
									<div class="modal fade" id="can${order.orderID}" tabindex="-1"
										role="dialog" aria-labelledby="exampleModalLabel"
										aria-hidden="true">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<form
													action="${pageContext.request.contextPath}/member/receipted"
													method="post">
													<input style="display: none" value="${order.orderID}"
														name="cancel">
													<div class="modal-header">
														<h5 class="modal-title" id="exampleModalLabel">Xác
															nhận hủy đơn hàng ${order.orderID}</h5>
														<button type="button" class="close" data-dismiss="modal"
															aria-label="Close">
															<span aria-hidden="true">&times;</span>
														</button>
													</div>
													<div class="modal-body">Bạn có muốn hủy đơn hàng
														${order.orderID} với tổng giá trị ${order.totalMoney}.</div>
													<div class="modal-footer">
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

								<!--END ĐƠN HÀNG -->

							</tbody>
						</table>

						<!-- @@@@@@@@@@@@@@@@@ -->
					</div>



				</div>
			</div>
			<!-- 			</form> -->

		</div>
	</div>
	<!-- /.container -->


	<div style="margin-bottom: 200px"></div>


	<jsp:include page="/VIEW/jsp/jsp-component/footer.jsp"></jsp:include>
	<!-- Bootstrap core JavaScript -->

	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="${url}/js/js-page/form-forgot.js"></script>
</body>

</html>