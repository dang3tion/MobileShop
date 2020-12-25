<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<meta charset="ISO-8859-1">
<jsp:include page="/VIEW/jsp/jsp-component/head-css.jsp" />

<c:url var="url" scope="session" value="/VIEW"></c:url>
<link rel="stylesheet" href="${url }/css/css-page/detail-product.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
<link rel='stylesheet prefetch'
	href='https://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css'>
</head>
<body>




	<!-- Page Menu -->
	<jsp:include page="/VIEW/jsp/jsp-component/menu.jsp"></jsp:include>
	<!-- Thanh menu loc du lieu va sap xep-->
	<c:import url="/VIEW/jsp/jsp-component/filter.jsp">
	</c:import>
	<!-- breadcumb -->
	<c:import url="/VIEW/jsp/jsp-component/breadcumb.jsp">

		<c:param name="title" value=""></c:param>
	</c:import>
	<!-- Page Content -->
	<div class="container" style="max-width: 90%;">



		<!-- Portfolio Item Heading -->
		<h4 class="my-4">
			<small>Điện thoại </small> ${product.name}
		</h4>

		<!-- Portfolio Item Row -->
		<div class="row">

			<div class=" col-md-7 ">
				<div class="row space-img">
					<c:forEach items="${product.colors}" var="i" begin="0" end="0">
						<img id="img" class="" src="${i.imgMain}" alt="">
					</c:forEach>
					<a class="carousel-control-prev indexP"
						href="#carouselExampleControls" role="button" data-slide="prev">
						<span id="pre" class="carousel-control-prev-icon"
						aria-hidden="true"></span> <span class="sr-only">Previous</span>
					</a> <a class="carousel-control-next indexN"
						href="#carouselExampleControls" role="button" data-slide="next">
						<span id="next" class="carousel-control-next-icon"
						aria-hidden="true"></span> <span class="sr-only">Next</span>
					</a>
				</div>

				<div class="row space-img1">
					<c:forEach items="${product.colors}" var="i" begin="0" end="0">
						<c:forEach items="${i.imgSubs}" var="c">
							<div class="col-md-2 col-sm-2 mb-2">
								<span onclick="change('../image/Product/i12black.png')">
									<img id="img1" class="img-fluid" src="${c}" alt="">
								</span>
							</div>


						</c:forEach>
					</c:forEach>
				</div>
				<!-- /.row -->
			</div>

			<div class="col-md-5">
				<div class="" style="margin-bottom: 30px; margin-top: 15px">
					<h2 class="my-3 bg-price color-price d-inline mr-5">
						<small style="color: black; font-weight: bold;">Giá: </small>
						<fmt:formatNumber type="number" maxFractionDigits="3" value="" />
						₫
					</h2>
					<h3 class="my-3 bg-price price d-inline" style="color: #3D3D3D;">
						<fmt:formatNumber type="number" maxFractionDigits="3" value="" />
						₫
					</h3>

				</div>
				<div class="block">
					<p class="" style="font-size: 20px; font-style: normal;">Chọn
						màu ưa thích của bạn</p>

					<div class="row">
						<form>
							<label for="btn1" id="label1"
								class="radio-inline space-radio text-center active"
								onclick="change('${url}/image/image-user/product/i12black.png')">
								<input id="btn1" type="radio" name="optradio" checked
								class="d-none"> <span class="font-color">Đen</span>
							</label> <label for="btn2" id="label2"
								class="radio-inline space-radio  text-center"
								onclick="change('${url}/image/image-user/product/i12blue.png')">
								<input id="btn2" type="radio" name="optradio" class="d-none">
								<span class="font-color">Xanh</span>
							</label>

						</form>

					</div>
					<div style="margin-top: 40px;">
						<p class="block">Bảo hành 12 tháng chính hãng.</p>
						<p class="block">Đổi trả trong vòng 15 ngày đầu.</p>
					</div>

				</div>
				<!-- <h4><strong>Khuyến mại</strong></h4>
            <div class="space-l">
              <ul class="ltsPromote">
                <li class="space-t"><i class="color-price fa fa-gift"></i>
                  <a href="">Máy mới 100% chính hãng Apple Việt Nam - Hoanghamobile nhà bán lẻ ủy quyền chính thức của
                    Apple tại Việt Nam</a>
                  </li>
                  <li class="space-t"><i class="color-price fa fa-gift"></i>
                    <a href="">Khuyến mại mua Tai nghe Apple AirPods 2 - Chính hãng VN/A - Case sạc thường (MV7N2VN/A) với
                      giá chỉ 3.350.000đ</a>
                    </li>
                    <li class="space-t"><i class="color-price fa fa-gift"></i>
                      <a href="">Thu cũ - Lên đời giảm ngay 1.000.000đ (trừ thẳng vào giá).</a>
                    </li>
                    <li class="space-t">
                      <i class="color-price fa fa-gift"></i>
                      <a href="">Khuyến mãi mua thêm Củ sạc 20W chính hãng với giá chỉ 490.000đ + Tai nghe Earpods lightning
                        chính hãng với giá chỉ 490.000đ</a>
                </li>
              </ul>
            </div> -->

				<div class="row">
					<div class="col-sm-7">
						<form action="${pageContext.request.contextPath}/cart"
							method="post">
							<input name="choose" value="add" hidden="true">
							<button name="id" value="${PRODUCT.id}" type="submit"
								class="btnMua btn btn-primary btn-lg btn-block">
								<i class="fas fa-cart-plus" style="color: white;"></i> THÊM VÀO
								GIỎ HÀNG
							</button>
						</form>
					</div>
					<div class="col-sm-5">
						<form action="${pageContext.request.contextPath}/cart"
							method="post">
							<input name="choose" value="add" hidden="true"> <input
								name="datHang" value="true" hidden="true">
							<button name="id" value="${PRODUCT.id}" type="submit"
								class="btnMua btn btn-danger btn-lg btn-block">
								<strong>ĐẶT HÀNG</strong>
							</button>
						</form>
					</div>
				</div>
			</div>

		</div>

	</div>
	<!-- /.row -->

	<!-- Related Projects Row -->


	</div>
	<!-- /.container -->
	<hr style="width: 80%;">

	<!--Information Product-->
	<div class="container">
		<!-- Content here -->
		<div class="row">
			<div class="col-sm-8">
				<div id="f-w" class="hegthTxt">
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
							data-toggle="modal" data-target="#exampleModalCenter"></button>

						<!-- Modal -->
						<div class="modal fade" id="exampleModalCenter" tabindex="-1"
							role="dialog" aria-labelledby="exampleModalCenterTitle"
							aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLongTitle">${message}</h5>
									</div>

									<div class="modal-footer">
										<a href="${pageContext.request.contextPath}/cart"
											class="btn btn-primary" role="button" aria-pressed="true">
											Vào giỏ hàng</a>
										<button type="button" class="btn btn-danger"
											data-dismiss="modal">Đóng</button>
									</div>
								</div>
							</div>
						</div>

					</c:if>
					<!-- @@@@@@@@@@ END HIỆN THÔNG BÁO KHI VƯỢT QUÁ GIỚI HẠN SẢN PHẨM TRONG GIỎ HÀNG @@@@@@@@@@@@@ -->
					<h3 class="center-txt">Đánh giá chi tiết ${PRODUCT.name}</h3>


					<div id="content" style="max-height: 50em; overflow: hidden;">
						${PRODUCT.content}</div>
					<div class="text-center">
						<button id="send1" onclick="ttOpen()"
							class="btn btn-primary btn-center" style="margin-top: 20px;">Xem
							thêm</button>
					</div>


					<div class="text-center">
						<button id="close" onclick="ttClose()"
							class="btn btn-primary btn-center" style="display: none;">Đóng</button>
					</div>
				</div>
			</div>
			<div class="col-sm-4">
				<h4>Thông số kĩ thuật</h4>
				<ul class="attribute">
					<c:forEach items="${product.attributes }" var="x" begin="0" end="5">
						<li class="item">
							<div class="title">
								<p>${x.name}</p>
							</div>
							<div class="value">
								<c:forEach items="${x.lstAtribute }" var="map" begin="0" end="0">
									<c:forEach items="${map.value }" var="att" begin="0" end="2">
									${att}<br>
									</c:forEach>
								</c:forEach>
							</div>
						</li>
					</c:forEach>

				</ul>
				<button class="show-detail" data-toggle="modal"
					data-target="#detail-attribute">Xem thêm chi tiết</button>
				<div class="modal fade" id="detail-attribute" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalCenterTitle"
					aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered" role="document"
						style="min-width: 60%">
						<div class="modal-content modal-attribute">
							<div class="modal-header" style="text-align: center;">
								<h5 class="modal-title" id="exampleModalLongTitle"
									style="font-size: 20px; padding-left: 20px; font-size: 21px;">Thông
									số kỹ thuật</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">×</span>
								</button>
							</div>
							<div class="modal-body" style="padding-bottom: 0px">
								<c:forEach items="${product.attributes}" var="i">
									<ul class="modal-attribute">
										<div class="title-attribute">${i.name}</div>
										<c:forEach items="${i.lstAtribute}" var="att">
											<li class="item">
												<div class="title">${att.key}</div>
												<div class="value">
													<c:forEach items="${att.value}" var="va">
														<p>${va}</p>
													</c:forEach>
												</div>

											</li>
										</c:forEach>

									</ul>
								</c:forEach>

							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Đóng</button>

							</div>
						</div>
					</div>
				</div>


			</div>

		</div>
		<hr width="80%">
		<!--/information product-->

		<!--evualuate-->

		<div style="width: 80%;" class="container evalueH">
			<h3 style="font-size: 1.5em;" class="text-center">Đánh giá, bình
				luận sản phẩm</h3>

			<div class="row reviews_detail">

				<div class="diem  col-md-3 text-center">
					<h3 style="font-size: 1.2em; margin-top: 10%;">Sao trung bình</h3>
					<p class="averageRatings">
						${star.avg} <i class="fa fa-star checked" style="font-size: 30px"></i>
					</p>
				</div>
				<div class="diem text-center col-md-6">
					<div>
						<div class="side row mt-3">
							<div class="col-sm-2">
								5 <i class="fa fa-star checked pp"></i>
							</div>
							<div class="col-sm-6">
								<div class="progress space-t5">
									<div class="progress-bar bg-warning" role="progressbar"
										style="width: ${star.percent5}%" aria-valuenow="75"
										aria-valuemin="0" aria-valuemax="100"></div>
								</div>
							</div>
							<div class="col-sm-4">
								<p>${star.star5}đánhgiá</p>
							</div>
						</div>
						<div style="margin-top: -15px;" class="side row">
							<div class="col-sm-2">
								4 <i class="fa fa-star checked"></i>
							</div>
							<div class="col-sm-6">
								<div class="progress space-t5">
									<div class="progress-bar bg-warning" role="progressbar"
										style="width: ${star.percent4}%" aria-valuenow="75"
										aria-valuemin="0" aria-valuemax="100"></div>
								</div>
							</div>
							<div class="col-sm-4">
								<p>${star.star4}đánhgiá</p>
							</div>
						</div>
						<div style="margin-top: -15px;" class="side row">
							<div class="col-sm-2">
								3 <i class="fa fa-star checked"></i>
							</div>
							<div class="col-sm-6">
								<div class="progress space-t5">
									<div class="progress-bar bg-warning" role="progressbar"
										style="width: ${star.percent3}%" aria-valuenow="75"
										aria-valuemin="0" aria-valuemax="100"></div>
								</div>
							</div>
							<div class="col-sm-4">
								<p>${star.star3}đánhgiá</p>
							</div>
						</div>
						<div style="margin-top: -15px;" class="side row">
							<div class="col-sm-2">
								2 <i class="fa fa-star checked"></i>
							</div>
							<div class="col-sm-6">
								<div class="progress space-t5">
									<div class="progress-bar bg-warning" role="progressbar"
										style="width: ${star.percent2}%" aria-valuenow="75"
										aria-valuemin="0" aria-valuemax="100"></div>
								</div>
							</div>
							<div class="col-sm-4">
								<p>${star.star2}đánhgiá</p>
							</div>
						</div>
						<div style="margin-top: -15px;" class="side row">
							<div class="col-sm-2">
								1 <i class="fa fa-star checked"></i>
							</div>
							<div class="col-sm-6">
								<div class="progress space-t5">
									<div class="progress-bar bg-warning" role="progressbar"
										style="width: ${star.percent1}%" aria-valuenow="75"
										aria-valuemin="0" aria-valuemax="100"></div>
								</div>
							</div>
							<div class="col-sm-4">
								<p>${star.star1}đánhgiá</p>
							</div>
						</div>
					</div>
				</div>

				<div class="danhgia text-center col-md-3">

					<h5>Vui lòng chọn đánh giá</h5>

					<div class="stars row">
						<form action="">
							<div class="col-12">
								<div class="align-star">
									<input class="star star-5" id="star-5" type="radio" name="star" />
									<label class="star star-5" for="star-5"></label> <input
										class="star star-4" id="star-4" type="radio" name="star" /> <label
										class="star star-4" for="star-4"></label> <input
										class="star star-3" id="star-3" type="radio" name="star" /> <label
										class="star star-3" for="star-3"></label> <input
										class="star star-2" id="star-2" type="radio" name="star" /> <label
										class="star star-2" for="star-2"></label> <input
										class="star star-1" id="star-1" type="radio" name="star" /> <label
										class="star star-1" for="star-1"></label>
								</div>
							</div>
						</form>
					</div>
					<button type="submit" class="btn btn-danger guiDanhGia">Đánh
						giá của bạn</button>
				</div>
			</div>

		</div>


		<!--end evualuate-->
		<hr width="80%">
		<!--Comment-->

		<div class="col-lg-10 col-sm-10 mb-10" style="margin: auto;">
			<h4 class="text-center">Bình luận</h4>
			<div
				class="fb-comments fb_iframe_widget fb_iframe_widget_fluid_desktop"
				data-href="http://localhost:8080/MobileShop/product-detail?id=sp1"
				data-numposts="20" data-width="900" data-mobile="Auto-detected"
				fb-xfbml-state="rendered"
				fb-iframe-plugin-query="app_id=&amp;container_width=1108&amp;height=100&amp;href=http://localhost:8080/MobileShop/product-detail?id=sp1"
				style="width: 100%;">
				<span style="vertical-align: bottom; width: 100%; height: 508px;">
					<iframe name="f42318e5e4d28c" width="1000px" height="100px"
						data-testid="fb:comments Facebook Social Plugin"
						title="fb:comments Facebook Social Plugin" frameborder="0"
						allowtransparency="true" allowfullscreen="true" scrolling="yes"
						allow="encrypted-media"
						src="https://www.facebook.com/v7.0/plugins/comments.php?app_id=&amp;channel=https%3A%2F%2Fstaticxx.facebook.com%2Fx%2Fconnect%2Fxd_arbiter%2F%3Fversion%3D46%23cb%3Df16d35e09c52114%26domain%3Dgroup01-tintucbatdongsan.tk%26origin%3Dhttps%253A%252F%252Fgroup01-tintucbatdongsan.tk%252Ff1350c038078a8c%26relation%3Dparent.parent&amp;container_width=1108&amp;height=100&amp;href=http%3A%2F%2Flocalhost%3A3000%2FThanh-pho-phia-dong-tpHCM&amp;locale=en_GB&amp;mobile=false&amp;numposts=10&amp;sdk=joey&amp;version=v7.0&amp;width="
						style="border: none; visibility: visible; width: 100%; height: 250px; overflow: scroll;"
						class=""></iframe>
				</span>
			</div>
		</div>



	</div>

	<!-- Page Footer -->
	<jsp:include page="/VIEW/jsp/jsp-component/footer.jsp"></jsp:include>
</body>

<script>
	function ttOpen() {
		var tt = document.getElementById('send1');

		tt.style.display = 'none';
		document.getElementById('close').style.display = 'block';
		document.getElementById('content').style.maxHeight = '100%';
	}
	function ttClose() {
		document.getElementById('close').style.display = 'none';
		document.getElementById('send1').style.display = 'block';
		document.getElementById('content').style.maxHeight = '50em';
	}
</script>
<script src="${url }/js/js-page/slide-product.js"></script>

<script src="${url }/js/js-static/cart.js"></script>
</html>