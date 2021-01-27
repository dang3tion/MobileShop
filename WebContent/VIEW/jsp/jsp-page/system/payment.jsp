<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
<jsp:include page="/VIEW/jsp/jsp-component/head-css.jsp" />
<c:url var="url" scope="session" value="/VIEW"></c:url>
<%@ page import="model_utility.Config"%>
<style>
</style>
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
	<!-- breadcumb -->
	<c:import url="/VIEW/jsp/jsp-component/breadcumb.jsp">
		<c:param name="title" value="Thanh toán"></c:param>
	</c:import>


	<c:choose>
		<c:when test="${ QUANTITY_INSTANCE_PRODUCT != null }">





			<div class="container" style="margin: 60px auto; max-width: 80%;">


				<form onsubmit="return checkSubmit()" method="post"
					action="${pageContext.request.contextPath}/payment"
					style="margin: auto;">

					<div class="py-1 text-center">
						<img class="d-block mx-auto mb-4"
							src="${url}/image/img-sys/payment.png" alt="" width="72"
							height="72">
						<h2>Xác nhận thanh toán</h2>

					</div>

					<div class="row mt-5">

						<div style="font-size: 1.1em" class="col-md-4 order-md-2 mb-4">
							<h4
								class="d-flex justify-content-between align-items-center mb-3">
								<span class="text-muted">Sản phẩm của bạn</span> <span
									class="badge badge-secondary badge-pill">${CART_QUANTITY}</span>
							</h4>
							<ul class="list-group mb-3">
								<c:forEach items="${LIST_INSTANCE_PRODUCT}" var="pro">
									<li
										class="list-group-item d-flex justify-content-between lh-condensed">
										<div>
											<h6 style="font-size: 0.8em" class="my-0">${pro.name}
												(${pro.color}) <span style="color: blue;"> x
													${pro.quantityInCart} </span>
											</h6>
										</div> <span style="color: #C41111; font-weight: bolder;"
										class="price"> <fmt:formatNumber type="number"
												maxFractionDigits="3"
												value="${pro.price * pro.quantityInCart }" /> <span
											class='unit'>đ</span>
									</span>
									</li>
								</c:forEach>

								<li class="list-group-item d-flex justify-content-between"><span>Tổng
										cộng</span> <strong class="price"><fmt:formatNumber
											type="number" maxFractionDigits="3" value="${TOTAL_MONEY }" />
										<span class='unit'>đ</span></strong></li>
							</ul>


							<div class="row" style="margin-top: 20px;">



								<button onclick="checkClick()" class="btn btn-primary"
									style="padding: 7px 130px; text-align: center; margin: auto;"
									type="submit">XÁC NHẬN</button>


							</div>



						</div>

						<div class="col-md-8 order-md-1">




							<div class="mb-3" id="diaChiForm">


								<label for="cc-name">Địa chỉ giao hàng:</label>

								<!-- 	@@@@@@@@@ START CHOOSE ADDRESS @@@@@@@@@@@@@ -->
								<div class="row">
									<div id="province-dropdown">
										<select onchange="getDistrict(this.value)" class="mx-2"
											style="height: 38px; min-width: 140px; padding: 3px; outline: 0; border: 1px solid #b7b7b7; border-radius: 5px;"
											name="province" id="setinh">
											<option  value = "0">Chọn tỉnh/thành phố</option>
											
											<c:forEach items="${LIST_PROVINCE}" var="pro">
												<option value="${pro.key}">${pro.value}</option>
											</c:forEach>
										</select> <span id="tinh"
											style="display: none; width: 150px; color: red">Chọn
											tỉnh/thành phố</span>
									</div>
									<div id="district-dropdown">
										<select class="mx-2"
											style="height: 38px; min-width: 140px; padding: 3px; outline: 0; border: 1px solid #b7b7b7; border-radius: 5px;"
											name="district" id="sehuyen">
											<option  value="0">Chọn quận/huyện</option>
										</select> <span id="huyen"
											style="display: none; width: 150px; color: red">Chọn
											quận/huyện</span>
									</div>
									<div id="ward-dropdown">
										<select class="mx-2"
											style="height: 38px; min-width: 140px; padding: 3px; outline: 0; border: 1px solid #b7b7b7; border-radius: 5px;"
											name="ward" id="sexa">
											<option  selected value="0">Chọn phường/xã</option>
										</select> <span id="xa" style="display: none; width: 150px; color: red">Chọn
											phường/xã</span>
									</div>

									<div id="street">
										<input style="width: 170px" id="inAddress" name="street"
											type="text" class="form-control"
											placeholder="Tên đường, số nhà" value=""
											onfocusout="check_address(this.id)">

										<div style="color: red;" class="col-6">
											<span id="address" style="display: none; width: 150px">không
												để trống</span>
										</div>

									</div>
								</div>
								<!-- 	@@@@@@@@@ END CHOOSE ADDRESS @@@@@@@@@@@@@ -->


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
										<input value="${CUSTOMER_LOGINED.name}" id="inName"
											type="text" name="name" class="form-control"
											placeholder="Nhập họ tên không dấu"
											onfocusout="check_name(this.id)">
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
										<input value="${CUSTOMER_LOGINED.phoneNumber}" id="phone"
											name="phoneNumber" type="text" class="form-control"
											placeholder="Nhập số điện thoại"
											onfocusout="check_phone(this.id)">
									</div>
								</div>
								<div style="color: red;" class="col-6">
									<p id="name" style="display: none">Không được để trống.</p>
								</div>
								<div style="color: red; float: right">
									<p id="checkphone" style="display: none;">Vui lòng nhập
										đúng định dạng số điện thoại.</p>
								</div>
							</div>

							<c:if test="${CUSTOMER_LOGINED==null }">
								<div class="ml-3 col-12">
									<!-- 					#### captcha #### -->
									<!-- reCAPTCHA with Vietnamese language -->
									<script src='https://www.google.com/recaptcha/api.js?hl=vi'></script>

									<div class="g-recaptcha" data-sitekey="${Config.SITE_KEY}"></div>
									<h3 class="ml-4" style="color: red">${message}</h3>

									<!-- 					#### captcha #### -->
								</div>
							</c:if>


							<hr />
							<h6 class="mb-4">Chọn phương thức thanh toán:</h6>
							<div class="d-block my-3">
								<div class="custom-control custom-radio">
									<input id="credit" name="paymentMethod" value="Banking"
										type="radio" class="custom-control-input"
										onclick="hidenForm(this)" checked required> <label
										class="custom-control-label" for="credit">Chuyển khoản</label>
								</div>

								<div class="custom-control custom-radio "
									style="margin-top: 20px;">
									<input id="COD" name="paymentMethod" type="radio"
										class="custom-control-input" onclick="hidenForm(this)"
										value="COD" ${CHECKED_COD} required> <label
										class="custom-control-label " for="COD">Thanh toán khi
										nhận hàng (COD)</label>
								</div>





							</div>

							<div id="FormThanhToanBangThe">



								<div class="row ml-4">
									<h5>
										Bạn vui lòng chuyển <span class="text-danger"><fmt:formatNumber
												type="number" maxFractionDigits="3" value="${TOTAL_MONEY }" />
											VNĐ</span>
									</h5>
									<h5 class="mx-3">Vào STK : 045845723873284</h5>
									<h5>Chủ tài khoản: Trần Thanh Bảo, Chi nhánh: BIDV Đông
										Sài Gòn.</h5>
									<h5>
										Với nội dung là mã đơn hàng: <span class="text-danger">${CODE_ODER}</span>
									</h5>

								</div>

							</div>





						</div>
					</div>

				</form>

			</div>




		</c:when>
		<c:otherwise>
			<div style="margin-top: -10px; margin-bottom: 70px" class="container">
				<div class="row mb-4  text-center">
					<div class="col-12">

						<img style="" src="${url}/image/img-sys/emptycart.webp">
						<h2 style="margin-top: -20px">Giỏ hàng trống</h2>

					</div>
				</div>
			</div>
		</c:otherwise>
	</c:choose>




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

	<script>
		function vali_PhoneNumber(text) {
			const regex = /^(09|03|01[2|6|8|9])+([0-9]{8})/g;
			const result = regex.test(text);
			return result;
		}
		function vali_name(text) {
			const regex = /^[a-zA-Z]+[\-'\s]?[a-zA-Z ]+$/g;
			// 			const regex = /^\s*$/g;
			const result = regex.test(text);
			return result;
		}
		function vali_address(text) {
			const regex = /^\s*$/g;
			const result = regex.test(text);
			return result;
		}

		var checkPhone = false;
		var checkName = false;
		var checkAddress = false;
		function check_phone(id) {
			var s = document.getElementById(id).value;
			if (!vali_PhoneNumber(s)) {
				document.getElementById("checkphone").style.display = "block";
				checkPhone = false;
				return true;
			}
			if (vali_PhoneNumber(s)) {
				document.getElementById("checkphone").style.display = "none";
				checkPhone = true;
				return false;
			}
		}

		function check_address(id) {
			var s = document.getElementById(id).value;
			if (vali_address(s)) {
				document.getElementById("address").style.display = "block";
				checkAddress = false;
				return true;
			}
			if (!vali_address(s)) {
				document.getElementById("address").style.display = "none";
				checkAddress = true;
				return false;
			}
		}

		// 		function check_name(id) {
		// 			var s = document.getElementById(id).value;
		// 			if (!vali_name(s)) {
		// 				document.getElementById("name").style.display = "block";
		// 				checkName = false;
		// 				return true;
		// 			}
		// 			if (vali_name(s)) {
		// 				document.getElementById("name").style.display = "none";
		// 				checkName = true;
		// 				return false;
		// 			}
		// 		}

		function check_name(id) {
			var s = document.getElementById(id).value;
			if (s == null || s == "") {
				document.getElementById("name").style.display = "block";
				checkName = false;
				return true;
			}
			if (s != null || s == "") {
				document.getElementById("name").style.display = "none";
				checkName = true;
				return false;
			}
		}
		function checkSubmit() {
			console.log(checktinh);
			console.log(checkxa);
			console.log(checkhuyen);
			
			if (checkName && checkAddress && checkPhone&&checkhuyen&&checktinh&&checkxa) {
				return true;
			} else {
				return false;
			}
		}
	
		
		var checkhuyen = false;
		var chectinh = false;
		var checxa = false;
		
		function checkClick() {
			var name = document.getElementById("inName").value;
			var phone = document.getElementById("phone").value;
			var address = document.getElementById("inAddress").value;
			var huyen = document.getElementById("sehuyen").value;
			var xa = document.getElementById("sexa").value;
			var tinh = document.getElementById("setinh").value;
			console.log(huyen);
			console.log(tinh);
			console.log(xa);
			
			if (huyen == "0") {
				document.getElementById("huyen").style.display = "block";
			}else {
				document.getElementById("huyen").style.display = "none";
				checkhuyen = true;
			}
			if (xa == "0") {
				document.getElementById("xa").style.display = "block";
			}else {
				document.getElementById("xa").style.display = "none";
				checkxa = true;
			}
			if (tinh == "0") {
				document.getElementById("tinh").style.display = "block";
			}else {
				document.getElementById("tinh").style.display = "none";
				checktinh = true;
			}
			if (name == null || name == "") {
				document.getElementById("name").style.display = "block";
			}
			if (!vali_PhoneNumber(phone)) {
				document.getElementById("checkphone").style.display = "block";
			}
			if (vali_address(address)) {
				document.getElementById("address").style.display = "block";
			}
		}
	</script>


	<script type="text/javascript">
		function getDistrict(provinceIDvalue) {
			$.ajax({
				type : 'GET',
				url : '${pageContext.request.contextPath}/AJAXSelectDistrict',
				data : {
					provinceID : provinceIDvalue
				},
				success : function(response) {
					$('#district-dropdown').html(response);
				}

			});
		}
		function getWard(districtIDvalue) {
			$.ajax({
				type : 'GET',
				url : '${pageContext.request.contextPath}/AJAXSelectWard',
				data : {
					districtID : districtIDvalue
				},
				success : function(response) {
					$('#ward-dropdown').html(response);
				}

			});
		}
	</script>


</body>

</html>