<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<jsp:include page="/VIEW/jsp/jsp-component/sidebar-admin.jsp"></jsp:include>
		<!--Nav-->


		<!-- Page Content -->
		<div id="page-content-wrapper">


			<!-- 		toggle logout -->
			<jsp:include page="/VIEW/jsp/jsp-component/toggle-logout-bar.jsp"></jsp:include>

			<!-- main content page -->
		   <div class="container-fluid" style="margin-top: 20px;">
        <div class="border mb-2">
          <h4 class="text-center mt-3 mb-3">Quản lí đơn hàng</h4>
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
          <table class="table table-hover " id="receipt-table" >
            <thead class="thead-light">
              <tr>
                <th scope="col">Mã đơn hàng</th>
                <th scope="col">Mã khách hàng</th>

                <th scope="col">Tổng giá trị</th>
                <th scope="col">Ngày lập</th>
               
                <th scope="col">Chi tiết đơn hàng</th>
                <th scope="col">Xác nhận đơn hàng</th>

              </tr>
            </thead>
             <tbody id="content-table">
              <tr>
                <td>DH01</td>
                <td>KH01</td>

                <td>
                  20,200,000
                </td>
                <td>
                  20/11/2020
                </td>
               
                <td class="detail"><a data-toggle="modal" data-target="#exampleModal" href='#'> Chi tiết <i
                      class="fa fa-external-link-alt"></i></a>


                  <!-- Modal -->

                </td>
                <td class="confirm">
                  <span>
                    <input class="confirm-check" type="checkbox" value="confirm-check" name="confirm-check">
                    <label title="Xác nhận đơn hàng" class="label-check active" data-toggle="modal"><i
                        class="fas fa-check-square"></i></label>
                    <div class="modal fade" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Xác nhận đơn hàng</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <i aria-hidden="true">&times;</i>
                            </button>
                          </div>
                          <div class="modal-body">
                            Bạn có muốn xác nhận đơn hàng này không?
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                            <button type="button" class="btn btn-primary" data-dismiss="modal">Xác
                              nhận</button>
                          </div>
                        </div>
                      </div>
                    </div>
                  </span>

                  <span>
                    <input class="confirm-check" type="checkbox" value="confirm-delivered" name="confirm-deliverd">
                    <label title="Xác nhận vận chuyển thành công" class="label-delivered disable"><i
                        class="fas fa-truck"></i></label>
                    <div class="modal fade" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Xác nhận vận chuyển</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <i aria-hidden="true">&times;</i>
                            </button>
                          </div>
                          <div class="modal-body">
                            Bạn có muốn xác nhận vận chuyển thành công?
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                            <button type="button" class="btn btn-primary" data-dismiss="modal">Xác
                              nhận</button>
                          </div>
                        </div>
                      </div>
                    </div>
                  </span>
                  <span>
                    <input class="confirm-check" type="checkbox" value="confirm-cancel" name="confirm-cancel">
                    <label title="Hủy đơn hàng" data-toggle="modal" class="label-cancel warning"><i
                        class="fas fa-trash"></i></label>
                    <div class="modal fade" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Xác nhận hủy đơn</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <i aria-hidden="true">&times;</i>
                            </button>
                          </div>
                          <div class="modal-body">
                            Bạn có muốn xác nhận hủy đơn hàng này không?
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                            <button type="button" class="btn btn-primary" data-dismiss="modal">Xác
                              nhận</button>
                          </div>
                        </div>
                      </div>
                    </div>
                  </span>

                </td>
              </tr>
              <tr>
                <td>DH02</td>
                <td>KH02</td>

                <td>
                  20,200,000
                </td>
                <td>
                  20/11/2020
                </td>
                <td class="detail"><a href='#'> Chi tiết <i class="fa fa-external-link-alt"></i></a></td>
                <td class="confirm">
                  <span>
                    <input class="confirm-check" type="checkbox" value="confirm-check" name="confirm-check">
                    <label title="Xác nhận đơn hàng" class="label-check active" data-toggle="modal"><i
                        class="fas fa-check-square"></i></label>
                    <div class="modal fade" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Xác nhận đơn hàng</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <i aria-hidden="true">&times;</i>
                            </button>
                          </div>
                          <div class="modal-body">
                            Bạn có muốn xác nhận đơn hàng này không?
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                            <button type="button" class="btn btn-primary" data-dismiss="modal">Xác
                              nhận</button>
                          </div>
                        </div>
                      </div>
                    </div>
                  </span>

                  <span>
                    <input class="confirm-check" type="checkbox" value="confirm-delivered" name="confirm-deliverd">
                    <label title="Xác nhận vận chuyển thành công" class="label-delivered disable"><i
                        class="fas fa-truck"></i></label>
                    <div class="modal fade" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Xác nhận vận chuyển</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <i aria-hidden="true">&times;</i>
                            </button>
                          </div>
                          <div class="modal-body">
                            Bạn có muốn xác nhận vận chuyển thành công?
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                            <button type="button" class="btn btn-primary" data-dismiss="modal">Xác
                              nhận</button>
                          </div>
                        </div>
                      </div>
                    </div>
                  </span>
                  <span>
                    <input class="confirm-check" type="checkbox" value="confirm-cancel" name="confirm-cancel">
                    <label title="Hủy đơn hàng" data-toggle="modal" class="label-cancel warning"><i
                        class="fas fa-trash"></i></label>
                    <div class="modal fade" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Xác nhận hủy đơn</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <i aria-hidden="true">&times;</i>
                            </button>
                          </div>
                          <div class="modal-body">
                            Bạn có muốn xác nhận hủy đơn hàng này không?
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                            <button type="button" class="btn btn-primary" data-dismiss="modal">Xác
                              nhận</button>
                          </div>
                        </div>
                      </div>
                    </div>
                  </span>

                </td>
              </tr>
              <tr>
                <td>DH03</td>
                <td>KH01</td>

                <td>
                  20,200,000
                </td>
                <td>
                  20/11/2020
                </td>
                <td class="detail"><a href='#'> Chi tiết <i class="fa fa-external-link-alt"></i></a></td>
                <td class="confirm">
                  <span>
                    <input class="confirm-check" type="checkbox" value="confirm-check" name="confirm-check">
                    <label title="Xác nhận đơn hàng" class="label-check active" data-toggle="modal"><i
                        class="fas fa-check-square"></i></label>
                    <div class="modal fade" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Xác nhận đơn hàng</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <i aria-hidden="true">&times;</i>
                            </button>
                          </div>
                          <div class="modal-body">
                            Bạn có muốn xác nhận đơn hàng này không?
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                            <button type="button" class="btn btn-primary" data-dismiss="modal">Xác
                              nhận</button>
                          </div>
                        </div>
                      </div>
                    </div>
                  </span>

                  <span>
                    <input class="confirm-check" type="checkbox" value="confirm-delivered" name="confirm-deliverd">
                    <label title="Xác nhận vận chuyển thành công" class="label-delivered disable"><i
                        class="fas fa-truck"></i></label>
                    <div class="modal fade" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Xác nhận vận chuyển</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <i aria-hidden="true">&times;</i>
                            </button>
                          </div>
                          <div class="modal-body">
                            Bạn có muốn xác nhận vận chuyển thành công?
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                            <button type="button" class="btn btn-primary" data-dismiss="modal">Xác
                              nhận</button>
                          </div>
                        </div>
                      </div>
                    </div>
                  </span>
                  <span>
                    <input class="confirm-check" type="checkbox" value="confirm-cancel" name="confirm-cancel">
                    <label title="Hủy đơn hàng" data-toggle="modal" class="label-cancel warning"><i
                        class="fas fa-trash"></i></label>
                    <div class="modal fade" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Xác nhận hủy đơn</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <i aria-hidden="true">&times;</i>
                            </button>
                          </div>
                          <div class="modal-body">
                            Bạn có muốn xác nhận hủy đơn hàng này không?
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                            <button type="button" class="btn btn-primary" data-dismiss="modal">Xác
                              nhận</button>
                          </div>
                        </div>
                      </div>
                    </div>
                  </span>

                </td>
              </tr>
              <tr>
                <td>DH04</td>
                <td>KH03</td>

                <td>
                  20,200,000
                </td>
                <td>
                  20/11/2020
                </td>
                <td class="detail"><a href='#'> Chi tiết <i class="fa fa-external-link-alt"></i></a></td>
                <td class="confirm">
                  <span>
                    <input class="confirm-check" type="checkbox" value="confirm-check" name="confirm-check">
                    <label title="Xác nhận đơn hàng" class="label-check active" data-toggle="modal"><i
                        class="fas fa-check-square"></i></label>
                    <div class="modal fade" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Xác nhận đơn hàng</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <i aria-hidden="true">&times;</i>
                            </button>
                          </div>
                          <div class="modal-body">
                            Bạn có muốn xác nhận đơn hàng này không?
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                            <button type="button" class="btn btn-primary" data-dismiss="modal">Xác
                              nhận</button>
                          </div>
                        </div>
                      </div>
                    </div>
                  </span>

                  <span>
                    <input class="confirm-check" type="checkbox" value="confirm-delivered" name="confirm-deliverd">
                    <label title="Xác nhận vận chuyển thành công" class="label-delivered disable"><i
                        class="fas fa-truck"></i></label>
                    <div class="modal fade" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Xác nhận vận chuyển</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <i aria-hidden="true">&times;</i>
                            </button>
                          </div>
                          <div class="modal-body">
                            Bạn có muốn xác nhận vận chuyển thành công?
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                            <button type="button" class="btn btn-primary" data-dismiss="modal">Xác
                              nhận</button>
                          </div>
                        </div>
                      </div>
                    </div>
                  </span>
                  <span>
                    <input class="confirm-check" type="checkbox" value="confirm-cancel" name="confirm-cancel">
                    <label title="Hủy đơn hàng" data-toggle="modal" class="label-cancel warning"><i
                        class="fas fa-trash"></i></label>
                    <div class="modal fade" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Xác nhận hủy đơn</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <i aria-hidden="true">&times;</i>
                            </button>
                          </div>
                          <div class="modal-body">
                            Bạn có muốn xác nhận hủy đơn hàng này không?
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                            <button type="button" class="btn btn-primary" data-dismiss="modal">Xác
                              nhận</button>
                          </div>
                        </div>
                      </div>
                    </div>
                  </span>

                </td>
              </tr>
              <tr>
                <td>DH05</td>
                <td>KH02</td>

                <td>
                  20,200,000
                </td>
                <td>
                  20/11/2020
                </td>
                <td class="detail"><a href='#'> Chi tiết <i class="fa fa-external-link-alt"></i></a></td>
                <td class="confirm">
                  <span>
                    <input class="confirm-check" type="checkbox" value="confirm-check" name="confirm-check">
                    <label title="Xác nhận đơn hàng" class="label-check active" data-toggle="modal"><i
                        class="fas fa-check-square"></i></label>
                    <div class="modal fade" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Xác nhận đơn hàng</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <i aria-hidden="true">&times;</i>
                            </button>
                          </div>
                          <div class="modal-body">
                            Bạn có muốn xác nhận đơn hàng này không?
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                            <button type="button" class="btn btn-primary" data-dismiss="modal">Xác
                              nhận</button>
                          </div>
                        </div>
                      </div>
                    </div>
                  </span>

                  <span>
                    <input class="confirm-check" type="checkbox" value="confirm-delivered" name="confirm-deliverd">
                    <label title="Xác nhận vận chuyển thành công" class="label-delivered disable"><i
                        class="fas fa-truck"></i></label>
                    <div class="modal fade" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Xác nhận vận chuyển</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <i aria-hidden="true">&times;</i>
                            </button>
                          </div>
                          <div class="modal-body">
                            Bạn có muốn xác nhận vận chuyển thành công?
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                            <button type="button" class="btn btn-primary" data-dismiss="modal">Xác
                              nhận</button>
                          </div>
                        </div>
                      </div>
                    </div>
                  </span>
                  <span>
                    <input class="confirm-check" type="checkbox" value="confirm-cancel" name="confirm-cancel">
                    <label title="Hủy đơn hàng" data-toggle="modal" class="label-cancel warning"><i
                        class="fas fa-trash"></i></label>
                    <div class="modal fade" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Xác nhận hủy đơn</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <i aria-hidden="true">&times;</i>
                            </button>
                          </div>
                          <div class="modal-body">
                            Bạn có muốn xác nhận hủy đơn hàng này không?
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                            <button type="button" class="btn btn-primary" data-dismiss="modal">Xác
                              nhận</button>
                          </div>
                        </div>
                      </div>
                    </div>
                  </span>

                </td>
              </tr>
            </tbody>



          </table>
          <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
            aria-hidden="true">
            <div class="modal-dialog  detail-modal">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">Chi tiết đơn hàng</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                  <h5>Đơn hàng: DH01</h5>
                  <table width="100%" class="text-center  table content-detail  table-hover">
                    <thead class="thead-light">
                      <tr>
                        <th>Mã khách hàng</th>
                        <th>Tên khách hàng</th>
                        <th><span title="Số điện thoại"> Số điện thoại</span></th>
                        <th>Hình thức thanh toán</th>
                        <th style="min-width: 300px;"> Địa chỉ</th>

                      </tr>
                    </thead>
                    <tr>


                      <td>KH01</td>
                      <td>Trần Thanh Bảo</td>
                      <td><span title="Số điện thoại"> 09128374822</span></td>
                      <td>Thanh toán khi nhận hàng</td>
                      <td style="min-width: 300px;"> Khu phố 6, phường Linh Trung, quận Thủ Đức,TP Hồ Chí Minh</th>

                    </tr>
                  </table>
                  <table width="100%" class="text-center  table content-detail  table-hover">
                    <thead class="thead-light">
                      <tr>
                        <th>Hình ảnh</th>
                        <th>Mã sản phẩm</th>
                        <th>Tên sản phẩm</th>
                        <th>Màu sắc</th>
                        <th>Số lượng</th>
                        <th> Giá</th>

                      </tr>
                    </thead>
                    <tr>
                      <td style="max-width: 140px;"><img src="../image/Product/i12black.png" width="100px" height="100px" alt=""></td>
                      <td>SP01</td>
                      <td>IPhone X 64GB</td>
                      <td><span title="Số điện thoại"> Đen</span></td>
                      <td style="min-width: 300px;">1</th>
                      <td style="min-width: 300px;">17.000.000<span style="text-decoration: underline;">đ</span></th>
                    </tr>
                    <tr>
                      <td style="max-width: 140px;"><img src="../image/Product/samsung.png" width="100px" height="100px" alt=""></td>
                      <td>SP02</td>
                      <td>Samsung Galaxy S10</td>
                      <td><span title="Số điện thoại">Trắng</span></td>
                      <td style="min-width: 300px;">1</th>
                      <td style="min-width: 300px;">23.000.000<span style="text-decoration: underline;">đ</span></th>
                    </tr>
                  </table>

                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="page-navigation">
          <div class="beta"> <button onclick="previous_page()"> Trước</button>
            <span id="page-number">

            </span>
            <button onclick="next_page()"> Sau</button></div>
        </div>


      </div>

	</div>
	<jsp:include page="/VIEW/jsp/jsp-component/footer-admin.jsp"></jsp:include>
	<script src="${url}/js/js-page/confirmed.js"></script>
	<script
	src="${url}/css/css-static/bootstrap/vendor/jquery/jquery.min.js"></script>
<script
	src="${url}/css/css-static/bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>

</html>