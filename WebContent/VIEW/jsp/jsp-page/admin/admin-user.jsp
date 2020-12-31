

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



						<form action="${pageContext.request.contextPath}/admin/user"
							method="POST">
							<div class="ml-5 mb-2 form-row align-items-center">
								<div class="col-auto">
									<div class="input-group mb-2">
										<div class="input-group-prepend">
											<div class="input-group-text">
												<i class="fas fa-search"></i>
											</div>
										</div>
										<input name="keyword" type="text" class="form-control"
											placeholder="nhập từ khóa">
									</div>
								</div>
								<div class="col-auto">
									<button type="submit" class="btn btn-primary mb-2">Tìm
										kiếm</button>
								</div>
							</div>
						</form>

					</div>
					<table class="table table-hover">
						<thead class="thead-light">
							<tr>
								<th width="2" scope="col">Số TT</th>
								<th scope="col">Mã KH</th>
								<th scope="col">Tên</th>
								<th scope="col" data-toggle="tooltip" data-placement="top"
									title=""><span title=""> Số</span> điện thoại</th>
								<th width="200" scope="col" data-toggle="tooltip"
									data-placement="top" title=""><span
									title="Địa chỉ giao hàng mặc định"> Địa</span> chỉ</th>
								<th scope="col">Email</th>
								<th scope="col">Thời gian tạo</th>
								<th width="100" scope="col">Trạng thái</th>
								<th width="100" scope="col">Khóa/Mở khóa</th>
							</tr>
						</thead>


						<tbody id="content-table">
							<!-- 	############ AJAX TRẢ DỮ LIỆU TẠI ĐÂY #################### -->

							<!--          @@@@ trong đây nè -->


							<c:if test="${DEFAUTL_TABLE !=null }">
								<jsp:include page="/VIEW/jsp/jsp-component/user-table.jsp"></jsp:include>
							</c:if>


							<!-- 	############ AJAX TRẢ DỮ LIỆU TẠI ĐÂY #################### -->
						</tbody>
					</table>
				</div>

				<!-- 				PHÂN TRANG -->
				<div class="page-navigation" id="page-navigation"
					value="${totalPage}">
					<div class="beta">
						<button onclick="previousPage()">Trước</button>
						<span id="page-number"> </span>
						<button onclick="nextPage()">Sau</button>
					</div>
				</div>
			</div>
			<!-- 				PHÂN TRANG -->


		</div>

	</div>

	</div>

	<!-- 	@@@@@@@@@ GỬI DỮ LIỆU XUỐNG SERVER @@@@@@@@@@@@@@@@@ -->


	<script>
		function SendDataToServlet(number) {
			getNumberPageDefault(number);
			$
					.ajax({
						type : 'GET',
						url : '${pageContext.request.contextPath}/AJAXAdminUserManager',
						data : {

							page : parseInt(number)

						},
						success : function(responseText) {
							$('#content-table').html(responseText);
						}

					});

		}
		function SendDataBlock() {
			$
					.ajax({
						type : 'POST',
						url : '${pageContext.request.contextPath}/AJAXAdminUserManager',
						data : {

							page : move

						},
						success : function(responseText) {
							$('#content-table').html(responseText);
						}

					});

		}
	</script>

	<script src="${url}/js/js-page/devide-page-admin.js"></script>



	<!-- 	@@@@@@@@@ GỬI DỮ LIỆU XUỐNG SERVER @@@@@@@@@@@@@@@@@ -->


</body>
</html>




