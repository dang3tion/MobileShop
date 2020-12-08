<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<jsp:include page="/VIEW/jsp/jsp-component/head-css.jsp" />
<c:url var="url" scope="application" value="/VIEW"></c:url>
</head>
<body>
	<jsp:include page="/VIEW/jsp/jsp-component/menu.jsp"></jsp:include>
	<!-- Thanh menu loc du lieu va sap xep-->
	<jsp:include page="/VIEW/jsp/jsp-component/filter.jsp"></jsp:include>
	<!-- Page Content -->
	<div class="container">

		<div class="row">


			<!--Slider san pham noi bat-->
			<div class="hot-products row col-12 bordertitle">
				<div class="col-lg-12">
					<div class="title ">
						<div class="title float-left">
							<h3>Sản phẩm nổi bật</h3>
						</div>
						<div class="title float-right">
							<a href="#">Xem thêm <i class="fas fa-arrow-right"></i></a>
						</div>
					</div>
				</div>
				<div class="col-lg-12">
					<div class="content mt-4">
						<div id="carouselForHorproduct" data-interval="false"
							class="carousel slide" data-ride="carousel">
							<div class="carousel-inner">

								<div class="carousel-item active ">
									<div class="row d-block ">
										<c:forEach items="${list}" var="p">
											<div class="col-3">
												<div class="card">
													<div class="card-img text-center">
														<a href="Product_page/chiTietSanPham.html"> <img
															src="${url }/image/image-user/product/${p.img}"
															width="80%" class="" alt="..."></a>
													</div>
													<div class="card-content">
														<div class="card-title" style="min-height:43px;">
															<a href="Product_page/chiTietSanPham.html">Iphone 12
																${p.name } 
														</div>
														<div class="card-price">
															<span>
																<div class="card-count">
																	${p.price } <span class="unit">đ</span>
																</div>
																<div class="card-discount">
																	${p.priceSale } <span class="unit">đ</span>
																</div>
														</div>
														<div class="card-stars">
															<span> <i class="fas fa-star text-warning"></i></span> <span>
																<i class="fas fa-star text-warning"></i>
															</span> <span> <i class="fas fa-star text-warning"></i></span> <span>
																<i class="fas fa-star text-warning"></i>
															</span> <span> <i class="fas fa-star  text-dark"></i></span>
														</div>
													</div>
												</div>
											</div>
										</c:forEach>

									</div>
								</div>
								<div class="carousel-item ">
									<div class="row d-block">
										<c:forEach items="${list2}" var="p2">
											<div class="col-3">
												<div class="card">
													<div class="card-img text-center">
														<a href="Product_page/chiTietSanPham.html"> <img
															src="${url }/image/image-user/product/${p2.img}"
															width="80%" class="" alt="..."></a>
													</div>
													<div class="card-content">
														<div class="card-title" style="min-height:43px;">
															<a href="Product_page/chiTietSanPham.html">Iphone 12
																${p2.name } 
														</div>
														<div class="card-price">
															<span>
																<div class="card-count">
																	${p2.price } <span class="unit">đ</span>
																</div>
																<div class="card-discount">
																	${p2.priceSale } <span class="unit">đ</span>
																</div>
														</div>
														<div class="card-stars">
															<span> <i class="fas fa-star text-warning"></i></span> <span>
																<i class="fas fa-star text-warning"></i>
															</span> <span> <i class="fas fa-star text-warning"></i></span> <span>
																<i class="fas fa-star text-warning"></i>
															</span> <span> <i class="fas fa-star  text-dark"></i></span>
														</div>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>

								</div>
								<a class="carousel-control-prev" href="#carouselForHorproduct"
									role="button" data-slide="prev"> <span
									class="carousel-control-prev-icon" aria-hidden="true"></span> <span
									class="sr-only">Previous</span>
								</a> <a class="carousel-control-next" href="#carouselForHorproduct"
									role="button" data-slide="next"> <span
									class="carousel-control-next-icon " aria-hidden="true"></span>
									<span class="sr-only">Next</span>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--Slider san pham moi-->
			<div class="hot-products row col-12 bordertitle">
				<div class="col-lg-12">
					<div class="title ">
						<div class="title float-left">
							<h3>Sản phẩm mới</h3>
						</div>
						<div class="title float-right">
							<a href="#">Xem thêm <i class="fas fa-arrow-right"></i></a>
						</div>
					</div>
				</div>
				<div class="col-lg-12">
					<div class="content mt-4">
						<div id="carouselForNewProduct" data-interval="false"
							class="carousel slide" data-ride="carousel">
							<div class="carousel-inner">
								<div class="carousel-item active ">
									<div class="row d-block ">
										<div class="col-3">
											<div class="card">
												<div class="card-img text-center">
													<a href="#"> <img src="image/img_phone/6.jpg"
														width="80%" class="" alt="..."></a>
												</div>
												<div class="card-content">
													<div class="card-title">
														<a href="#">Iphone 12 64 GBIphone 12 64 GBIphone 12 64
															GB</a>
													</div>
													<div class="card-price">
														<span>
															<div class="card-count">
																19.990.000 <span class="unit">đ</span>
															</div>
															<div class="card-discount">
																23.000.000 <span class="unit">đ</span>
															</div>
													</div>
													<div class="card-stars">
														<span> <i class="fas fa-star text-warning"></i></span> <span>
															<i class="fas fa-star text-warning"></i>
														</span> <span> <i class="fas fa-star text-warning"></i></span> <span>
															<i class="fas fa-star text-warning"></i>
														</span> <span> <i class="fas fa-star  text-dark"></i></span>
													</div>
												</div>
											</div>
										</div>
										<div class="col-3">
											<div class="card">
												<div class="card-img text-center">
													<a href="#"> <img src="image/img_phone/7.jpg"
														width="80%" class="" alt="..."></a>
												</div>
												<div class="card-content">
													<div class="card-title">
														<a href="#">Iphone 12 64 GBIphone 12 64 GBIphone 12 64
															GB</a>
													</div>
													<div class="card-price">
														<span>
															<div class="card-count">
																19.990.000 <span class="unit">đ</span>
															</div>
															<div class="card-discount">
																23.000.000 <span class="unit">đ</span>
															</div>
													</div>
													<div class="card-stars">
														<span> <i class="fas fa-star text-warning"></i></span> <span>
															<i class="fas fa-star text-warning"></i>
														</span> <span> <i class="fas fa-star text-warning"></i></span> <span>
															<i class="fas fa-star text-warning"></i>
														</span> <span> <i class="fas fa-star  text-dark"></i></span>
													</div>
												</div>
											</div>
										</div>
										<div class="col-3">
											<div class="card">
												<div class="card-img text-center">
													<a href="#"> <img src="image/img_phone/8.jpg"
														width="80%" class="" alt="..."></a>
												</div>
												<div class="card-content">
													<div class="card-title">
														<a href="#">Iphone 12 64 GBIphone 12 64 GBIphone 12 64
															GB</a>
													</div>
													<div class="card-price">
														<span>
															<div class="card-count">
																19.990.000 <span class="unit">đ</span>
															</div>
															<div class="card-discount">
																23.000.000 <span class="unit">đ</span>
															</div>
													</div>
													<div class="card-stars">
														<span> <i class="fas fa-star text-warning"></i></span> <span>
															<i class="fas fa-star text-warning"></i>
														</span> <span> <i class="fas fa-star text-warning"></i></span> <span>
															<i class="fas fa-star text-warning"></i>
														</span> <span> <i class="fas fa-star  text-dark"></i></span>
													</div>
												</div>
											</div>

										</div>
										<div class="col-3">
											<div class="card">
												<div class="card-img text-center">
													<a href="#"> <img src="image/img_phone/9.jpg"
														width="80%" class="" alt="..."></a>
												</div>
												<div class="card-content">
													<div class="card-title">
														<a href="#">Iphone 12 64 GBIphone 12 64 GBIphone 12 64
															GB</a>
													</div>
													<div class="card-price">
														<span>
															<div class="card-count">
																19.990.000 <span class="unit">đ</span>
															</div>
															<div class="card-discount">
																23.000.000 <span class="unit">đ</span>
															</div>
													</div>
													<div class="card-stars">
														<span> <i class="fas fa-star text-warning"></i></span> <span>
															<i class="fas fa-star text-warning"></i>
														</span> <span> <i class="fas fa-star text-warning"></i></span> <span>
															<i class="fas fa-star text-warning"></i>
														</span> <span> <i class="fas fa-star  text-dark"></i></span>
													</div>
												</div>
											</div>

										</div>
									</div>
								</div>
								<div class="carousel-item ">
									<div class="row d-block">
										<div class="col-3">
											<div class="card">
												<div class="card-img text-center">
													<a href="#"> <img src="image/img_phone/10.jpg"
														width="80%" class="" alt="..."></a>
												</div>
												<div class="card-content">
													<div class="card-title">
														<a href="#">Iphone 12 64 GBIphone 12 64 GBIphone 12 64
															GB</a>
													</div>
													<div class="card-price">
														<span>
															<div class="card-count">
																19.990.000 <span class="unit">đ</span>
															</div>
															<div class="card-discount">
																23.000.000 <span class="unit">đ</span>
															</div>
													</div>
													<div class="card-stars">
														<span> <i class="fas fa-star text-warning"></i></span> <span>
															<i class="fas fa-star text-warning"></i>
														</span> <span> <i class="fas fa-star text-warning"></i></span> <span>
															<i class="fas fa-star text-warning"></i>
														</span> <span> <i class="fas fa-star  text-dark"></i></span>
													</div>
												</div>
											</div>
										</div>
										<div class="col-3">
											<div class="card">
												<div class="card-img text-center">
													<a href="#"> <img src="image/img_phone/11.jpg"
														width="80%" class="" alt="..."></a>
												</div>
												<div class="card-content">
													<div class="card-title">
														<a href="#">Iphone 12 64 GBIphone 12 64 GBIphone 12 64
															GB</a>
													</div>
													<div class="card-price">
														<span>
															<div class="card-count">
																19.990.000 <span class="unit">đ</span>
															</div>
															<div class="card-discount">
																23.000.000 <span class="unit">đ</span>
															</div>
													</div>
													<div class="card-stars">
														<span> <i class="fas fa-star text-warning"></i></span> <span>
															<i class="fas fa-star text-warning"></i>
														</span> <span> <i class="fas fa-star text-warning"></i></span> <span>
															<i class="fas fa-star text-warning"></i>
														</span> <span> <i class="fas fa-star  text-dark"></i></span>
													</div>
												</div>
											</div>

										</div>
										<div class="col-3">
											<div class="card">
												<div class="card-img text-center">
													<a href="#"> <img src="image/img_phone/12.jpg"
														width="80%" class="" alt="..."></a>
												</div>
												<div class="card-content">
													<div class="card-title">
														<a href="#">Iphone 12 64 GBIphone 12 64 GBIphone 12 64
															GB</a>
													</div>
													<div class="card-price">
														<span>
															<div class="card-count">
																19.990.000 <span class="unit">đ</span>
															</div>
															<div class="card-discount">
																23.000.000 <span class="unit">đ</span>
															</div>
													</div>
													<div class="card-stars">
														<span> <i class="fas fa-star text-warning"></i></span> <span>
															<i class="fas fa-star text-warning"></i>
														</span> <span> <i class="fas fa-star text-warning"></i></span> <span>
															<i class="fas fa-star text-warning"></i>
														</span> <span> <i class="fas fa-star  text-dark"></i></span>
													</div>
												</div>
											</div>

										</div>
										<div class="col-3">
											<div class="card">
												<div class="card-img text-center">
													<a href="#"> <img src="image/img_phone/13.jpg"
														width="80%" class="" alt="..."></a>
												</div>
												<div class="card-content">
													<div class="card-title">
														<a href="#">Iphone 12 64 GBIphone 12 64 GBIphone 12 64
															GB</a>
													</div>
													<div class="card-price">
														<span>
															<div class="card-count">
																19.990.000 <span class="unit">đ</span>
															</div>
															<div class="card-discount">
																23.000.000 <span class="unit">đ</span>
															</div>
													</div>
													<div class="card-stars">
														<span> <i class="fas fa-star text-warning"></i></span> <span>
															<i class="fas fa-star text-warning"></i>
														</span> <span> <i class="fas fa-star text-warning"></i></span> <span>
															<i class="fas fa-star text-warning"></i>
														</span> <span> <i class="fas fa-star  text-dark"></i></span>
													</div>
												</div>
											</div>

										</div>
									</div>

								</div>
								<a class="carousel-control-prev" href="#carouselForNewProduct"
									role="button" data-slide="prev"> <span
									class="carousel-control-prev-icon" aria-hidden="true"></span> <span
									class="sr-only">Previous</span>
								</a> <a class="carousel-control-next" href="#carouselForNewProduct"
									role="button" data-slide="next"> <span
									class="carousel-control-next-icon " aria-hidden="true"></span>
									<span class="sr-only">Next</span>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>



		</div>
		<!--Thanh bar tim kiem theo noi dung-->
		<div class="row">
			<jsp:include page="/VIEW/jsp/jsp-component/sidebar-filter.jsp"></jsp:include>
			<!--Noi dung ket qua sau khi tim kiem-->
			<div class="col-9" id="result-content">
				<!--Hang ket qua-->
				<div class="title overflow-auto ">
					<div class="title float-left">
						<h3>Được xem nhiều</h3>
					</div>
					<div class="title float-right">
						<a href="#">Xem thêm <i class="fas fa-arrow-right"></i></a>
					</div>
				</div>
				<div class="row-content">

					<div class="row">
						<div class="col-4">
							<div class="card">
								<div class="card-img text-center">
									<a href="#"> <img src="image/img_phone/15.jpg" width="80%"
										class="" alt="..."></a>
								</div>
								<div class="card-content">
									<div class="card-title">
										<a href="#">Iphone 12 64 GBIphone 12 64 GBIphone 12 64 GB</a>
									</div>
									<div class="card-price">
										<span>
											<div class="card-count">
												19.990.000 <span class="unit">đ</span>
											</div>
											<div class="card-discount">
												23.000.000 <span class="unit">đ</span>
											</div>
									</div>
									<div class="card-stars">
										<span> <i class="fas fa-star text-warning"></i></span> <span>
											<i class="fas fa-star text-warning"></i>
										</span> <span> <i class="fas fa-star text-warning"></i></span> <span>
											<i class="fas fa-star text-warning"></i>
										</span> <span> <i class="fas fa-star  text-dark"></i></span>
									</div>
								</div>
							</div>
						</div>
						<div class="col-4">
							<div class="card">
								<div class="card-img text-center">
									<a href="#"> <img src="image/img_phone/14.jpg" width="80%"
										class="" alt="..."></a>
								</div>
								<div class="card-content">
									<div class="card-title">
										<a href="#">Iphone 12 64 GBIphone 12 64 GBIphone 12 64 GB</a>
									</div>
									<div class="card-price">
										<span>
											<div class="card-count">
												19.990.000 <span class="unit">đ</span>
											</div>
											<div class="card-discount">
												23.000.000 <span class="unit">đ</span>
											</div>
									</div>
									<div class="card-stars">
										<span> <i class="fas fa-star text-warning"></i></span> <span>
											<i class="fas fa-star text-warning"></i>
										</span> <span> <i class="fas fa-star text-warning"></i></span> <span>
											<i class="fas fa-star text-warning"></i>
										</span> <span> <i class="fas fa-star  text-dark"></i></span>
									</div>
								</div>
							</div>
						</div>
						<div class="col-4">
							<div class="card">
								<div class="card-img text-center">
									<a href="#"> <img src="image/img_phone/16.jpg" width="80%"
										class="" alt="..."></a>
								</div>
								<div class="card-content">
									<div class="card-title">
										<a href="#">Iphone 12 64 GBIphone 12 64 GBIphone 12 64 GB</a>
									</div>
									<div class="card-price">
										<span>
											<div class="card-count">
												19.990.000 <span class="unit">đ</span>
											</div>
											<div class="card-discount">
												23.000.000 <span class="unit">đ</span>
											</div>
									</div>
									<div class="card-stars">
										<span> <i class="fas fa-star text-warning"></i></span> <span>
											<i class="fas fa-star text-warning"></i>
										</span> <span> <i class="fas fa-star text-warning"></i></span> <span>
											<i class="fas fa-star text-warning"></i>
										</span> <span> <i class="fas fa-star  text-dark"></i></span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--Hang ket qua-->
				<div class="row-content">
					<div class="row">
						<div class="col-4">
							<div class="card">
								<div class="card-img text-center">
									<a href="#"> <img src="image/img_phone/17.jpg" width="80%"
										class="" alt="..."></a>
								</div>
								<div class="card-content">
									<div class="card-title">
										<a href="#">Iphone 12 64 GBIphone 12 64 GBIphone 12 64 GB</a>
									</div>
									<div class="card-price">
										<span>
											<div class="card-count">
												19.990.000 <span class="unit">đ</span>
											</div>
											<div class="card-discount">
												23.000.000 <span class="unit">đ</span>
											</div>
									</div>
									<div class="card-stars">
										<span> <i class="fas fa-star text-warning"></i></span> <span>
											<i class="fas fa-star text-warning"></i>
										</span> <span> <i class="fas fa-star text-warning"></i></span> <span>
											<i class="fas fa-star text-warning"></i>
										</span> <span> <i class="fas fa-star  text-dark"></i></span>
									</div>
								</div>
							</div>
						</div>
						<div class="col-4">
							<div class="card">
								<div class="card-img text-center">
									<a href="#"> <img src="image/img_phone/18.jpg" width="80%"
										class="" alt="..."></a>
								</div>
								<div class="card-content">
									<div class="card-title">
										<a href="#">Iphone 12 64 GBIphone 12 64 GBIphone 12 64 GB</a>
									</div>
									<div class="card-price">
										<span>
											<div class="card-count">
												19.990.000 <span class="unit">đ</span>
											</div>
											<div class="card-discount">
												23.000.000 <span class="unit">đ</span>
											</div>
									</div>
									<div class="card-stars">
										<span> <i class="fas fa-star text-warning"></i></span> <span>
											<i class="fas fa-star text-warning"></i>
										</span> <span> <i class="fas fa-star text-warning"></i></span> <span>
											<i class="fas fa-star text-warning"></i>
										</span> <span> <i class="fas fa-star  text-dark"></i></span>
									</div>
								</div>
							</div>
						</div>
						<div class="col-4">
							<div class="card">
								<div class="card-img text-center">
									<a href="#"> <img src="image/img_phone/19.jpg" width="80%"
										class="" alt="..."></a>
								</div>
								<div class="card-content">
									<div class="card-title">
										<a href="#">Iphone 12 64 GBIphone 12 64 GBIphone 12 64 GB</a>
									</div>
									<div class="card-price">
										<span>
											<div class="card-count">
												19.990.000 <span class="unit">đ</span>
											</div>
											<div class="card-discount">
												23.000.000 <span class="unit">đ</span>
											</div>
									</div>
									<div class="card-stars">
										<span> <i class="fas fa-star text-warning"></i></span> <span>
											<i class="fas fa-star text-warning"></i>
										</span> <span> <i class="fas fa-star text-warning"></i></span> <span>
											<i class="fas fa-star text-warning"></i>
										</span> <span> <i class="fas fa-star  text-dark"></i></span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--Hang ket qua-->
				<div class="row-content">
					<div class="row">
						<div class="col-4">
							<div class="card">
								<div class="card-img text-center">
									<a href="#"> <img src="image/img_phone/20.jpg" width="80%"
										class="" alt="..."></a>
								</div>
								<div class="card-content">
									<div class="card-title">
										<a href="#">Iphone 12 64 GBIphone 12 64 GBIphone 12 64 GB</a>
									</div>
									<div class="card-price">
										<span>
											<div class="card-count">
												19.990.000 <span class="unit">đ</span>
											</div>
											<div class="card-discount">
												23.000.000 <span class="unit">đ</span>
											</div>
									</div>
									<div class="card-stars">
										<span> <i class="fas fa-star text-warning"></i></span> <span>
											<i class="fas fa-star text-warning"></i>
										</span> <span> <i class="fas fa-star text-warning"></i></span> <span>
											<i class="fas fa-star text-warning"></i>
										</span> <span> <i class="fas fa-star  text-dark"></i></span>
									</div>
								</div>
							</div>
						</div>
						<div class="col-4">
							<div class="card">
								<div class="card-img text-center">
									<a href="#"> <img src="image/img_phone/21.jpg" width="80%"
										class="" alt="..."></a>
								</div>
								<div class="card-content">
									<div class="card-title">
										<a href="#">Iphone 12 64 GBIphone 12 64 GBIphone 12 64 GB</a>
									</div>
									<div class="card-price">
										<span>
											<div class="card-count">
												19.990.000 <span class="unit">đ</span>
											</div>
											<div class="card-discount">
												23.000.000 <span class="unit">đ</span>
											</div>
									</div>
									<div class="card-stars">
										<span> <i class="fas fa-star text-warning"></i></span> <span>
											<i class="fas fa-star text-warning"></i>
										</span> <span> <i class="fas fa-star text-warning"></i></span> <span>
											<i class="fas fa-star text-warning"></i>
										</span> <span> <i class="fas fa-star  text-dark"></i></span>
									</div>
								</div>
							</div>
						</div>
						<div class="col-4">
							<div class="card">
								<div class="card-img text-center">
									<a href="#"> <img src="image/img_phone/22.jpg" width="80%"
										class="" alt="..."></a>
								</div>
								<div class="card-content">
									<div class="card-title">
										<a href="#">Iphone 12 64 GBIphone 12 64 GBIphone 12 64 GB</a>
									</div>
									<div class="card-price">
										<span>
											<div class="card-count">
												19.990.000 <span class="unit">đ</span>
											</div>
											<div class="card-discount">
												23.000.000 <span class="unit">đ</span>
											</div>
									</div>
									<div class="card-stars">
										<span> <i class="fas fa-star text-warning"></i></span> <span>
											<i class="fas fa-star text-warning"></i>
										</span> <span> <i class="fas fa-star text-warning"></i></span> <span>
											<i class="fas fa-star text-warning"></i>
										</span> <span> <i class="fas fa-star  text-dark"></i></span>
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>

				<!-- pagination -->
				<div class="row ">
					<div class="col-12 d-flex justify-content-end">
						<nav aria-label="...">
							<ul class="pagination">
								<li class="page-item disabled"><a class="page-link"
									href="#" tabindex="-1" aria-disabled="true">Trở về</a></li>
								<li class="page-item active"><a class="page-link" href="#">1</a></li>
								<li class="page-item " aria-current="page"><a
									class="page-link" href="#">2 </a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
								<li class="page-item"><a class="page-link" href="#">Tiếp</a>
								</li>
							</ul>
						</nav>
					</div>
				</div>



			</div>
		</div>
	</div>




	<!-- /.container -->



	<jsp:include page="/VIEW/jsp/jsp-component/footer.jsp"></jsp:include>
	<!-- Bootstrap core JavaScript -->



</body>

</html>