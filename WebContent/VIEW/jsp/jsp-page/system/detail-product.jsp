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
				<div class="frame-img">
					<div class="img-main">
						<div class="img-frame-main">
							<img id="img-main"
								src="https://cdn.tgdd.vn/Products/Images/42/217536/samsung-galaxy-m51-trang-new-600x600-600x600.jpg">
						</div>
					</div>
					<div class="img-slide" id="img-slide">
						<div class="img-container" id="img-container">
							<div class="img-card">
								<div class="cardi">
									<img id="img1" class="active"
										src="https://cdn.tgdd.vn/Products/Images/42/217536/samsung-galaxy-m51-trang-new-600x600-600x600.jpg">
								</div>
							</div>
							<div class="img-card">
								<div class="cardi">
									<img id="img2"
										src="https://cdn.tgdd.vn/Products/Images/42/217536/samsung-galaxy-m51-trang-3-org.jpg">
								</div>
							</div>
							<div class="img-card">
								<div class="cardi">
									<img id="img3"
										src="https://cdn.tgdd.vn/Products/Images/42/217536/samsung-galaxy-m51-trang-2-org.jpg">
								</div>
							</div>
							<div class="img-card">
								<div class="cardi">
									<img id="img4"
										src="https://cdn.tgdd.vn/Products/Images/42/217536/samsung-galaxy-m51-trang-4-org.jpg">
								</div>
							</div>
							<div class="img-card">
								<div class="cardi">
									<img id="img5"
										src="https://cdn.tgdd.vn/Products/Images/42/217536/samsung-galaxy-m51-trang-4-org.jpg">
								</div>
							</div>
							<div class="img-card">
								<div class="cardi">
									<img id="img5"
										src="https://cdn.tgdd.vn/Products/Images/42/217536/samsung-galaxy-m51-trang-4-org.jpg">
								</div>
							</div>
							<div class="img-card">
								<div class="cardi">
									<img id="img5"
										src="https://cdn.tgdd.vn/Products/Images/42/217536/samsung-galaxy-m51-trang-4-org.jpg">
								</div>
							</div>

						</div>
						<button id="pre" onclick="previouseSlide()" class="btn-previouse">
							<i class="fas fa-chevron-left"></i>
						</button>
						<button id="nex" onclick="nextSlide()" class="btn-next">
							<i class="fas fa-chevron-right"></i>
						</button>
					</div>
				</div>
				<script>
					var index = 1;
					var width = document.getElementById('img-container').offsetWidth - 480;
					var length = document.getElementsByClassName('img-card').length;
					var step = -120;
					var loc = 0;
					function translate_container(deg) {
						loc = deg;
						console.log(loc);
						if (deg == 0) {
							document.getElementById('img-slide').style.borderLeft = "2px solid #9e9e9e";
							document.getElementById('pre').style.display = "none";
							document.getElementById('nex').style.display = "block";
						} else if (deg == -width) {
							document.getElementById('img-slide').style.borderRight = "2px solid #9e9e9e";
							document.getElementById('nex').style.display = "none";
							document.getElementById('pre').style.display = "block";
						} else {
							document.getElementById('img-slide').style.borderLeft = "";
							document.getElementById('img-slide').style.borderRight = "";
							document.getElementById('nex').style.display = "block";
							document.getElementById('pre').style.display = "block";
						}

						document.getElementById('img-container').style.transform = "translateX("
								+ deg + "px)";
					}
					function setImg(n) {
						var img = document.getElementsByClassName('img-card');
						for (var i = 0; i < length; i++) {
							if (i + 1 == n) {
								var src = img[i]
										.getElementsByClassName('cardi')[0]
										.getElementsByTagName('img')[0];
								document.getElementById('img-main').src = src.src;
								src.className = "active";
							} else {
								img[i].getElementsByClassName('cardi')[0]
										.getElementsByTagName('img')[0].className = "";
							}
						}
					}

					translate_container(0);
					function nextSlide() {
						console.log(loc);
						translate_container(loc + step);

					}
					function previouseSlide() {
						console.log(loc);
						translate_container(loc - step);
					}
					function setClick() {
						var img = document.getElementsByClassName('cardi');
						var leg = img.length;
						for (var i = 0; i < leg; i++) {
							img[i].getElementsByTagName('img')[0].setAttribute(
									'onclick', "setImg(" + (i + 1) + ")");
						}
					}

					setClick();
				</script>
				<!-- /.row -->
			</div>

			<div class="col-md-5">
				<div class="" style="margin-bottom: 30px; margin-top: 15px">
					<h2 class="my-3 bg-price color-price d-inline mr-5">

						<fmt:formatNumber type="number" maxFractionDigits="3" value="" />
						10.000.000₫
					</h2>
					<h3 class="my-3 bg-price price d-inline" style="color: #3D3D3D;">
						<fmt:formatNumber type="number" maxFractionDigits="3" value="" />
						<strike style="color: #bbbbbb; font-size: 20px; font-weight: 400;">
							10.000.000 ₫</strike>
					</h3>

				</div>
				<div class="block">
					<p class=""
						style="font-size: 16px; font-style: normal; font-weight: 400;">Chọn
						màu ưa thích của bạn</p>

					<div class="row">
						<div class="frame-choose">
							<input type="radio" class="choose-color" name="color" id="xanh">
							<label class="color-card" for="xanh">
								<div class="frame-color">
								<div>
									<img
										src="https://cdn.tgdd.vn/Products/Images/42/217536/samsung-galaxy-m51-trang-4-org.jpg"></div>
									<div class="title">xanhxanhxanhxanh</div>
									<i class="fas fa-check"></i>
								</div>
							</label> <input type="radio" class="choose-color" name="color" id="do">
							<label class="color-card" for="do">
								<div class="frame-color">
									<img
										src="https://cdn.tgdd.vn/Products/Images/42/217536/samsung-galaxy-m51-trang-4-org.jpg">
									<div class="title">đỏ</div>
									<i class="fas fa-check"></i>
								</div>
							</label>

						</div>
						<div style="margin-top: 0px; margin-left: 10px;">
							<p class="block" style="font-size: 16px; font-weight: 400;">
								<span style="margin-right: 10px;">Thương hiệu:</span><a href="#">Samsung</a>
							</p>
							<p class="block" style="font-style: italic;
    font-size: 15px;
    font-weight: 400;">Đổi
								trả trong vòng 15 ngày đầu.</p>
								<p class="block" style="font-style: italic;
    font-size: 15px;
    font-weight: 400;">Bảo hành chính hãng 12 tháng.</p>
						</div>
					</div>
				</div>


				<div class="row" style="">
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