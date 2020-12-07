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
      <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
        <button class="btn btn-primary" id="menu-toggle">
          <i class="fas fa-bars"></i>
        </button>
        <div class="">

        </div>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
          aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav ml-auto mt-2 mt-lg-0">
            <li class="nav-item active">
              <a class="nav-link" href="#" data-toggle="modal" data-target="#log-out">Đăng xuất <span class="log-out"><i
                    class="fas fa-arrow-right"></i></span></a>
            </li>
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
          <div class="modal fade" id="log-out" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
            aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLongTitle">Xác nhận đăng xuất</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                  Bạn có muốn đăng xuất?
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                  <button type="button" class="btn btn-primary">Đăng xuất</button>
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
                        <h4 class="text-center mt-3 mb-3">Danh sách sản phẩm</h4>
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

                            <div class="show-page  arrange" >
                                    
                                 Sắp xếp <span> <select id="show" onclick="select_page()">
                                  <option value="10">
                                    A-Z
                                  </option>
                                  <option value="20">
                                    Z-A
                                  </option>
                                </select></span> 
                            </div>
                            <div class="show-page  arrange" >
                                    
                              Tìm kiếm <span> <input id="myInput"  style="padding-left: 15px; border: 0.5px solid grey;" text" placeholder="Search.."></span> 
                         </div>

                       </div>
                       <a href="formAddProduct.html"><button data-toggle="tooltip" data-placement="top" title="Thêm sản phẩm"  class="btn btn-success btn-add"><i
                        class="fas fa-plus-square"></i></button></a>
                        <table id="bootstrap-data-table" class="table table-hover ">
                           <thead class="thead-light">
                            <tr>
                              <th>Hình ảnh</th>
                              <th>Mã sản phẩm</th>
                              <th>Tên</th>
                              <th data-toggle="tooltip" data-placement="top" title="Hãng sản xuất">Hãng SX</th>
                              <th>Ngày ra mắt</th>
                              <th data-toggle="tooltip" data-placement="top" title="Số lượng còn lại">SL còn lại</th>
                              <th data-toggle="tooltip" data-placement="top" title="Số lượng đã bán">SL đã bán</th>
                              <th>Giá bán</th>
                              <th></th>

                            </tr>
                          </thead>
                          
                          <tbody id="content-table">
                            <tr>
                              <td style="max-width: 140px;"><img src="../image/Product/i12black.png" width="100px" height="100px" alt=""></td>
                              <td>iphone12S</td>
                              <td>Iphone 12</td>
                              <td>Apple</td>
                               <td>09/09/2020</td>
                                                  <td>200</td>


                              <td>190</td>
                              <td class="color-price">30.000.000 VND</td>
                                <td class="row" style="border: none;">
                                <div style="margin: auto;">
                           <a href="formEdit.html"><button class="m-wTD btn btn-primary" data-toggle="tooltip" data-placement="top" title="Chỉnh sửa"
                            data-toggle="modal" data-target="#editUser"> <i
                              class="txt-center fas fa-edit"></i></button></a>
                                  <button  class="btn btn-danger sizeTh1"  data-toggle="modal" data-target="#delete" data-toggle="tooltip" data-placement="top" title="Xóa"><i
                                      class="txt-center menu-icon fas fa-trash-alt"></i></button>                                
                                </div>

                              </td>
                            </tr>

                            <tr>
                              <td style="max-width: 140px;"><img src="../image/Product/IPhone8.jpg" width="100px" height="100px" alt=""></td>
                              <td>iphone8</td>
                              <td>Iphone 8</td>
                              <td>Apple</td>
                                                         <td>09/01/2018</td>




                                <td>10</td>
                              <td>190</td>
                              <td class="color-price">15.000.000 VND</td>
                                <td class="row" style="border: none;">
                                <div style="margin: auto;">
                           <a href="formEdit.html"><button class="m-wTD btn btn-primary" data-toggle="tooltip" data-placement="top" title="Chỉnh sửa"
                            data-toggle="modal" data-target="#editUser"> <i
                              class="txt-center fas fa-edit"></i></button></a>
                                  <button  class="btn btn-danger sizeTh1"  data-toggle="modal" data-target="#delete" data-toggle="tooltip" data-placement="top" title="Xóa"><i
                                      class="txt-center menu-icon fas fa-trash-alt"></i></button>                                
                                </div>

                              </td>
                            </tr>


                            <tr>
                              <td style="max-width: 140px;"><img src="../image/Product/samsung.png" width="100px" height="100px" alt=""></td>
                              <td>samJ10</td>
                              <td>Samsung J10</td>
                              <td>Samsung</td>
                                  <td>09/01/2018</td>




                              <td>100</td>
                              <td>60</td>
                              <td class="color-price">20.000.000 VND</td>
                                <td class="row" style="border: none;">
                                <div style="margin: auto;">
                           <a href="formEdit.html"><button class="m-wTD btn btn-primary" data-toggle="tooltip" data-placement="top" title="Chỉnh sửa"
                            data-toggle="modal" data-target="#editUser"> <i
                              class="txt-center fas fa-edit"></i></button></a>
                                  <button  class="btn btn-danger sizeTh1"  data-toggle="modal" data-target="#delete" data-toggle="tooltip" data-placement="top" title="Xóa"><i
                                      class="txt-center menu-icon fas fa-trash-alt"></i></button>                                
                                </div>

                              </td>
                            </tr>

                            <tr>
                              <td style="max-width: 140px;"><img src="../image/Product/sony.jpg" width="100px" height="100px" alt=""></td>
                              <td>sonyX1</td>
                              <td>Sony Xperia 1</td>
                              <td>Sony</td>
                               <td>09/09/2020</td>
                    <td>200</td>


                              <td>190</td>
                              <td class="color-price">20.000.000 VND</td>
                                <td class="row" style="border: none;">
                                <div style="margin: auto;">
                           <a href="formEdit.html"><button class="m-wTD btn btn-primary" data-toggle="tooltip" data-placement="top" title="Chỉnh sửa"
                            data-toggle="modal" data-target="#editUser"> <i
                              class="txt-center fas fa-edit"></i></button></a>
                                  <button  class="btn btn-danger sizeTh1"  data-toggle="modal" data-target="#delete" data-toggle="tooltip" data-placement="top" title="Xóa"><i
                                      class="txt-center menu-icon fas fa-trash-alt"></i></button>                                
                                </div>

                              </td>
                            </tr>

                            <tr>
                              <td style="max-width: 140px;"><img src="../image/Product/oppo.png" width="100px" height="100px" alt=""></td>
                              <td>oppo</td>
                              <td>Oppo A92</td>
                              <td>Oppo</td>
                               <td>09/09/2020</td>
                    <td>200</td>


                              <td>190</td>
                              <td class="color-price">20.000.000 VND</td>
                                <td class="row" style="border: none;">
                                <div style="margin: auto;">
                           <a href="formEdit.html"><button class="m-wTD btn btn-primary" data-toggle="tooltip" data-placement="top" title="Chỉnh sửa"
                            data-toggle="modal" data-target="#editUser"> <i
                              class="txt-center fas fa-edit"></i></button></a>
                                  <button  class="btn btn-danger sizeTh1"  data-toggle="modal" data-target="#delete" data-toggle="tooltip" data-placement="top" title="Xóa"><i
                                      class="txt-center menu-icon fas fa-trash-alt"></i></button>                                
                                </div>

                              </td>
                            </tr>


                            <tr>
                              <td style="max-width: 140px;"><img src="../image/Product/i12black.png" width="100px" height="100px" alt=""></td>
                              <td>iphone12S</td>
                              <td>Iphone 12</td>
                              <td>Apple</td>
                                <td>09/09/2020</td>
                              <td>200</td>


                              <td>190</td>
                              <td class="color-price">30.000.000 VND</td>
                                <td class="row" style="border: none;">
                                <div style="margin: auto;">
                           <a href="formEdit.html"><button class="m-wTD btn btn-primary" data-toggle="tooltip" data-placement="top" title="Chỉnh sửa"
                            data-toggle="modal" data-target="#editUser"> <i
                              class="txt-center fas fa-edit"></i></button></a>
                                  <button  class="btn btn-danger sizeTh1"  data-toggle="modal" data-target="#delete" data-toggle="tooltip" data-placement="top" title="Xóa"><i
                                      class="txt-center menu-icon fas fa-trash-alt"></i></button>                                
                                </div>

                              </td>
                            </tr>

                      



                          




                          </tbody>
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
            <!--Modal add-->
            <div class="modal fade" id="add" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
              aria-hidden="true">
              <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">Thêm sản phẩm</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                  </div>
                  <div class="modal-body">
                    ...
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                    <button type="button" class="btn btn-primary">Lưu</button>
                  </div>
                </div>
              </div>
            </div>
            <!--/Modal add-->

            <!--Modal edit-->
            <div class="modal fade" id="editUser" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
              aria-hidden="true">
              <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">Chỉnh sửa sản phẩm</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                  </div>
                  <div class="modal-body">
                    ...
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                    <button type="button" class="btn btn-primary">Lưu</button>
                  </div>
                </div>
              </div>
            </div>
            <!--/Modal edit-->


          </div><!-- /#right-panel -->
        </div>
      </div>
      <!-- /#page-content-wrapper -->
    </div>
    <!-- delete product -->
      <!-- Modal -->
          <div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">Xác nhận xóa sản phẩm</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                  Bạn có muốn xóa sản phẩm này.
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Không</button>
                  <button type="button" data-dismiss="modal" class="btn btn-primary">Đồng ý</button>
                </div>
              </div>
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