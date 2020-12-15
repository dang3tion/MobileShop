

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
			<c:param name="useractive" value="active"></c:param>
		</c:import>
		<!-- Page right -->
		<div id="page-content-wrapper">
			<!-- 		toggle logout -->
			<jsp:include page="/VIEW/jsp/jsp-component/toggle-logout-bar.jsp"></jsp:include>
			<!-- 			main content -->
			<div class="container-fluid">
				<div class="mb-5 mt-3">
					<h4 class="mt-3 mb-3">Thống kê tài khoản</h4>



					<table class="table">
						<thead class="thead-dark">
							<tr>
								<th scope="col">Số tài khoản đã tạo</th>
								<th scope="col">số tài khoản đang hoạt động</th>
								<th scope="col">số tài khoản bị khóa</th>
								<th scope="col">số tài khoản đã đăng kí hôm nay</th>
							</tr>
						</thead>
						<tbody>
							<tr class="">
								<th scope="row">${totalAccount}</th>
								<td>${TongSoAccDangHoatDong}</td>
								<td>${TongSoAccBiKhoa}</td>
								<td>${totalPage}</td>
							</tr>
						</tbody>
					</table>

				</div>
				<div class="border mb-2">
					<h4 class="text-center mt-3 mb-3"></h4>
					<div class="row">

						<!-- 												<div class="show-page mb-3 ml-3" style="padding-left: 10px"> -->
						<!-- 													Hiển thị <span> <select id="rowsPerPage"> -->
						<!-- 															<option value="10">10</option> -->
						<!-- 															<option value="20">20</option> -->
						<!-- 															<option value="50">50</option> -->
						<!-- 													</select></span> -->


						<!-- 												</div> -->
						<div class="show-page" style="margin-left: 50px">
							Tìm kiếm <span> <input id="myInput"
								style="padding-left: 15px; border: 0.5px solid grey" type="text"
								placeholder="Search.." /></span>
						</div>
					</div>
					<table class="table table-hover">
						<thead class="thead-light">
							<tr>
								<th scope="col">Số TT</th>
								<th scope="col">Mã KH</th>
								<th scope="col">Tên</th>
								<th scope="col" data-toggle="tooltip" data-placement="top"
									title=""><span title=""> Số</span> điện thoại</th>
								<th scope="col" data-toggle="tooltip" data-placement="top"
									title=""><span title="Địa chỉ giao hàng mặc định">
										Địa</span> chỉ</th>
								<th scope="col">Email</th>
								<th scope="col">Thời gian tạo</th>
								<th scope="col">Trạng thái</th>
							</tr>
						</thead>


						<tbody id="content-table">
							<!-- 	############ AJAX TRẢ DỮ LIỆU TẠI ĐÂY #################### -->

							<!--          @@@@ trong đây nè -->


							<c:if test="${DEFAUTL_TABLE !=null }">						
								<c:forEach var="user" items="${listUser}" varStatus="i">
									<tr>
										<td>${STTstart+i.index}</td>
										<th scope="row">${user.id}</th>
										<td>${user.name}</td>
										<td>${user.phoneNumber}</td>
										<td>${user.address}</td>
										<td>${user.email}</td>
										<td>${user.timeCreate}</td>
										<td>${user.status}</td>
									</tr>
								</c:forEach>
							</c:if>


							<!-- 	############ AJAX TRẢ DỮ LIỆU TẠI ĐÂY #################### -->
						</tbody>
					</table>
				</div>

				<!-- 				PHÂN TRANG -->
				<div class="container-fluid d-flex justify-content-end">
					<div class="col-6">
						<div class="row">
							<div class="col-4">
								<a href="#" class="btn btn-primary active" role="button"
									aria-pressed="true"><i class="fas fa-arrow-circle-left"></i>
									previous</a>
							</div>
							<div class="col-4" style="width: 10%; margin-left: -60px;">
								<select onchange="SendDataToServlet()" id="page"
									class="form-control SendData">
									<!-- 									số mặc định -->
									<!-- 									<option value="1" selected hidden>1</option> -->

									<c:forEach var="i" begin="1" end="${totalPage}">
										<option>${i}</option>
									</c:forEach>

								</select>
							</div>
							<div class="col-4">
								<a href="#" class="btn btn-primary active" role="button"
									aria-pressed="true">next <i
									class="fas fa-arrow-circle-right"></i></a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 				PHÂN TRANG -->


		</div>

	</div>

	</div>

	<!-- 	@@@@@@@@@ GỬI DỮ LIỆU XUỐNG SERVER @@@@@@@@@@@@@@@@@ -->


	<script>
		function SendDataToServlet() {
			$
					.ajax({
						type : 'GET',
						url : '${pageContext.request.contextPath}/AJAXAdminUserManager',
						data : {
							page : document.getElementById("page").value
						},
						success : function(responseText) {
							$('#content-table').html(responseText);
						}

					});
		}
	</script>





	<!-- 	@@@@@@@@@ GỬI DỮ LIỆU XUỐNG SERVER @@@@@@@@@@@@@@@@@ -->


</body>
</html>




