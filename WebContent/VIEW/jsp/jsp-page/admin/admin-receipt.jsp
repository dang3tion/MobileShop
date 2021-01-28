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


					<table class="table table-hover " style="height:640px" id="receipt-table">
						<thead class="thead-light">
							<tr>
								<th scope="col">STT</th>
								<th scope="col">Mã đơn hàng</th>
								<th scope="col">Mã khách hàng</th>

								<th scope="col">Tổng giá trị</th>
								<th scope="col">Ngày lập</th>

								<th scope="col">Chi tiết đơn hàng</th>
								<th scope="col">Xác nhận đơn hàng</th>

							</tr>
						</thead>
						<tbody id="content-table">

							<!--START ĐƠN HÀNG -->




							<!--END ĐƠN HÀNG -->

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




		<input id="curent-page" value="${CURRENT_PAGE_ORDER_MANAGEMENT}" style="display: none"></input>

		<script type="text/javascript">
			function getCurrentPage() {
				return document.getElementById("curent-page").value;
			}
			function SendDataToServlet(number) {
				getNumberPageDefault(number);
				$
						.ajax({
							type : 'GET',
							url : '${pageContext.request.contextPath}/AJAXOderManagement',
							data : {
								page : parseInt(number)
							},
							success : function(responseText) {
								$('#content-table').html(responseText);
							}
						});
			}
		</script>
		<script src="${url}/js/js-page/devide-page-admin.js"></script>
		
</body>

</html>