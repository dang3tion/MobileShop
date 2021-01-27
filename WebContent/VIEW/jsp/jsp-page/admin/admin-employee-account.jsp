


<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<c:url var="url" scope="page" value="/VIEW"></c:url>
<jsp:include page="/VIEW/jsp/jsp-component/head-css-admin.jsp"></jsp:include>
</head>



<body>
	<div class="d-flex" id="wrapper">
		<!-- Sidebar left -->
		<c:import url="/VIEW/jsp/jsp-component/sidebar-admin.jsp">
			<c:param name="employeeaccountactive" value="active"></c:param>
		</c:import>
		<!-- Page right -->
		<div id="page-content-wrapper">
			<!-- 		toggle logout -->
			<jsp:include page="/VIEW/jsp/jsp-component/toggle-logout-bar.jsp"></jsp:include>
			<!-- 			main content -->
			<div class="container-fluid">
				<div class="mb-5 mt-3">
					<h3 class="mt-3 mb-3">Quản lý tài khoản nhân viên</h3>


					<div class="controller d-flex justify-content-center">

						<div class="row">
							<strong>THÊM NHÂN VIÊN</strong>
						</div>
					</div>

					<div class="controller d-flex justify-content-center">
						
						<div class="row">
							<div class="col-4 mt-4">
								<span>Tên tài khoản</span> <input style="min-width: 300px"
									type="text" class="form-control">
							</div>
							<div class="col-4 mt-4">
								<span>Mật khẩu</span> <input style="min-width: 300px"
									type="text" class="form-control">
							</div>
							<div class="col-4 mt-4">
								<span>Nhập lại mật khẩu</span> <input style="min-width: 300px"
									type="text" class="form-control">
							</div>
							<div class="col-4 mt-4">
								<span>Họ tên</span> <input style="min-width: 300px" type="text"
									class="form-control">
							</div>
							<div class="col-4 mt-4">
								<span>Số điện thoại</span> <input style="min-width: 300px"
									type="text" class="form-control">
							</div>
							<div class="col-4 mt-4">
								<span>Địa chỉ</span> <input style="min-width: 300px" type="text"
									class="form-control">
							</div>
							<div class="col-4 mt-4">
								<span>Chức vụ/ vị trí</span> <select
									style="min-height: 38px; min-width: 372px; outline: 0; border: 1px solid #b7b7b7; border-radius: 5px;">
									<option disabled="" selected="" value="">Chọn chức
										vụ/vị trí</option>

									<option value="CSKH">Chăm sóc khách hàng</option>

									<option value="WAREHOUSE">Nhân viên kho/ quản lý sản
										phẩm</option>




								</select>



							</div>
							<div class="col-4 mt-4">
								<button type="button" class="btn btn-primary mt-4">Xem
									quyền hạn nhân viên kho/ quản lý sản phẩm</button>
							</div>
							<div class="col-4 mt-4">
								<button type="button" class="btn btn-primary mt-4">Xem
									quyền hạn nhân viên CSKH</button>
							</div>
						</div>
					</div>



				</div>
				<div class="border mb-2">
					<h4 class="text-center mt-3 mb-3"></h4>
					<div class="row"></div>
					<table class="table table-hover">
						<thead class="thead-light">
							<tr>
								<th width="2" scope="col">Số TT</th>
								<th scope="col">Mã NV</th>
								<th scope="col">Chức vụ</th>
								<th scope="col">Tên</th>
								<th scope="col" data-toggle="tooltip" data-placement="top"
									title=""><span title=""> Số</span> điện thoại</th>
								<th width="200" scope="col" data-toggle="tooltip"
									data-placement="top" title=""><span
									title="Địa chỉ giao hàng mặc định"> Địa</span> chỉ</th>
								<th scope="col">tên tài khoản</th>
								<th scope="col">Thời gian tạo</th>
								<th width="100" scope="col">Trạng thái</th>
								<th width="100" scope="col">Khóa/Mở khóa</th>
							</tr>
						</thead>


						<tbody id="content-table">
							<!-- 	############ AJAX TRẢ DỮ LIỆU TẠI ĐÂY #################### -->

							<c:forEach var="user" items="${listUser}" varStatus="i">
								<tr>
									<td>${STTstart+i.index}</td>
									<th scope="row">${user.id}</th>

									<c:choose>
										<c:when test="${user.role == 'CSKH'}">
											<th>Nhân viên CSKH</th>
										</c:when>
										<c:when test="${user.role == 'WAREHOUSE'}">
											<th>Nhân viên kho</th>
										</c:when>
									</c:choose>


									<c:choose>
										<c:when test="${user.name != '' }">
											<td>${user.name}</td>
										</c:when>
										<c:otherwise>
											<td>chưa cập nhật</td>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${user.phoneNumber != '' }">
											<td>${user.phoneNumber}</td>
										</c:when>
										<c:otherwise>
											<td>chưa cập nhật</td>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${user.address != '' }">
											<td>${user.address}</td>
										</c:when>
										<c:otherwise>
											<td>khách hàng chưa cập nhật</td>
										</c:otherwise>
									</c:choose>
									<td>${user.email}</td>
									<td>${user.timeCreate}</td>
									<td><c:choose>
											<c:when test="${user.status == 'ENABLE'}">
				Đang hoạt động
			</c:when>
											<c:otherwise>
												<span style="color: red">Đã bị khóa</span>
											</c:otherwise>
										</c:choose></td>
									<td class="row" style="border: none;"><c:choose>
											<c:when test="${user.status == 'ENABLE'}">
												<button id="lock-or-unlock-user-${user.email}" value=""
													type="button" onclick="onOffAccount('${user.email}')"
													class="btn btn-danger">
													Khóa <i class="fas fa-lock"></i>
												</button>
											</c:when>
											<c:otherwise>
												<button id="lock-or-unlock-user-${user.email}" value=""
													type="button" onclick="onOffAccount('${user.email}')"
													class="btn btn-success">
													<span>Mở</span> <i class="fas fa-lock-open"></i>
												</button>
											</c:otherwise>
										</c:choose></td>

								</tr>
							</c:forEach>
							<script>
								function onOffAccount(email) {

									var accept = confirm("Xác nhận hành động !");

									if (accept) {
										SendDataLock(email);
									}
								}
							</script>


							<!-- 	############ AJAX TRẢ DỮ LIỆU TẠI ĐÂY #################### -->
						</tbody>
					</table>
				</div>

				<!-- 				PHÂN TRANG -->
				<div class="page-navigation" id="page-navigation"
					value="${totalPage}">
					<div class="beta">
						<button onclick="previousPage()">Trước</button>
						<span id="page-number">
							<button class="active">1</button>
						</span>
						<button onclick="nextPage()">Sau</button>
					</div>
				</div>
			</div>
			<!-- 				PHÂN TRANG -->


		</div>

	</div>

	</div>


	<script type="text/javascript">
		function SendDataLock(emailvalue) {

			$
					.ajax({
						type : 'POST',
						url : '${pageContext.request.contextPath}/admin/employeeaccount',
						data : {

							email : emailvalue
						},
						success : function(responseText) {
							location.reload();
						}

					});
		}
	</script>

	<style>
