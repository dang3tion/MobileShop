<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<jsp:include page="/VIEW/jsp/jsp-component/head-css.jsp" />
<c:url var="url" scope="session" value="/VIEW"></c:url>
<style>
</style>
</head>

<body>
	<jsp:include page="/VIEW/jsp/jsp-component/menu.jsp"></jsp:include>
		<!-- Thanh menu loc du lieu va sap xep-->
	<jsp:include page="/VIEW/jsp/jsp-component/filterOther.jsp"></jsp:include>
<!-- breadcumb -->
	<c:import url="/VIEW/jsp/jsp-component/breadcumb.jsp">
		<c:param name="title" value="Thanh toán"></c:param>
	</c:import>
	<div class="container" style="margin: 60px auto; max-width: 80%;">
		<div class="py-1 text-center">
			<img class="d-block mx-auto mb-4"
				src="${url}/image/img-sys/payment.png" alt="" width="72" height="72">
			<h2>Xác nhận thanh toán</h2>

		</div>

		<div class="row mt-5">
			<div class="col-md-4 order-md-2 mb-4">
				<h4 class="d-flex justify-content-between align-items-center mb-3">
					<span class="text-muted">Sản phẩm của bạn</span> <span
						class="badge badge-secondary badge-pill">3</span>
				</h4>
				<ul class="list-group mb-3">
					<li
						class="list-group-item d-flex justify-content-between lh-condensed">
						<div>
							<h6 class="my-0">Iphone 8S</h6>
						</div> <span class=" price">9.000.000 <span class='unit'>đ</span></span>
					</li>
					<li
						class="list-group-item d-flex justify-content-between lh-condensed">
						<div>
							<h6 class="my-0">Sony Xpreria</h6>
						</div> <span class=" price">8.000.000 <span class='unit'>đ</span></span>
					</li>
					<li
						class="list-group-item d-flex justify-content-between lh-condensed">
						<div>
							<h6 class="my-0">Oppo A8 Plus</h6>
						</div> <span class=" price" style="color: red;">5.000.000 <span
							class='unit'>đ</span></span>
					</li>
					<li
						class="list-group-item d-flex justify-content-between lh-condensed">
						<div>
							<h6 class="my-0">Phí giao hàng</h6>
							<!-- <small class="text-muted">Phiên bản limited edition</small> -->
						</div> <span class=" price" style="color: red;">500.000 <span
							class='unit'>đ</span></span>
					</li>

					<li class="list-group-item d-flex justify-content-between"><span>Tổng
							cộng</span> <strong class="price">19.000.000 <span class='unit'>đ</span></strong>
					</li>
				</ul>


				<div class="row" style="margin-top: 20px;">
					<form method="post"
						action="${pageContext.request.contextPath}/payment"
						style="margin: auto;">
						<button class="btn btn-primary"
							style="padding: 7px 130px; text-align: center; margin: auto;"
							type="submit">Thanh Toán</button>
					</form>
				</div>



			</div>

			<div class="col-md-8 order-md-1">

				<form class="needs-validation" action="../../Bill_Page/Bill.html"
					novalidate>


					<div class="mb-3" id="diaChiForm">
						<label for="cc-name">Địa chỉ giao hàng:</label>
						<div class="input-group mb-2">
							<div class="input-group-prepend">
								<div class="input-group-text">
									<i class="fas fa-map-marked-alt"></i>
								</div>
							</div>
							<input type="text" class="form-control"
								placeholder="Nhập địa chỉ giao hàng">
						</div>
						<div class="invalid-feedback">Không được để trống</div>

					</div>


					<div class="form-row align-items-center">
						<div class="col-6">
							<label for="cc-name">Họ tên:</label>
							<div class="input-group mb-2">
								<div class="input-group-prepend">
									<div class="input-group-text">
										<i class="far fa-id-card"></i>
									</div>
								</div>
								<input type="text" class="form-control"
									placeholder="Nhập họ tên">
							</div>
						</div>

						<div class="col-6">
							<label for="cc-name">SDT:</label>
							<div class="input-group mb-2">
								<div class="input-group-prepend">
									<div class="input-group-text">
										<i class="fas fa-phone-square-alt"></i>
									</div>
								</div>
								<input type="text" class="form-control"
									placeholder="Nhập số điện thoại">
							</div>
						</div>
					</div>

					<hr/>
					<h6 class="mb-4">Chọn phương thức thanh toán:</h6>
					<div class="d-block my-3">
						<div class="custom-control custom-radio">
							<input id="credit" name="paymentMethod" type="radio"
								class="custom-control-input" onclick="hidenForm(this)" checked
								required> <label class="custom-control-label"
								for="credit">Chuyển khoản</label>
						</div>

						<div class="custom-control custom-radio "
							style="margin-top: 20px;">
							<input id="COD" name="paymentMethod" type="radio"
								class="custom-control-input" onclick="hidenForm(this)" required>
							<label class="custom-control-label " for="COD">Thanh toán
								khi nhận hàng (COD)</label>
						</div>
					</div>

					<div id="FormThanhToanBangThe">
					
					
						
						<div class="row ml-4">
							<h5>Bạn vui lòng chuyển 200.000.000VND </h5>
							<h5 class="mx-3"> Vào STK : 045845723873284</h5>
							<h5>Chủ tài khoản: Trần Thanh Bảo, Chi nhánh: BIDV Đông Sài Gòn.</h5>
						</div>

					</div>




				</form>


			</div>
		</div>

		<!-- Footer -->

	</div>


	<!-- /.container -->



	<jsp:include page="/VIEW/jsp/jsp-component/footer.jsp"></jsp:include>
	<script>
		function hidenForm(x) {
			if (x.id == "credit") {
				var form = document.getElementById("FormThanhToanBangThe");
				// var formDC = document.getElementById("diaChiForm");
				form.style.display = "block";
				formDC.style.display = "none";
			} else {
				var form = document.getElementById("FormThanhToanBangThe");
				var formDC = document.getElementById("diaChiForm");
				form.style.display = "none";
				formDC.style.display = "block";
			}
		}
	</script>


	<script src="${url }/js/js-page/form-validation.js"></script>
</body>

</html>