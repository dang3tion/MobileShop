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
                                                <h4 class="text-center mt-3 mb-3">Danh sách thương hiệu</h4>
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
                                                    class="table table-hover ">
                                                    <thead class="thead-light">
                                                        <tr>
                                                            <th>Mã thương hiệu</th>
                                                            <th>Tên thương hiệu</th>
                                                            <th>Số lượng điện thoại</th>
                                                            <th></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody id="content-table">
                                                        <tr>
                                                            <td>TH01</td>
                                                            <td>Apple</td>
                                                           

                                                                                                                       <td>10</td>

                                                            <td class="row" style="border: none;">
                                                                <button class="edit3 btn btn-danger" data-toggle="modal" data-target="#del"style="margin: auto;"
                                                                    title='Xóa thương hiệu'><i
                                                                        class="txt-center menu-icon fas fa-trash-alt"></i></button>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>TH02</td>
                                                            <td>Samsung</td>
                                                           

                                                            <td>10</td>

                                                            <td class="row" style="border: none;">
                                                                <button class="edit3 btn btn-danger" data-toggle="modal" data-target="#del"style="margin: auto;"
                                                                    title='Xóa thương hiệu'><i
                                                                        class="txt-center menu-icon fas fa-trash-alt"></i></button>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>TH03</td>
                                                            <td>Huawei</td>
                                                           

                                                            <td>10</td>

                                                            <td class="row" style="border: none;">
                                                                <button class="edit3 btn btn-danger" data-toggle="modal" data-target="#del"style="margin: auto;"
                                                                    title='Xóa thương hiệu'><i
                                                                        class="txt-center menu-icon fas fa-trash-alt"></i></button>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>TH04</td>
                                                            <td>Vivo</td>
                                                           

                                                            <td>10</td>

                                                            <td class="row" style="border: none;">
                                                                <button class="edit3 btn btn-danger" data-toggle="modal" data-target="#del"style="margin: auto;"
                                                                    title='Xóa thương hiệu'><i
                                                                        class="txt-center menu-icon fas fa-trash-alt"></i></button>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td>TH05</td>
                                                            <td>OPPO</td>
                                                           

                                                            <td>10</td>

                                                            <td class="row" style="border: none;">
                                                                <button class="edit3 btn btn-danger" data-toggle="modal" data-target="#del"style="margin: auto;"
                                                                    title='Xóa thương hiệu'><i
                                                                        class="txt-center menu-icon fas fa-trash-alt"></i></button>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>TH06</td>
                                                            <td>Xiaomi</td>
                                                           

                                                            <td>10</td>

                                                            <td class="row" style="border: none;">
                                                                <button class="edit3 btn btn-danger" data-toggle="modal" data-target="#del"style="margin: auto;"
                                                                    title='Xóa thương hiệu'><i
                                                                        class="txt-center menu-icon fas fa-trash-alt"></i></button>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>TH07</td>
                                                            <td>Realmi</td>
                                                           

                                                            <td>10</td>

                                                            <td class="row" style="border: none;">
                                                                <button class="edit3 btn btn-danger" data-toggle="modal" data-target="#del"style="margin: auto;"
                                                                    title='Xóa thương hiệu'><i
                                                                        class="txt-center menu-icon fas fa-trash-alt"></i></button>
                                                            </td>
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
                        <div class="modal fade" id="add" tabindex="-1" role="dialog"
                            aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLongTitle">Thêm User</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        ...
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary"
                                            data-dismiss="modal">Đóng</button>
                                        <button type="button" class="btn btn-primary">Lưu</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div><!-- /#right-panel -->
                </div>
            </div>
	</div>
	<!-- /#wrapper -->
 <div class="modal fade" id="del" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Xác nhận xóa thương hiệu.</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          Bạn có muốn xóa thương hiệu này.
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Không</button>
          <button type="button" class="btn btn-primary" data-dismiss="modal">Đồng ý</button>
        </div>
      </div>
    </div>
  </div>

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