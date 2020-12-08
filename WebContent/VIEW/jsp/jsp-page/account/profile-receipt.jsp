<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
    <jsp:include page="/VIEW/jsp/jsp-component/head-css.jsp"/>
    <jsp:include page="/VIEW/jsp/jsp-component/head-css-admin.jsp"/>
    <c:url var="url" scope="application" value="/VIEW"></c:url>
    <link rel="stylesheet" type="text/css" href="${url}/css/css-page/profile.css">
</head>

<body>
	<jsp:include page="/VIEW/jsp/jsp-component/menu.jsp"></jsp:include>
	<jsp:include page="/VIEW/jsp/jsp-component/head-css-admin.jsp"></jsp:include>
	<!-- Thanh menu loc du lieu va sap xep-->
	<%--<jsp:include page="/VIEW/jsp/jsp-component/filter.jsp"></jsp:include>--%>

	<%--breadcumb--%>
	<!-- Page Content -->
	<div class=" container m-2 mb-5">
		<div class="row">
			<c:import url="/VIEW/jsp/jsp-component/menu_profile.jsp">
				<c:param name="receiptedactive" value="active"></c:param>
			</c:import>
			<div class="col-sm-8">
				<div class="check-result">
					<h4 class="text-left mb-4">Đơn hàng đã đặt</h4>
					<table class="table table-hover ">
						<thead class="thead-light">
							<tr>
								<th scope="col">Mã đơn hàng</th>
								<th scope="col">Tên khách hàng</th>
								<th scope="col">Ngày đặt hàng</th>
								<th scope="col">Chi tiết đơn hàng</th>
								<th scope="col">Tình trạng đơn hàng</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">DH01</th>
								<td>Nguyễn Dũng</td>
								<td>10/10/2020</td>
								<td><a data-toggle="modal" data-target="#exampleModal1"
									href='#'> Chi tiết <i class="fa fa-external-link-alt"></i></a>





									<!-- Modal --> <!-- @@@@modal@@@@@@ -->
									<div class="modal fade" id="exampleModal1" tabindex="-1"
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
													<h5>Đơn hàng: DH01</h5>
													<table width="100%"
														class="text-center  table content-detail  table-hover">
														<thead class="thead-light">
															<tr>
																<th>Mã khách hàng</th>
																<th>Tên khách hàng</th>
																<th><span title="Số điện thoại"> SDT</span></th>
																<th style="min-width: 300px;">Địa chỉ</th>

															</tr>
														</thead>
														<tr>


															<td>KH01</td>
															<td>Trần Thanh Bảo</td>
															<td><span title="Số điện thoại"> 09128374822</span></td>
															<td style="min-width: 300px;">Khu phố 6, phường Linh
																Trung, quận Thủ Đức,TP Hồ Chí Minh
															</th>

														</tr>
													</table>
													<table width="100%"
														class="text-center  table content-detail  table-hover">
														<thead class="thead-light">
															<tr>
																<th>Hìn hảnh</th>
																<th>Mã sản phẩm</th>
																<th>Tên sản phẩm</th>
																<th>Màu sắc</th>
																<th>Số lượng</th>
																<th>Giá</th>

															</tr>
														</thead>
														<tr>
															<td></td>

															<td>SP01</td>
															<td>IPhone X 64GB</td>
															<td><span title="Số điện thoại"> Đen</span></td>
															<td style="min-width: 300px;">1
															</th>
															<td style="min-width: 300px;">17.000.000<span
																style="text-decoration: underline;">đ</span>
															</th>
														</tr>
														<tr>
															<td></td>

															<td>SP02</td>
															<td>Samsung Galaxy S10</td>
															<td><span title="Số điện thoại">Trắng</span></td>
															<td style="min-width: 300px;">1
															</th>
															<td style="min-width: 300px;">23.000.000<span
																style="text-decoration: underline;">đ</span>
															</th>
														</tr>
													</table>

												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary"
														data-dismiss="modal">Đóng</button>
												</div>
											</div>
										</div>
									</div> <!-- @@@@modal@@@@@@ --></td>
								<td>Đang giao hàng</td>
							</tr>

						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<!-- /.container -->


	<jsp:include page="/VIEW/jsp/jsp-component/footer.jsp"></jsp:include>
	<!-- Bootstrap core JavaScript -->

	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="${url}/js/js-page/form-forgot.js"></script>
</body>

</html>