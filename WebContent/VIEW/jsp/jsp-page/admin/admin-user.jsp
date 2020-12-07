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
          <div class="content">
            <div class="animated fadeIn">
              <div class="row">

                <div class="col-md-12">
                  <div class="card">
                    <div class="card-body">
                      <div class=" mb-2">
                        <h4 class="text-center mt-3 mb-3">Danh sách khách hàng</h4>
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
                        <table s id="bootstrap-data-table" class="table table-hover ">
                           <thead class="thead-light">
                            <tr>
                              <th><span data-toggle="tooltip" data-placement="top" title="Mã khách hàng">Mã KH</span>
                              </th>
                              <th>Họ tên</th>
                              <th>Số điện thoại</th>
                              <th>Địa chỉ mặc định</th>
                              <th>Trạng thái</th>
                              <th>Email</th>
                              <th></th>
                            </tr>
                          </thead>
                          <tbody id="content-table">
                            <tr>
                              <td>KH01</td>
                              <td>Tiger</td>
                              <td>0123456779</td>
                              <td>Linh Xuân, Thủ Đức</td>
                              <td>Mở</td>
                              <td>tiger@gmail.com</td>

                              <td class="row" style="border: none;">
                                <div style="margin: auto;">
                                  <button class="btn btn-success sizeTh1" value="true" id='block'  data-placement="top" title="Block"
                                    data-target="#block-user" data-toggle="modal"><i
                                      class="txt-center fas fa-lock"></i></button>
                                 
                                </div>
                                <span>

                                  <div class="modal fade" id='block-user' tabindex="-1"
                                    aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                      <div class="modal-content">
                                        <div class="modal-header">
                                          <h5 class="modal-title" id="exampleModalLabel">Xác nhận chặn</h5>
                                          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <i aria-hidden="true">&times;</i>
                                          </button>
                                        </div>
                                        <div class="modal-body">
                                          Bạn có muốn xác nhận chặn user này không?
                                        </div>
                                        <div class="modal-footer">
                                          <button type="button" class="btn btn-secondary"
                                            data-dismiss="modal">Hủy</button>
                                          <button type="button" class="btn btn-primary" onclick="check_block('block') "
                                            data-dismiss="modal">Xác
                                            nhận</button>
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                </span>
                                <span>

                                  <div class="modal fade" id='unblock-user' tabindex="-1"
                                    aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                      <div class="modal-content">
                                        <div class="modal-header">
                                          <h5 class="modal-title" id="exampleModalLabel">Xác nhận bỏ chặn</h5>
                                          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <i aria-hidden="true">&times;</i>
                                          </button>
                                        </div>
                                        <div class="modal-body">
                                          Bạn có muốn xác nhận bỏ chặn user này không?
                                        </div>
                                        <div class="modal-footer">
                                          <button type="button" class="btn btn-secondary"
                                            data-dismiss="modal">Hủy</button>
                                          <button type="button" class="btn btn-primary" onclick="check_block('block') "
                                            data-dismiss="modal">Xác
                                            nhận</button>
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                </span>
                              </td>
                            </tr>
                            <tr>
                              <td>KH01</td>
                              <td>Tiger</td>
                              <td>0123456779</td>
                              <td>Linh Xuân, Thủ Đức</td>
                              <td>Mở</td>
                              <td>tiger@gmail.com</td>

                              <td class="row" style="border: none;">
                                <div style="margin: auto;">
                                  <button class="btn btn-success sizeTh1" value="true" id='block'  data-placement="top" title="Block"
                                    data-target="#block-user" data-toggle="modal"><i
                                      class="txt-center fas fa-lock"></i></button>
                                 
                                </div>
                                <span>

                                  <div class="modal fade" id='block-user' tabindex="-1"
                                    aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                      <div class="modal-content">
                                        <div class="modal-header">
                                          <h5 class="modal-title" id="exampleModalLabel">Xác nhận chặn</h5>
                                          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <i aria-hidden="true">&times;</i>
                                          </button>
                                        </div>
                                        <div class="modal-body">
                                          Bạn có muốn xác nhận chặn user này không?
                                        </div>
                                        <div class="modal-footer">
                                          <button type="button" class="btn btn-secondary"
                                            data-dismiss="modal">Hủy</button>
                                          <button type="button" class="btn btn-primary" onclick="check_block('block') "
                                            data-dismiss="modal">Xác
                                            nhận</button>
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                </span>
                                <span>

                                  <div class="modal fade" id='unblock-user' tabindex="-1"
                                    aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                      <div class="modal-content">
                                        <div class="modal-header">
                                          <h5 class="modal-title" id="exampleModalLabel">Xác nhận bỏ chặn</h5>
                                          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <i aria-hidden="true">&times;</i>
                                          </button>
                                        </div>
                                        <div class="modal-body">
                                          Bạn có muốn xác nhận bỏ chặn user này không?
                                        </div>
                                        <div class="modal-footer">
                                          <button type="button" class="btn btn-secondary"
                                            data-dismiss="modal">Hủy</button>
                                          <button type="button" class="btn btn-primary" onclick="check_block('block') "
                                            data-dismiss="modal">Xác
                                            nhận</button>
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                </span>
                              </td>
                            </tr>
                            <tr>
                              <td>KH01</td>
                              <td>Tiger</td>
                              <td>0123456779</td>
                              <td>Linh Xuân, Thủ Đức</td>
                              <td>Mở</td>
                              <td>tiger@gmail.com</td>

                              <td class="row" style="border: none;">
                                <div style="margin: auto;">
                                  <button class="btn btn-success sizeTh1" value="true" id='block'  data-placement="top" title="Block"
                                    data-target="#block-user" data-toggle="modal"><i
                                      class="txt-center fas fa-lock"></i></button>
                                 
                                </div>
                                <span>

                                  <div class="modal fade" id='block-user' tabindex="-1"
                                    aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                      <div class="modal-content">
                                        <div class="modal-header">
                                          <h5 class="modal-title" id="exampleModalLabel">Xác nhận chặn</h5>
                                          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <i aria-hidden="true">&times;</i>
                                          </button>
                                        </div>
                                        <div class="modal-body">
                                          Bạn có muốn xác nhận chặn user này không?
                                        </div>
                                        <div class="modal-footer">
                                          <button type="button" class="btn btn-secondary"
                                            data-dismiss="modal">Hủy</button>
                                          <button type="button" class="btn btn-primary" onclick="check_block('block') "
                                            data-dismiss="modal">Xác
                                            nhận</button>
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                </span>
                                <span>

                                  <div class="modal fade" id='unblock-user' tabindex="-1"
                                    aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                      <div class="modal-content">
                                        <div class="modal-header">
                                          <h5 class="modal-title" id="exampleModalLabel">Xác nhận bỏ chặn</h5>
                                          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <i aria-hidden="true">&times;</i>
                                          </button>
                                        </div>
                                        <div class="modal-body">
                                          Bạn có muốn xác nhận bỏ chặn user này không?
                                        </div>
                                        <div class="modal-footer">
                                          <button type="button" class="btn btn-secondary"
                                            data-dismiss="modal">Hủy</button>
                                          <button type="button" class="btn btn-primary" onclick="check_block('block') "
                                            data-dismiss="modal">Xác
                                            nhận</button>
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                </span>
                              </td>
                            </tr>
                            <tr>
                              <td>KH01</td>
                              <td>Tiger</td>
                              <td>0123456779</td>
                              <td>Linh Xuân, Thủ Đức</td>
                              <td>Mở</td>
                              <td>tiger@gmail.com</td>

                              <td class="row" style="border: none;">
                                <div style="margin: auto;">
                                  <button class="btn btn-success sizeTh1" value="true" id='block'  data-placement="top" title="Block"
                                    data-target="#block-user" data-toggle="modal"><i
                                      class="txt-center fas fa-lock"></i></button>
                                 
                                </div>
                                <span>

                                  <div class="modal fade" id='block-user' tabindex="-1"
                                    aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                      <div class="modal-content">
                                        <div class="modal-header">
                                          <h5 class="modal-title" id="exampleModalLabel">Xác nhận chặn</h5>
                                          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <i aria-hidden="true">&times;</i>
                                          </button>
                                        </div>
                                        <div class="modal-body">
                                          Bạn có muốn xác nhận chặn user này không?
                                        </div>
                                        <div class="modal-footer">
                                          <button type="button" class="btn btn-secondary"
                                            data-dismiss="modal">Hủy</button>
                                          <button type="button" class="btn btn-primary" onclick="check_block('block') "
                                            data-dismiss="modal">Xác
                                            nhận</button>
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                </span>
                                <span>

                                  <div class="modal fade" id='unblock-user' tabindex="-1"
                                    aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                      <div class="modal-content">
                                        <div class="modal-header">
                                          <h5 class="modal-title" id="exampleModalLabel">Xác nhận bỏ chặn</h5>
                                          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <i aria-hidden="true">&times;</i>
                                          </button>
                                        </div>
                                        <div class="modal-body">
                                          Bạn có muốn xác nhận bỏ chặn user này không?
                                        </div>
                                        <div class="modal-footer">
                                          <button type="button" class="btn btn-secondary"
                                            data-dismiss="modal">Hủy</button>
                                          <button type="button" class="btn btn-primary" onclick="check_block('block') "
                                            data-dismiss="modal">Xác
                                            nhận</button>
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                </span>
                              </td>
                            </tr>
                            <tr>
                              <td>KH01</td>
                              <td>Tiger</td>
                              <td>0123456779</td>
                              <td>Linh Xuân, Thủ Đức</td>
                              <td>Mở</td>
                              <td>tiger@gmail.com</td>

                              <td class="row" style="border: none;">
                                <div style="margin: auto;">
                                  <button class="btn btn-success sizeTh1" value="true" id='block'  data-placement="top" title="Block"
                                    data-target="#block-user" data-toggle="modal"><i
                                      class="txt-center fas fa-lock"></i></button>
                                 
                                </div>
                                <span>

                                  <div class="modal fade" id='block-user' tabindex="-1"
                                    aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                      <div class="modal-content">
                                        <div class="modal-header">
                                          <h5 class="modal-title" id="exampleModalLabel">Xác nhận chặn</h5>
                                          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <i aria-hidden="true">&times;</i>
                                          </button>
                                        </div>
                                        <div class="modal-body">
                                          Bạn có muốn xác nhận chặn user này không?
                                        </div>
                                        <div class="modal-footer">
                                          <button type="button" class="btn btn-secondary"
                                            data-dismiss="modal">Hủy</button>
                                          <button type="button" class="btn btn-primary" onclick="check_block('block') "
                                            data-dismiss="modal">Xác
                                            nhận</button>
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                </span>
                                <span>

                                  <div class="modal fade" id='unblock-user' tabindex="-1"
                                    aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                      <div class="modal-content">
                                        <div class="modal-header">
                                          <h5 class="modal-title" id="exampleModalLabel">Xác nhận bỏ chặn</h5>
                                          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <i aria-hidden="true">&times;</i>
                                          </button>
                                        </div>
                                        <div class="modal-body">
                                          Bạn có muốn xác nhận bỏ chặn user này không?
                                        </div>
                                        <div class="modal-footer">
                                          <button type="button" class="btn btn-secondary"
                                            data-dismiss="modal">Hủy</button>
                                          <button type="button" class="btn btn-primary" onclick="check_block('block') "
                                            data-dismiss="modal">Xác
                                            nhận</button>
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                </span>
                              </td>
                            </tr>
                            <tr>
                              <td>KH01</td>
                              <td>Tiger</td>
                              <td>0123456779</td>
                              <td>Linh Xuân, Thủ Đức</td>
                              <td>Mở</td>
                              <td>tiger@gmail.com</td>

                              <td class="row" style="border: none;">
                                <div style="margin: auto;">
                                  <button class="btn btn-success sizeTh1" value="true" id='block'  data-placement="top" title="Block"
                                    data-target="#block-user" data-toggle="modal"><i
                                      class="txt-center fas fa-lock"></i></button>
                                 
                                </div>
                                <span>

                                  <div class="modal fade" id='block-user' tabindex="-1"
                                    aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                      <div class="modal-content">
                                        <div class="modal-header">
                                          <h5 class="modal-title" id="exampleModalLabel">Xác nhận chặn</h5>
                                          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <i aria-hidden="true">&times;</i>
                                          </button>
                                        </div>
                                        <div class="modal-body">
                                          Bạn có muốn xác nhận chặn user này không?
                                        </div>
                                        <div class="modal-footer">
                                          <button type="button" class="btn btn-secondary"
                                            data-dismiss="modal">Hủy</button>
                                          <button type="button" class="btn btn-primary" onclick="check_block('block') "
                                            data-dismiss="modal">Xác
                                            nhận</button>
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                </span>
                                <span>

                                  <div class="modal fade" id='unblock-user' tabindex="-1"
                                    aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                      <div class="modal-content">
                                        <div class="modal-header">
                                          <h5 class="modal-title" id="exampleModalLabel">Xác nhận bỏ chặn</h5>
                                          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <i aria-hidden="true">&times;</i>
                                          </button>
                                        </div>
                                        <div class="modal-body">
                                          Bạn có muốn xác nhận bỏ chặn user này không?
                                        </div>
                                        <div class="modal-footer">
                                          <button type="button" class="btn btn-secondary"
                                            data-dismiss="modal">Hủy</button>
                                          <button type="button" class="btn btn-primary" onclick="check_block('block') "
                                            data-dismiss="modal">Xác
                                            nhận</button>
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                </span>
                              </td>
                            </tr>
                            <tr>
                              <td>KH01</td>
                              <td>Tiger</td>
                              <td>0123456779</td>
                              <td>Linh Xuân, Thủ Đức</td>
                              <td>Mở</td>
                              <td>tiger@gmail.com</td>

                              <td class="row" style="border: none;">
                                <div style="margin: auto;">
                                  <button class="btn btn-success sizeTh1" value="true" id='block'  data-placement="top" title="Block"
                                    data-target="#block-user" data-toggle="modal"><i
                                      class="txt-center fas fa-lock"></i></button>
                                 
                                </div>
                                <span>

                                  <div class="modal fade" id='block-user' tabindex="-1"
                                    aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                      <div class="modal-content">
                                        <div class="modal-header">
                                          <h5 class="modal-title" id="exampleModalLabel">Xác nhận chặn</h5>
                                          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <i aria-hidden="true">&times;</i>
                                          </button>
                                        </div>
                                        <div class="modal-body">
                                          Bạn có muốn xác nhận chặn user này không?
                                        </div>
                                        <div class="modal-footer">
                                          <button type="button" class="btn btn-secondary"
                                            data-dismiss="modal">Hủy</button>
                                          <button type="button" class="btn btn-primary" onclick="check_block('block') "
                                            data-dismiss="modal">Xác
                                            nhận</button>
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                </span>
                                <span>

                                  <div class="modal fade" id='unblock-user' tabindex="-1"
                                    aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                      <div class="modal-content">
                                        <div class="modal-header">
                                          <h5 class="modal-title" id="exampleModalLabel">Xác nhận bỏ chặn</h5>
                                          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <i aria-hidden="true">&times;</i>
                                          </button>
                                        </div>
                                        <div class="modal-body">
                                          Bạn có muốn xác nhận bỏ chặn user này không?
                                        </div>
                                        <div class="modal-footer">
                                          <button type="button" class="btn btn-secondary"
                                            data-dismiss="modal">Hủy</button>
                                          <button type="button" class="btn btn-primary" onclick="check_block('block') "
                                            data-dismiss="modal">Xác
                                            nhận</button>
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                </span>
                              </td>
                            </tr>
                            <tr>
                              <td>KH01</td>
                              <td>Tiger</td>
                              <td>0123456779</td>
                              <td>Linh Xuân, Thủ Đức</td>
                              <td>Mở</td>
                              <td>tiger@gmail.com</td>

                              <td class="row" style="border: none;">
                                <div style="margin: auto;">
                                  <button class="btn btn-success sizeTh1" value="true" id='block'  data-placement="top" title="Block"
                                    data-target="#block-user" data-toggle="modal"><i
                                      class="txt-center fas fa-lock"></i></button>
                                 
                                </div>
                                <span>

                                  <div class="modal fade" id='block-user' tabindex="-1"
                                    aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                      <div class="modal-content">
                                        <div class="modal-header">
                                          <h5 class="modal-title" id="exampleModalLabel">Xác nhận chặn</h5>
                                          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <i aria-hidden="true">&times;</i>
                                          </button>
                                        </div>
                                        <div class="modal-body">
                                          Bạn có muốn xác nhận chặn user này không?
                                        </div>
                                        <div class="modal-footer">
                                          <button type="button" class="btn btn-secondary"
                                            data-dismiss="modal">Hủy</button>
                                          <button type="button" class="btn btn-primary" onclick="check_block('block') "
                                            data-dismiss="modal">Xác
                                            nhận</button>
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                </span>
                                <span>

                                  <div class="modal fade" id='unblock-user' tabindex="-1"
                                    aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                      <div class="modal-content">
                                        <div class="modal-header">
                                          <h5 class="modal-title" id="exampleModalLabel">Xác nhận bỏ chặn</h5>
                                          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <i aria-hidden="true">&times;</i>
                                          </button>
                                        </div>
                                        <div class="modal-body">
                                          Bạn có muốn xác nhận bỏ chặn user này không?
                                        </div>
                                        <div class="modal-footer">
                                          <button type="button" class="btn btn-secondary"
                                            data-dismiss="modal">Hủy</button>
                                          <button type="button" class="btn btn-primary" onclick="check_block('block') "
                                            data-dismiss="modal">Xác
                                            nhận</button>
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                </span>
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
            <div class="modal fade" id="add" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
              aria-hidden="true">
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
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                    <button type="button" class="btn btn-primary">Lưu</button>
                  </div>
                </div>
              </div>
            </div>
          </div><!-- /#right-panel -->
        </div>
      </div>
      <!-- /#page-content-wrapper -->
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