<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<jsp:include page="/VIEW/jsp/jsp-component/head-css.jsp" />
<c:url var="url" scope="session" value="/VIEW"></c:url>
<link rel="stylesheet" href="${url}/css/css-page/cart.css">
</head>

<body>
	<jsp:include page="/VIEW/jsp/jsp-component/menu.jsp"></jsp:include>
		<!-- Thanh menu loc du lieu va sap xep-->
	<jsp:include page="/VIEW/jsp/jsp-component/filterOther.jsp"></jsp:include>
<!-- breadcumb -->
	<c:import url="/VIEW/jsp/jsp-component/breadcumb.jsp">
		<c:param name="title" value="Giỏ hàng"></c:param>
	</c:import>

	<!-- Page Content -->


	<section class="pt-5 pb-5 ">
		<div class="container">
			<div class="row">
				<div class="col-8">
					<div class="frame-cart">
						<ul>
							<li class="cart-content"><img src="https://cdn.tgdd.vn/Products/Images/42/229056/oppo-a93-trang-14-600x600.jpg">


								<div class="content-product">
									<div class="alpha">
										<div class="mb-4">
											<a href="../Product_page/chiTietSanPham.html"> iPhone 12
												Pro Max 123GB</a>
										</div>
										<p>
											Màu sắc: <span>Đen</span>
										</p>
										<p>
											Thương hiệu: <span>Apple</span>
										</p>
									</div>
									<div class="beta">
										<div class="price">
											<p>
												23.000.00 <span class="unit">đ </span>
											</p>
											<p class="discount-price">
												23.000.00 <span class="unit">đ </span>
											</p>
										</div>
										<div class="quantity">
											<div class="quantity-content">
												<button class="btn minus">
													<i class="fas fa-minus"></i>
												</button>
												<input type="number" min="1" value="1" max="5">
												<button class="btn plus">
													<i class="fas fa-plus"></i>
												</button>
											</div>
											<div class="delete-content">
												<button class="btn btn-danger">Xóa</button>
											</div>
										</div>
									</div>
								</div></li>
							<li class="cart-content"><img src="https://cdn.tgdd.vn/Products/Images/42/229056/oppo-a93-trang-14-600x600.jpg">


								<div class="content-product">
									<div class="alpha">
										<div class="mb-4">
											<a href="../Product_page/chiTietSanPham.html"> Vivo S8
												64GB</a>
										</div>
										<p>
											Màu sắc: <span>Tím</span>
										</p>
										<p>
											Thương hiệu: <span>Vivo</span>
										</p>
									</div>
									<div class="beta">
										<div class="price">
											<p>
												17.000.00 <span class="unit">đ </span>
											</p>
											<p class="discount-price">
												17.000.00 <span class="unit">đ </span>
											</p>
										</div>
										<div class="quantity">
											<div class="quantity-content">
												<button class="btn minus">
													<i class="fas fa-minus"></i>
												</button>
												<input type="number" min="1" value="1" max="5">
												<button class="btn plus">
													<i class="fas fa-plus"></i>
												</button>
											</div>
											<div class="delete-content">
												<button class="btn btn-danger">Xóa</button>
											</div>
										</div>
									</div>
								</div></li>
							<li class="cart-content"><img
								src="https://cdn.tgdd.vn/Products/Images/42/229056/oppo-a93-trang-14-600x600.jpg">


								<div class="content-product">
									<div class="alpha">
										<div class="mb-4">
											<a href="../Product_page/chiTietSanPham.html"> Samsung
												galaxy S10</a>
										</div>
										<p>
											Màu sắc: <span>Trắng</span>
										</p>
										<p>
											Thương hiệu: <span>Samsung</span>
										</p>
									</div>
									<div class="beta">
										<div class="price">
											<p>
												26.000.00 <span class="unit">đ </span>
											</p>
											<p class="discount-price">
												26.000.00 <span class="unit">đ </span>
											</p>
										</div>
										<div class="quantity">
											<div class="quantity-content">
												<button class="btn minus">
													<i class="fas fa-minus"></i>
												</button>
												<input type="number" min="1" value="1" max="5">
												<button class="btn plus">
													<i class="fas fa-plus"></i>
												</button>
											</div>
											<div class="delete-content">
												<button class="btn btn-danger  ">Xóa</button>
											</div>
										</div>
									</div>
								</div></li>
						</ul>
					</div>

				</div>
				<div class="col-4">
					<h5 class="mb-3 text-left ml-5">Tạm tính</h5>
					<div class="receipt">

						<ul>
							<li class="price-product">
								<h5>
									iPhone 12 Pro Max 123GB<span>x</span> 1
								</h5>
								<p>
									23.000.000 <span class="unit"> đ</span>
								</p>

							</li>
							<li class="price-product">
								<h5>
									Samsung Galayxy S10 <span>x</span> 1
								</h5>
								<p>
									17.000.000 <span class="unit"> đ</span>
								</p>
							</li>
							<li class="price-product">
								<h5>
									Vivo S8 64G<span>x</span> 1
								</h5>
								<p>
									26.000.000 <span class="unit"> đ</span>
								</p>
							</li>
						</ul>
						<div class="sum-price">
							<div class="title">
								<p>Tổng tiền</p>
							</div>
							<div class="price-sum">
								<p class="price">
									66.000.000 <span class="unit"> đ</span>
								</p>
								<p>(Đã bao gồm VAT nếu có)</p>
							</div>
							
							
							 <a class="text-none" style="color:rgb(255, 255, 255)" href="${pageContext.request.contextPath}/member/payment"> <button
                                    class="btn-primary btn-receipt">Thanh toán</button></a>
							
							
							

						</div>
					</div>

				</div>

			</div>
		</div>






	</section>



	<!-- /.container -->



	<jsp:include page="/VIEW/jsp/jsp-component/footer.jsp"></jsp:include>

	<!-- Bootstrap core JavaScript -->



	<script src="${url }/js/js-static/cart.js"></script>
</body>

</html>