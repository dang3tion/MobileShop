

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
								<th scope="row">${totalPage}</th>
								<td>10,000,000</td>
								<td>123</td>
								<td>23</td>
							</tr>
						</tbody>
					</table>

				</div>
				<div class="border mb-2">
					<h4 class="text-center mt-3 mb-3"></h4>
					<div class="row">
						<div class="show-page mb-3 ml-3" style="padding-left: 10px">
							Hiển thị <span> <select id="show" onclick="select_page()">
									<option value="10">10</option>
									<option value="20">20</option>
									<option value="50">50</option>
							</select></span>


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
								<select class="form-control SendData">
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


	<script >
		$(document).ready(function() {
			$(".SendData").click(function() {
				$.ajax({
					type : 'GET',
					url : 'GetUserServlet',
					data : {
						PageNumber : $('#userName').val(),
						hihi : 'sfsfas'
					},
					success : function(responseText) {
						$('#ajaxGetUserServletResponse').text(responseText);
					}
				});
			});
		});
	</script>


	<!-- 	@@@@@@@@@ GỬI DỮ LIỆU XUỐNG SERVER @@@@@@@@@@@@@@@@@ -->


</body>
</html>




