<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
<c:url var="url" scope="page" value="/VIEW"></c:url>
<jsp:include page="/VIEW/jsp/jsp-component/head-css-admin.jsp"></jsp:include>
</head>

<body>

	<div class="d-flex" id="wrapper">
		<!-- Sidebar left -->
		<c:import url="/VIEW/jsp/jsp-component/sidebar-admin.jsp">
			<c:param name="indexactive" value="active"></c:param>
		</c:import>
		<!-- Page right -->
		<div id="page-content-wrapper">
			<!-- 		toggle logout -->
			<jsp:include page="/VIEW/jsp/jsp-component/toggle-logout-bar.jsp"></jsp:include>
			<!-- 			main content -->
			<div class="container-fluid">
				<div class="mb-5 mt-3">
					<h4 class="mt-3 mb-3">Bảng tính tổng</h4>

					<table class="table">
						<thead class="thead-dark">
							<tr>
								<th scope="col">Tổng doanh thu</th>
								<th scope="col">Doanh thu trung bình mỗi tháng</th>
								<th scope="col">Tổng số sản phẩm đã bán</th>
								<th scope="col">Tổng lượt truy cập</th>
							</tr>
						</thead>
						<tbody>
							<tr class="">
								<th scope="row"><fmt:formatNumber type="number"
										maxFractionDigits="3" value="${total}" /> <span class="unit">đ</span></th>
								<td><fmt:formatNumber type="number" maxFractionDigits="3"
										value="${avg}" /> <span class="unit">đ</span></td>
								<td>${sale}</td>
								<td>${access}</td>

							</tr>
						</tbody>
					</table>

				</div>
				<div class="border mb-2">
					<h4 class="text-center mt-3 mb-3">Bảng thống kê bán hàng</h4>
					<div class="row">
						<div class="show-page mb-3 ml-3" style="padding-left: 10px">
							<!-- 							Hiển thị <span> <select id="show" onclick="select_page()"> -->
							<!-- 									<option value="10">10</option> -->
							<!-- 									<option value="20">20</option> -->
							<!-- 									<option value="50">50</option> -->
							<!-- 							</select></span> cột -->
						</div>
						<div class="show-page" style="margin-left: 50px">
							<!-- 							Tìm kiếm <span> <input id="myInput" -->
							<!-- 								style="padding-left: 15px; border: 0.5px solid grey" type="text" -->
							<!-- 								placeholder="Search.." /></span> -->
						</div>
					</div>
					<table class="table table-hover">
						<thead class="thead-light">
							<tr>
								<th scope="col">Thời gian</th>
								<th scope="col">Doang thu</th>
								<th scope="col" data-toggle="tooltip" data-placement="top"
									title="Số lượng sản phẩm được thêm"><span
									title="Số lượng sản phẩm"> SLSP</span> bán được</th>
								<th scope="col">Số lượng truy cập</th>
							</tr>
						</thead>
						<tbody id="content-table">
							<c:forEach items="${list}" var="tk">
								<tr>
									<th scope="row">${tk.date}</th>
									<td><fmt:formatNumber type="number" maxFractionDigits="3"
										value="${tk.revenue}" /> <span class="unit">đ</span></td>
									<td>${tk.productSaled}</td>
									<td>${tk.sumAccess}</td>
								</tr>
							</c:forEach>

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

	</div>
</body>
</html>
