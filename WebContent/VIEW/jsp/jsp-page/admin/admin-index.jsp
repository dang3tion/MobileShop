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
								<th scope="col">Số lượng tồn kho hiện tại</th>
								<th scope="col">Tổng lượt truy cập</th>
							</tr>
						</thead>
						<tbody>
							<tr class="">
								<th scope="row">100,000,000</th>
								<td>10,000,000</td>
								<td>123</td>
								<td>23</td>
								<td>17080</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="border mb-2">
					<h4 class="text-center mt-3 mb-3">Bảng thống kê bán hàng</h4>
					<div class="row">
						<div class="show-page mb-3 ml-3" style="padding-left: 10px">
							Hiển thị <span> <select id="show" onclick="select_page()">
									<option value="10">10</option>
									<option value="20">20</option>
									<option value="50">50</option>
							</select></span> cột
						</div>
						<div class="show-page" style="margin-left: 50px">
							Tìm kiếm <span> <input id="myInput"
								style="padding-left: 15px; border: 0.5px solid grey" type="text"
								placeholder="Search.." /></span>
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
								<th scope="col" data-toggle="tooltip" data-placement="top"
									title="Số lượng sản phẩm tồn kho"><span
									title="Số lượng sản phẩm"> SLSP</span> được thêm</th>
								<th scope="col">Số lượng tồn kho</th>
								<th scope="col">Số lượng truy cập</th>
							</tr>
						</thead>
						<tbody id="content-table">
							<tr>
								<th scope="row">9/2020</th>
								<td>30,000,00</td>
								<td>4</td>
								<td>2</td>
								<td>42</td>
								<td>400</td>
							</tr>
							<tr>
								<th scope="row">8/2020</th>
								<td>24,000,00</td>
								<td>3</td>
								<td>4</td>
								<td>46</td>
								<td>200</td>
							</tr>
							<tr>
								<th scope="row">7/2020</th>
								<td>12,000,00</td>
								<td>2</td>
								<td>5</td>
								<td>49</td>
								<td>502</td>
							</tr>
							<tr>
								<th scope="row">6/2020</th>
								<td>22,000,00</td>
								<td>7</td>
								<td>2</td>
								<td>51</td>
								<td>420</td>
							</tr>
							<tr>
								<th scope="row">5/2020</th>
								<td>30,000,00</td>
								<td>5</td>
								<td>8</td>
								<td>58</td>
								<td>492</td>
							</tr>
							<tr>
								<th scope="row">4/2020</th>
								<td>25,000,00</td>
								<td>2</td>
								<td>4</td>
								<td>63</td>
								<td>100</td>
							</tr>
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