/* The container-che-do-xem */
.container-che-do-xem {
	display: block;
	position: relative;
	padding-left: 35px;
	margin-bottom: 12px;
	cursor: pointer;
	font-size: 18px;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

/* Hide the browser's default radio button */
.container-che-do-xem input {
	position: absolute;
	opacity: 0;
	cursor: pointer;
}

/* Create a custom radio button */
.checkmark {
	position: absolute;
	top: 0;
	left: 0;
	height: 25px;
	width: 25px;
	background-color: #eee;
	border-radius: 50%;
}

/* On mouse-over, add a grey background color */
.container-che-do-xem:hover input ~ .checkmark {
	background-color: #ccc;
}

/* When the radio button is checked, add a blue background */
.container-che-do-xem input:checked ~ .checkmark {
	background-color: #2196F3;
}

/* Create the indicator (the dot/circle - hidden when not checked) */
.checkmark:after {
	content: "";
	position: absolute;
	display: none;
}

/* Show the indicator (dot/circle) when checked */
.container-che-do-xem input:checked ~ .checkmark:after {
	display: block;
}

/* Style the indicator (dot/circle) */
.container-che-do-xem .checkmark:after {
	top: 9px;
	left: 9px;
	width: 8px;
	height: 8px;
	border-radius: 50%;
	background: white;
}
</
body
>
</
html
>
