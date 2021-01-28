<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<c:forEach var="order" items="${LIST_ORDER}" varStatus="i">
	<tr>
		<td>${STTstart+i.index}</td>
		<td>${order.orderID}</td>
		<td>${order.customerID}</td>
		<td><fmt:formatNumber type="number" maxFractionDigits="3"
				value="${order.totalMoney}" /> <span> đ</span></td>
		<td>${order.timeCreate}</td>

		<td class="detail"><a data-toggle="modal"
			data-target="#orderDetail${order.orderID}"> Chi tiết <i
				class="fa fa-external-link-alt"></i></a> <!-- Modal --></td>

		<td class="confirm">
		
		
		
		
		
		
		<span> <label
				title="Xác nhận đơn hàng" id="lbcheck-${order.orderID}"
				data-target="#confirm-${order.orderID}" class="label-check active"
				data-toggle="modal"><i class="fas fa-check-square"></i></label>
				<div class="modal fade" id="confirm-${order.orderID}" tabindex="-1"
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
							<div class="modal-body">Bạn có muốn xác nhận đơn hàng này
								không?</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Hủy</button>
								<button type="button" class="btn btn-primary"
									onclick="confirmedCheck('${order.orderID}')"
									data-dismiss="modal">Xác nhận</button>
							</div>
						</div>
					</div>
				</div>
		</span> <span> <label title="Xác nhận vận chuyển thành công"
				id="lbdelivery-${order.orderID}"
				data-target="#delivery-${order.orderID}"
				class="label-delivered disable"><i class="fas fa-truck"></i></label>
				<div class="modal fade" id="delivery-${order.orderID}" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Xác nhận vận
									chuyển</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<i aria-hidden="true">&times;</i>
								</button>
							</div>
							<div class="modal-body">Bạn có muốn xác nhận vận chuyển
								thành công?</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Hủy</button>
								<button type="button" class="btn btn-primary"
									onclick="confirmedDelivery('${order.orderID}')"
									data-dismiss="modal">Xác nhận</button>
							</div>
						</div>
					</div>
				</div>
		</span> <span> <label title="Hủy đơn hàng"
				id="lbcancel-${order.orderID}"
				data-target="#cancel-${order.orderID}" data-toggle="modal"
				class="label-cancel warning"><i class="fas fa-trash"></i></label>
				<div class="modal fade" tabindex="-1" id="cancel-${order.orderID}"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Xác nhận hủy
									đơn</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<i aria-hidden="true">&times;</i>
								</button>
							</div>
							<div class="modal-body">Bạn có muốn xác nhận hủy đơn hàng
								này không?</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Hủy</button>
								<button type="button" class="btn btn-primary"
									onclick="confirmCancel('${order.orderID}')"
									data-dismiss="modal">Xác nhận</button>
							</div>
						</div>
					</div>
				</div>
		</span> <!-- START CHI TIẾT ĐƠN HÀNG-->
			<div class="modal fade" id="orderDetail${order.orderID}"
				tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog  detail-modal">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Chi tiết đơn
								hàng</h5>
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
										<th>Tên  khách hàng</th>
										<th><span title="Số điện thoại"> Số điện thoại</span></th>
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
										<td style="max-width: 140px;"><img src="${pro.img}"
											width="100px" height="100px" alt=""></td>
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
			</div> <!-- END CHI TIẾT ĐƠN HÀNG	--></td>
	</tr>
</c:forEach>


<script type="text/javascript">
	function confirmedCheck(id) {
		var lb = document.getElementById('lbcheck-' + id);
		var deli = document.getElementById('lbdelivery-' + id);
		lb.setAttribute("class", "confirmed");
		$(lb).removeAttr("data-toggle");
		deli.setAttribute("class", "active");
		deli.setAttribute("data-toggle", "modal");
		$.ajax({
			type : 'POST',
			url : '${pageContext.request.contextPath}/admin/cskh/receipt',
			data : {

				id : id,
				action : 'CONFIRM',
				page : getMove()

			},
			success : function(responseText) {
				location.reload();
			}

		});

	}

	function confirmedDelivery(id) {

		var lb = document.getElementById('lbdelivery-' + id);
		lb.setAttribute("class", "confirmed");
		$(lb).removeAttr("data-toggle");

		$.ajax({
			type : 'POST',
			url : '${pageContext.request.contextPath}/admin/cskh/receipt',
			data : {

				id : id,
				action : 'DELIVERY',
				page : getMove()

			},
			success : function(responseText) {
				// 				$('#content-table').html(responseText);
				location.reload();
			}

		});

	}
	function confirmCancel(id) {
		var lb = document.getElementById('lbcancel-' + id);
		lb.setAttribute("class", "confirmed");
		$(lb).removeAttr("data-toggle");
		$.ajax({
			type : 'POST',
			url : '${pageContext.request.contextPath}/admin/cskh/receipt',
			data : {

				id : id,
				action : 'CANCEL',
				page : getMove()

			},
			success : function(responseText) {
				location.reload();
			}

		});

	}
</script>







