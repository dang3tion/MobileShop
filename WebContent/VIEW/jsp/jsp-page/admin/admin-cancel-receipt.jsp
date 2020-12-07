<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<c:url var="url" scope="page" value="/VIEW"></c:url>
<jsp:include page="/VIEW/jsp/jsp-component/head-css-admin.jsp"></jsp:include>
<link
  href="${url}/css/css-page/admin-user.css"
  type="text/css"
  rel="stylesheet"
/>
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
                    <div class="content">
                        <div class="animated fadeIn">
                            <div class="row">

                                <div class="col-md-12">
                                    <div class="card">
                                        <div class="card-body">
                                            <div class=" mb-2">
                                                <h4 class="text-center mt-3 mb-3">Danh sách đơn hàng bị hủy</h4>
                                                <div class="row">
                                                    <div class="show-page mb-3 ml-3">
                                                      Hiển thị <span> <select id="show" onclick="select_page()">
                                                          <option value="10">
                                                            10
                                                          </option>
                                                          <option value="20">
                                                            20
                                                          </option>
                                                          <option value="50">
                                                            50
                                                          </option>
                                                        </select></span> cột
                                                    </div>
                                                      <div class="show-page "  style="margin-left: 50px;">
                                                              
                                                          Tìm kiếm <span> <input id="myInput"  style="padding-left: 15px; border: 0.5px solid grey;" type="text" placeholder="Search.."></span> 
                                                     </div>
                                                 </div>
                                                <table id="bootstrap-data-table"
                                                    class="table  table-hover ">
                                                    <thead class="thead-light">
                                                        <tr>
                                                            <th>Mã đơn hàng</th>
                                                            <th>Mã khách hàng</th>
                                                            <th>Ngày lập</th>
                                                            <th>Chi tiết đơn hàng</th>
                                                            
                                                        </tr>
                                                    </thead>
                                                    <tbody id="content-table">
                                                        <tr>
                                                            <td>TH01</td>
                                                            <td>KH01</td>
                                                            <td>10/10/2020</td>
                                                            <td class="detail"><a data-toggle="modal"
                                                                    data-target="#exampleModal" href='#'> Chi tiết <i
                                                                        class="fa fa-external-link-alt"></i></a>
                                                                <div class="modal fade" id="exampleModal" tabindex="-1"
                                                                    aria-labelledby="exampleModalLabel"
                                                                    aria-hidden="true">
                                                                    <div class="modal-dialog  detail-modal">
                                                                        <div class="modal-content">
                                                                            <div class="modal-header">
                                                                                <h5 class="modal-title"
                                                                                    id="exampleModalLabel">Chi tiết đơn
                                                                                    hàng</h5>
                                                                                <button type="button" class="close"
                                                                                    data-dismiss="modal"
                                                                                    aria-label="Close">
                                                                                    <span
                                                                                        aria-hidden="true">&times;</span>
                                                                                </button>
                                                                            </div>
                                                                            <div class="modal-body">
                                                                                <h5>Đơn hàng: DH01</h5>
                                                                                <table width="100%"
                                                                                    class="text-center  table content-detail  table-hover">
                                                                                    <thead class="thead-light">
                                                                                        <tr>
                                                                                            <th>Mã khách hàng</th>
                                                                                            <th>Tên khách hàng</th>
                                                                                            <th><span
                                                                                                    title="Số điện thoại">
                                                                                                    SDT</span></th>
                                                                                            <th
                                                                                                style="min-width: 300px;">
                                                                                                Địa chỉ</th>
                                                                                            <th> Tên sản phẩm &amp; số
                                                                                                lượng </th>
                                                                                            <th>Giá </th>
                                                                                        </tr>
                                                                                    </thead>
                                                                                    <tr>


                                                                                        <td>KH01</td>
                                                                                        <td>Trần Thanh Bảo</td>
                                                                                        <td><span title="Số điện thoại">
                                                                                                09128374822</span></td>
                                                                                        <td style="min-width: 300px;">
                                                                                            Khu phố 6, phường Linh
                                                                                            Trung, quận Thủ Đức,TP Hồ
                                                                                            Chí Minh</th>
                                                                                        <td>
                                                                                            <p>Iphone 12 64GB <span
                                                                                                    class="font-weight-bold">x</span>
                                                                                                2 </p>
                                                                                            <p>Iphone X 32GB <span
                                                                                                    class="font-weight-bold">x</span>
                                                                                                2 </p>
                                                                                        </td>
                                                                                        <td>
                                                                                            <p>24,000,000</p>
                                                                                            <p>7,000,000
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </div>
                                                                            <div class="modal-footer">
                                                                                <button type="button"
                                                                                    class="btn btn-secondary"
                                                                                    data-dismiss="modal">Đóng</button>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                        
                                                        </tr>

                                                        <tr>
                                                            <td>TH02</td>
                                                            <td>KH01</td>
                                                            <td>10/10/2020</td>
                                                            <td class="detail"><a href='#'> Chi tiết <i
                                                                        class="fa fa-external-link-alt"></i></a></td>

                                                        </tr>
                                                        <tr>
                                                            <td>TH03</td>
                                                            <td>KH03</td>
                                                            <td>10/10/2020</td>
                                                            <td class="detail"><a href='#'> Chi tiết <i
                                                                        class="fa fa-external-link-alt"></i></a></td>

                                                        </tr>
                                                        <tr>
                                                            <td>TH04</td>
                                                            <td>KH04</td>
                                                            <td>10/10/2020</td>
                                                            <td class="detail"><a href='#'> Chi tiết <i
                                                                        class="fa fa-external-link-alt"></i></a></td>

                                                        </tr>





                                                </table>

                                                <div class="page-navigation">
                                                    <div class="beta"> <button onclick="previous_page()"> Trước</button>
                                                        <span id="page-number">

                                                        </span>
                                                        <button onclick="next_page()"> Sau</button></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                </div>
                            </div><!-- .animated -->
                        </div><!-- .content -->


                        <!-- Add -->
                     
                    </div><!-- /#right-panel -->
                </div>
            </div>
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