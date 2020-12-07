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
	<!-- Page Content -->
	<div class="d-flex" id="wrapper">
		<!-- Sidebar -->
		<jsp:include page="/VIEW/jsp/jsp-component/sidebar-admin.jsp"></jsp:include>
		<!--Nav-->
	
		<!-- /#sidebar-wrapper -->

		<!-- Page Content -->
		<div id="page-content-wrapper">
			<nav
				class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
				<button class="btn btn-primary" id="menu-toggle">
					<i class="fas fa-bars"></i>
				</button>
				<div class=""></div>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav ml-auto mt-2 mt-lg-0">
						<li class="nav-item active"><a class="nav-link" href="#"
							data-toggle="modal" data-target="#log-out">Đăng xuất <span
								class="log-out"><i class="fas fa-arrow-right"></i></span></a></li>
						<!-- <li class="nav-item">
              <a class="nav-link" href="#">Link</a>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                aria-haspopup="true" aria-expanded="false">
                Dropdown
              </a>
              <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                <a class="dropdown-item" href="#">Action</a>
                <a class="dropdown-item" href="#">Another action</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#">Something else here</a>
              </div>
            </li> -->
					</ul>
					<div class="modal fade" id="log-out" tabindex="-1" role="dialog"
						aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLongTitle">Xác
										nhận đăng xuất</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">Bạn có muốn đăng xuất?</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">Hủy</button>
									<button type="button" class="btn btn-primary">Đăng
										xuất</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</nav>

			<div class="container-fluid">
				<div class="mb-5 mt-3 ">
					<h4 class=" mt-3 mb-3">Bảng tính tổng</h4>

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
						<div class="show-page mb-3 ml-3" style="padding-left: 10px;">
							Hiển thị <span> <select id="show" onclick="select_page()">
									<option value="10">10</option>
									<option value="20">20</option>
									<option value="50">50</option>
							</select></span> cột
						</div>
						<div class="show-page " style="margin-left: 50px;">

							Tìm kiếm <span> <input id="myInput"
								style="padding-left: 15px; border: 0.5px solid grey;"
								type="text" placeholder="Search.."></span>
						</div>
					</div>
					<table class="table table-hover ">
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
				<!-- <table class="table">
          <thead class="thead-dark">
            <tr>
              <th scope="col">#</th>
              <th scope="col">First</th>
              <th scope="col">Last</th>
              <th scope="col">Handle</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <th scope="row">1</th>
              <td>Mark</td>
              <td>Otto</td>
              <td>@mdo</td>
            </tr>
            <tr>
              <th scope="row">2</th>
              <td>Jacob</td>
              <td>Thornton</td>
              <td>@fat</td>
            </tr>
            <tr>
              <th scope="row">3</th>
              <td>Larry</td>
              <td>the Bird</td>
              <td>@twitter</td>
            </tr>
          </tbody>
        </table> -->

			</div>
		</div>
		<!-- /#page-content-wrapper -->
	</div>
	<!-- /#wrapper -->

	<!-- Bootstrap core JavaScript -->


	<!-- Menu Toggle Script -->
	<script>
		$("#menu-toggle").click(function(e) {
			e.preventDefault();
			$("#wrapper").toggleClass("toggled");
		});
	</script>
	<script src="../js/js_admin/divide-page.js"></script>

	<!-- search -->
	<script>
		$(document)
				.ready(
						function() {
							$("#myInput")
									.on(
											"keyup",
											function() {
												var value = $(this).val()
														.toLowerCase();
												$("#content-table tr")
														.filter(
																function() {
																	$(this)
																			.toggle(
																					$(
																							this)
																							.text()
																							.toLowerCase()
																							.indexOf(
																									value) > -1)
																});
											});
						});
	</script>

	<script>
		$(document).ready(function() {
			$('[data-toggle="tooltip"]').tooltip();
		});
	</script>

<jsp:include page="/VIEW/jsp/jsp-component/footer-admin.jsp"></jsp:include>

	<!-- /.container -->



	
	<!-- Bootstrap core JavaScript -->



</body>

</html>