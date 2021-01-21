<%@page import="model_beans.Cart"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
<jsp:include page="/VIEW/jsp/jsp-component/head-css.jsp" />
<c:url var="url" scope="session" value="/VIEW"></c:url>
<link rel="stylesheet" href="${url}/css/css-page/cart.css">
</head>
<%@page import="model_DAO.DAO_IconMenu"%>
<%
	DAO_IconMenu dao = new DAO_IconMenu();
request.setAttribute("color", dao.colorWeb());
%>
<body
	style="color: ${color.colorText};background-color: ${color.colorBody}">
	<jsp:include page="/VIEW/jsp/jsp-component/menu.jsp"></jsp:include>
	<!-- Thanh menu loc du lieu va sap xep-->
	<c:import url="/VIEW/jsp/jsp-component/filter.jsp">
	</c:import>
	<c:import url="/VIEW/jsp/jsp-component/breadcumb.jsp">
		<c:param name="title" value="Giỏ hàng"></c:param>
	</c:import>

	<!-- Page Content -->


	<!-- @@@@@@@@@@ HIỆN THÔNG BÁO KHI VƯỢT QUÁ GIỚI HẠN SẢN PHẨM TRONG GIỎ HÀNG @@@@@@@@@@@@@ -->
	<c:if test="${message != null}">

		<script>
			window.onload = function() {
				document.getElementById('btn-message').click();
			}
		</script>

		<!-- Button trigger modal -->
		<button style="padding: -30px; visibility: hidden; z-index: 99999"
			type="button" id="btn-message" class="btn btn-white"
			data-toggle="modal" data-target="#thongBaoMax"></button>

		<!-- Modal -->
		<div class="modal fade" id="thongBaoMax" tabindex="-1" role="dialog"
			aria-labelledby="thongBaoMaxTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="thongBaoMaxTitle">${message}</h5>
					</div>

					<div class="modal-footer">

						<button type="button" class="btn btn-primary" data-dismiss="modal">Đóng</button>
					</div>
				</div>
			</div>
		</div>

	</c:if>
	<!-- @@@@@@@@@@ END HIỆN THÔNG BÁO KHI VƯỢT QUÁ GIỚI HẠN SẢN PHẨM TRONG GIỎ HÀNG @@@@@@@@@@@@@ -->



	<section class="pt-5 pb-5 ">
		<div class="container">
			<div class="row">


				<c:choose>
					<c:when test="${ QUANTITY_INSTANCE_PRODUCT >0 }">


						<div class="col-8">
							<div class="frame-cart">
								<ul>
									<c:forEach items="${LIST_INSTANCE_PRODUCT}" var="pro">
										<li class="cart-content"><a
											href="${pageContext.request.contextPath}/chi-tiet?dien-thoai=${pro.URL}">
												<img src="${pro.img}">
										</a>

											<div class="content-product">
												<div class="alpha">
													<div class="mb-4">
														<a
															href="${pageContext.request.contextPath}/chi-tiet?dien-thoai=${pro.URL}">${pro.name }</a>
													</div>
													<p>
														Màu sắc: <span>${pro.color}</span>
													</p>
													<p>
														Thương hiệu: <span><a href="${pageContext.request.contextPath}/searchingProduct?thuonghieu=${pro.nameBranch}">${pro.nameBranch }</a></span>
													</p>
												</div>
												<div class="beta">
													<div class="price">
														<p>
															<fmt:formatNumber type="number" maxFractionDigits="3"
																value="${pro.price }" />
															<span class="unit">đ </span>
														</p>
														<c:if test="${pro.priceSales!=0}">
															<p class="discount-price">
																<fmt:formatNumber type="number" maxFractionDigits="3"
																	value="${pro.priceSales }" />
																<span class="unit">đ </span>
															</p>
														</c:if>
													</div>
													<div class="quantity">
														<div class="quantity-content">
															<form action="${pageContext.request.contextPath}/cart"
																method="post">
																<input name="choose" value="decrease" hidden="true">
																<input name="page" value="cart-page" hidden="true">
																<input name="colorID" value="${pro.colorID}"
																	hidden="true">
																<button name="id" value="${pro.id}" class="btn minus">
																	<i class="fas fa-minus"></i>
																</button>
															</form>
															<input type="number" min="1"
																value="${pro.quantityInCart}" max="5">
															<form action="${pageContext.request.contextPath}/cart"
																method="post">
																<input name="choose" value="add" hidden="true">
																<input name="page" value="cart-page" hidden="true">
																<input name="colorID" value="${pro.colorID}"
																	hidden="true">
																<button name="id" value="${pro.id}" class="btn plus">
																	<i class="fas fa-plus"></i>
																</button>
															</form>
														</div>
														<div class="delete-content">
															<form method="POST"
																action="${pageContext.request.contextPath}/cart">
																<input name="id" value="${pro.id}" hidden="true">
																<input name="colorID" value="${pro.colorID}"
																	hidden="true"> <input name="page"
																	value="cart-page" hidden="true">
																<button name="choose" value="remove"
																	class="btn btn-danger">Xóa</button>
															</form>
														</div>
													</div>
												</div>
											</div></li>

									</c:forEach>



								</ul>
								<!-- 								### NÚT XÓA TẤT CẢ GIỎ HÀNG ### -->
								<c:if test="${QUANTITY_MODEL > 1}">


									<!-- Button trigger modal -->
									<button type="button" class="btn btn-danger"
										data-toggle="modal" data-target="#xacNhanXoaGioHang">
										<i class="far fa-trash-alt"></i> Xóa tất cả
									</button>

									<!-- Modal -->
									<div class="ml-5 modal fade" id="xacNhanXoaGioHang"
										tabindex="-1" role="dialog" aria-hidden="true">
										<div class="modal-dialog modal-dialog-centered"
											role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title">Bạn có muốn xóa toàn bộ giỏ
														hàng ?</h5>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>

												<div class="modal-footer">
													<button type="button" class="btn btn-success"
														data-dismiss="modal">
														<i class="fas fa-share"></i> Trở về
													</button>
													<form method="POST"
														action="${pageContext.request.contextPath}/cart">
														<button type="submit" name="choose" value="remove-all"
															class="btn btn-danger">
															<i class="fas fa-trash-alt"></i> Tiếp tục xóa
														</button>
													</form>
												</div>
											</div>
										</div>
									</div>

								</c:if>
								<!-- 								### NÚT XÓA TẤT CẢ GIỎ HÀNG ### -->
							</div>

						</div>
						<div class="col-4">
							<h5 class="mb-3 text-left ml-5">Tạm tính</h5>
							<div class="receipt">
								<ul>
									<c:forEach items="${LIST_INSTANCE_PRODUCT}" var="pro">
										<li class="price-product">
											<h5>${pro.name} (${pro.color})  <span> x</span> <strong>${pro.quantityInCart}</strong>
											</h5>
											<p>
												<fmt:formatNumber type="number" maxFractionDigits="3"
													value="${pro.price * pro.quantityInCart }" />
												<span class="unit"> đ</span>
											</p>

										</li>
									</c:forEach>

								</ul>

								<div class="sum-price">
									<div class="title">
										<p>Tổng tiền</p>
									</div>
									<div class="price-sum">
										<p class="price">
											<fmt:formatNumber type="number" maxFractionDigits="3"
												value="${TOTAL_MONEY}" />
											<span class="unit"> đ</span>
										</p>
										<p>(Đã bao gồm VAT nếu có)</p>
									</div>
									<!-- 								########## START XỬ LÝ NÚT THANH TOÁN ############## -->
									<c:choose>
										<c:when test="${CUSTOMER_LOGINED == null }">

											<!-- 			 Button trigger modal -->
											<button class="btn-primary btn-receipt" type="button"
												data-toggle="modal" data-target="#xacNhanThanhToan">Thanh
												toán</button>

											<!-- 		 Modal -->
											<div class="modal fade" id="xacNhanThanhToan" tabindex="-1"
												role="dialog" aria-labelledby="xacNhanThanhToanTitle"
												aria-hidden="true">
												<div class="modal-dialog modal-dialog-centered"
													role="document">
													<div class="modal-content">
														<div class="modal-header">
															<h5 class="modal-title" id="xacNhanThanhToanTitle">Bạn
																chưa đăng nhập !</h5>
														</div>
														<div class="modal-body text-left">
															<p>Đăng nhập để dễ dàng quản lý đơn hàng, xem lại
																lịch sử mua hàng.</p>
															<p style="font-weight: bold;">
																Bạn có muốn đăng nhập hoặc <a
																	href="${pageContext.request.contextPath}/register"
																	class="mx-2">Đăng kí</a> ?
															</p>
														</div>
														<div class="modal-footer">
															<a
																href="${pageContext.request.contextPath}/login?payment=on"
																class="btn btn-success" role="button"><i
																class="fas fa-sign-in-alt"></i> Đăng nhập</a> <a
																href="${pageContext.request.contextPath}/payment"
																class="btn btn-danger" role="button"><i
																class="fas fa-chevron-circle-right"></i> Tiếp tục mua
																không đăng nhập</a>

														</div>
													</div>
												</div>
											</div>

										</c:when>
										<c:otherwise>
											<a class="text-none" style="color: rgb(255, 255, 255)"
												href="${pageContext.request.contextPath}/payment">
												<button class="btn-primary btn-receipt">Thanh toán</button>
											</a>

										</c:otherwise>
									</c:choose>


									<!-- 								########## END XỬ LÝ NÚT THANH TOÁN ############## -->



								</div>
							</div>

						</div>

					</c:when>
					<c:otherwise>

						<div style="margin-top: -50px" class="container">
							<div class="row mb-4  text-center">
								<div class="col-12">

									<img style="" src="${url}/image/img-sys/emptycart.webp">
									<h2 style="margin-top: -50px">Giỏ hàng trống</h2>

								</div>
							</div>
						</div>


					</c:otherwise>
				</c:choose>



			</div>
		</div>


	</section>

	<jsp:include page="/VIEW/jsp/jsp-component/footer.jsp"></jsp:include>

	<script src="${url }/js/js-static/cart.js"></script>
</body>

</html>