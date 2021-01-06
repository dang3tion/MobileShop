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
<%@page import="model_DAO.DAO_IconMenu"%>
<%
	DAO_IconMenu dao = new DAO_IconMenu();
request.setAttribute("color", dao.colorWeb());
%>
<body
	style="color: ${color.colorText};background-color: ${color.colorBody}">
	<%
		request.setCharacterEncoding("UTF-8");
	%>


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
			<%-- 			<c:forEach items="${map }" var="i"> --%>
			<%-- 				<c:forEach items="${i.value}" var="j"> --%>
			<%-- 					<h5>Sản phẩm: ${i.key }, Màu sắc: ${j.key},Số lượng: ${j.value }</h5> --%>

			<%-- 				</c:forEach> --%>



			<%-- 			</c:forEach> --%>
		</h4>

		<!-- Portfolio Item Row -->
		<div class="row">

			<div class=" col-md-7 ">
				<c:forEach items="${product.colors }" var="col">
					<div class="frame-img">
						<div class="img-main">
							<div class="img-frame-main">
								<img class="img-main" src="${col.imgMain}">
							</div>
						</div>

						<div class="img-slide" id="img-slide">
							<div class="img-container" id="img-container">
								<div class="img-card">
									<div class="cardi">
										<img id="img1" class="active" src="${col.imgMain}">
									</div>
								</div>
								<c:forEach items="${col.imgSubs}" var="img">
									<div class="img-card">
										<div class="cardi">
											<img id="img1" src="${img}">
										</div>
									</div>

								</c:forEach>
							</div>
							<button id="pre" onclick="previouseSlide()" class="btn-previouse">
								<i class="fas fa-chevron-left"></i>
							</button>
							<button id="nex" onclick="nextSlide()" class="btn-next">
								<i class="fas fa-chevron-right"></i>
							</button>
						</div>
					</div>
				</c:forEach>
				<!-- 				<div class="frame-img"> -->
				<!-- 					<div class="img-main"> -->
				<!-- 						<div class="img-frame-main"> -->
				<!-- 							<img class="img-main" -->
				<!-- 								src="https://cdn.tgdd.vn/Products/Images/42/217536/samsung-galaxy-m51-den-new-600x600-600x600.jpg"> -->
				<!-- 						</div> -->
				<!-- 					</div> -->
				<!-- 					<div class="img-slide" id="img-slide"> -->
				<!-- 						<div class="img-container" id="img-container"> -->
				<!-- 							<div class="img-card"> -->
				<!-- 								<div class="cardi"> -->
				<!-- 									<img id="img1" class="active" -->
				<!-- 										src="https://cdn.tgdd.vn/Products/Images/42/217536/samsung-galaxy-m51-den-new-600x600-600x600.jpg"> -->
				<!-- 								</div> -->
				<!-- 							</div> -->
				<!-- 							<div class="img-card"> -->
				<!-- 								<div class="cardi"> -->
				<!-- 									<img id="img2" -->
				<!-- 										src="https://cdn.tgdd.vn/Products/Images/42/217536/samsung-galaxy-m51-den-3-org.jpg"> -->
				<!-- 								</div> -->
				<!-- 							</div> -->
				<!-- 							<div class="img-card"> -->
				<!-- 								<div class="cardi"> -->
				<!-- 									<img id="img3" -->
				<!-- 										src="https://cdn.tgdd.vn/Products/Images/42/217536/samsung-galaxy-m51-trang-2-org.jpg"> -->
				<!-- 								</div> -->
				<!-- 							</div> -->
				<!-- 							<div class="img-card"> -->
				<!-- 								<div class="cardi"> -->
				<!-- 									<img id="img4" -->
				<!-- 										src="https://cdn.tgdd.vn/Products/Images/42/217536/samsung-galaxy-m51-trang-4-org.jpg"> -->
				<!-- 								</div> -->
				<!-- 							</div> -->
				<!-- 							<div class="img-card"> -->
				<!-- 								<div class="cardi"> -->
				<!-- 									<img id="img5" -->
				<!-- 										src="https://cdn.tgdd.vn/Products/Images/42/217536/samsung-galaxy-m51-trang-4-org.jpg"> -->
				<!-- 								</div> -->
				<!-- 							</div> -->
				<!-- 							<div class="img-card"> -->
				<!-- 								<div class="cardi"> -->
				<!-- 									<img id="img5" -->
				<!-- 										src="https://cdn.tgdd.vn/Products/Images/42/217536/samsung-galaxy-m51-trang-4-org.jpg"> -->
				<!-- 								</div> -->
				<!-- 							</div> -->
				<!-- 							<div class="img-card"> -->
				<!-- 								<div class="cardi"> -->
				<!-- 									<img id="img5" -->
				<!-- 										src="https://cdn.tgdd.vn/Products/Images/42/217536/samsung-galaxy-m51-trang-4-org.jpg"> -->
				<!-- 								</div> -->
				<!-- 							</div> -->

				<!-- 						</div> -->
				<!-- 						<button id="pre" onclick="previouseSlide()" class="btn-previouse"> -->
				<!-- 							<i class="fas fa-chevron-left"></i> -->
				<!-- 						</button> -->
				<!-- 						<button id="nex" onclick="nextSlide()" class="btn-next"> -->
				<!-- 							<i class="fas fa-chevron-right"></i> -->
				<!-- 						</button> -->
				<!-- 					</div> -->
				<!-- 				</div> -->
				<script>
					var index = 0;

					var width = document.getElementsByClassName("frame-img")[index]
							.getElementsByClassName('img-container')[0].offsetWidth - 480;
					var length = document.getElementsByClassName("frame-img")[index]
							.getElementsByClassName('img-card').length;
					var step = -120;
					var loc = 0;
					function translate_container(deg) {
						loc = deg;

						if (deg == 0) {
							document.getElementsByClassName("frame-img")[index]
									.getElementsByClassName('img-slide')[0].style.borderLeft = "2px solid #9e9e9e";
							document.getElementsByClassName("frame-img")[index]
									.getElementsByClassName('btn-previouse')[0].style.display = "none";
							document.getElementsByClassName("frame-img")[index]
									.getElementsByClassName('btn-next')[0].style.display = "block";
						} else if (deg == -width) {
							document.getElementsByClassName("frame-img")[index]
									.getElementsByClassName('img-slide')[0].style.borderRight = "2px solid #9e9e9e";
							document.getElementsByClassName("frame-img")[index]
									.getElementsByClassName('btn-next')[0].style.display = "none";
							document.getElementsByClassName("frame-img")[index]
									.getElementsByClassName('btn-previouse')[0].style.display = "block";
						} else {
							document.getElementsByClassName("frame-img")[index]
									.getElementsByClassName('img-slide')[0].style.borderLeft = "";
							document.getElementsByClassName("frame-img")[index]
									.getElementsByClassName('img-slide')[0].style.borderRight = "";
							document.getElementsByClassName("frame-img")[index]
									.getElementsByClassName('btn-next')[0].style.display = "block";
							document.getElementsByClassName("frame-img")[index]
									.getElementsByClassName('btn-previouse')[0].style.display = "block";
						}

						document.getElementsByClassName("frame-img")[index]
								.getElementsByClassName('img-container')[0].style.transform = "translateX("
								+ deg + "px)";
					}
					function setImg(n) {
						var img = document.getElementsByClassName("frame-img")[index]
								.getElementsByClassName('img-card');
						for (var i = 0; i < length; i++) {
							if (i + 1 == n) {
								var src = img[i]
										.getElementsByClassName('cardi')[0]
										.getElementsByTagName('img')[0];
								document.getElementsByClassName("frame-img")[index]
										.getElementsByClassName('img-main')[0]
										.getElementsByTagName('img')[0].src = src.src;
								src.className = "active";
							} else {
								img[i].getElementsByClassName('cardi')[0]
										.getElementsByTagName('img')[0].className = "";

							}
						}
					}

					translate_container(0);
					function nextSlide() {
						translate_container(loc + step);

					}
					function previouseSlide() {
						translate_container(loc - step);
					}
					function setClick() {
						var img = document.getElementsByClassName("frame-img")[index]
								.getElementsByClassName('cardi');
						var leg = img.length;
						for (var i = 0; i < leg; i++) {
							img[i].getElementsByTagName('img')[0].setAttribute(
									'onclick', "setImg(" + (i + 1) + ")");
						}
					}

					setClick();
					translate_container(0);
					function setIndex(n) {
						index = n;
						setClick();
						translate_container(0);
					}
				</script>
				<!-- /.row -->
			</div>

			<div class="col-md-5">
				<div class="" style="margin-bottom: 30px; margin-top: 15px">
					<h2 class="my-3 bg-price color-price d-inline mr-5">

						<fmt:formatNumber type="number" maxFractionDigits="3"
							value="${product.prices.price}" />
						₫
					</h2>
					<h3 class="my-3 bg-price price d-inline" style="color: #3D3D3D;">
						<c:if test="${product.prices.priceSales!=0}">
							<fmt:formatNumber type="number" maxFractionDigits="3"
								value="${product.prices.priceSales}" />

							<strike
								style="color: #bbbbbb; font-size: 20px; font-weight: 400;">

								₫</strike>
						</c:if>
					</h3>

				</div>
				<div class="block">
					<p class=""
						style="font-size: 16px; font-style: normal; font-weight: 400;">Chọn
						màu ưa thích của bạn</p>

					<div class="row">
						<div class="frame-choose">
							<c:forEach items="${product.colors }" var="col" begin="0" end="0">

								<input type="radio" class="choose-color" onclick="chooseColor()"
									checked id="${col.id }" name="color">
								<label class="color-card" for="${col.id }">
									<div class="frame-color">
										<div
											style="width: fit-content; margin: auto; position: relative;">
											<img src="${col.imgMain}"> <i class="fas fa-check"></i>
										</div>
										<div class="title">${col.name}</div>

									</div>
								</label>

							</c:forEach>
							<c:forEach items="${product.colors }" var="col" begin="1">

								<input type="radio" class="choose-color" onclick="chooseColor()"
									 id="${col.id }" name="color">
								<label class="color-card" for="${col.id }">
									<div class="frame-color">
										<div
											style="width: fit-content; margin: auto; position: relative;">
											<img src="${col.imgMain}"> <i class="fas fa-check"></i>
										</div>
										<div class="title">${col.name}</div>

									</div>
								</label>

							</c:forEach>
							<!-- 							<input type="radio" id="MS02" class="choose-color" -->
							<!-- 								onclick="chooseColor()" name="color"> <label -->
							<!-- 								class="color-card" for="MS02"> -->
							<!-- 								<div class="frame-color"> -->
							<!-- 									<div -->
							<!-- 										style="width: fit-content; margin: auto; position: relative;"> -->
							<!-- 										<img -->
							<!-- 											src="https://cdn.tgdd.vn/Products/Images/42/217536/samsung-galaxy-m51-trang-4-org.jpg"> -->
							<!-- 										<i class="fas fa-check"></i> -->
							<!-- 									</div> -->
							<!-- 									<div class="title">đỏ</div> -->

							<!-- 								</div> -->
							<!-- 							</label> -->

						</div>
						<div style="margin-top: 0px; margin-left: 10px;">
							<p class="block" style="font-size: 16px; font-weight: 400;">
								<span style="margin-right: 10px;">Thương hiệu:</span><a href="#">${product.branch.name }</a>
							</p>
							<p class="block"
								style="font-style: italic; font-size: 15px; font-weight: 400;">Đổi
								trả trong vòng 15 ngày đầu.</p>
							<p class="block"
								style="font-style: italic; font-size: 15px; font-weight: 400;">Bảo
								hành chính hãng 12 tháng.</p>
						</div>
					</div>
				</div>
				<script>
					function chooseColor() {
						var btn = document
								.getElementsByClassName("choose-color");
						var length = btn.length;
						var colors = document
								.getElementsByClassName("frame-img");
						for (var i = 0; i < length; i++) {
							var check = btn[i].checked;
							if (check == true) {
								colors[i].style.display = "block";
								console.log("adwsd");
								setIndex(i);
							} else {
								colors[i].style.display = "none";
							}
						}

					}
					chooseColor();
				</script>

				<div class="row" style="">
					<div class="col-sm-7">
						<form action="${pageContext.request.contextPath}/cart"
							method="post">
							<input name="choose" value="add" hidden="true"> <input
								name="color" id="color-input" value="" hidden="true">
							<button name="id" onclick="addCart()" value="${PRODUCT.id}"
								type="submit" class="btnMua btn btn-primary btn-lg btn-block">
								<i class="fas fa-cart-plus" style="color: white;"></i> THÊM VÀO
								GIỎ HÀNG
							</button>
						</form>
					</div>
					<script>
						function addCart() {
							var btn = document
									.getElementsByClassName("choose-color");
							var length = btn.length;
							for (var i = 0; i < length; i++) {
								var check = btn[i].checked;
								if (check == true) {
									document.getElementById('color-input').value = btn[i].id;
								}
							}
						}
					</script>

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
							class="btn btn-primary btn-center"
							style="margin-top: 20px; box-shadow: -1px 2px 4px 0px #3a3a3a;">Xem
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
		<div class="evaluate-frame">
			<div class="row">
				<div class="col-3" style="box-shadow: 4px 0px 5px -5px #767676;">
					<div class="avg-star">
						<span>3</span><i class="fas fa-star"></i>
					</div>
				</div>
				<div class="col-5" style="box-shadow: 4px 0px 5px -5px #767676;">
					<ul class="star-evaluate">
						<li><span class="star">5<i class="fas fa-star"></i></span>
							<div class="progress">
								<div class="progress-bar" style="width: 25%" role="progressbar"
									aria-valuenow="25
									aria-valuemin="
									25" aria-valuemax="100"></div>
							</div> <span class="title">3 </span>đánh giá</li>
						<li><span class="star">5<i class="fas fa-star"></i></span>
							<div class="progress">
								<div class="progress-bar" role="progressbar" aria-valuenow="0"
									aria-valuemin="25" aria-valuemax="100"></div>
							</div> <span class="title">3 </span>đánh giá</li>
						<li><span class="star">5<i class="fas fa-star"></i></span>
							<div class="progress">
								<div class="progress-bar" role="progressbar" aria-valuenow="0"
									aria-valuemin="25" aria-valuemax="100"></div>
							</div> <span class="title">3</span> đánh giá</li>
						<li><span class="star">5<i class="fas fa-star"></i></span>
							<div class="progress">
								<div class="progress-bar" role="progressbar" aria-valuenow="0"
									aria-valuemin="25" aria-valuemax="100"></div>
							</div> <span class="title">3 </span>đánh giá</li>
						<li><span class="star">5<i class="fas fa-star"></i></span>
							<div class="progress">
								<div class="progress-bar" role="progressbar" aria-valuenow="0"
									aria-valuemin="25" aria-valuemax="100"></div>
							</div> <span class="title">3 </span>đánh giá</li>
					</ul>
				</div>
				<div class="col-4">
					<div class="btn-evaluate">

						<c:if test="${CUSTOMER_LOGINED != null}">
							<button onclick="clickSend()" id="showup-btn">Gửi đánh
								giá của bạn</button>
						</c:if>
					</div>
				</div>
				<div id="showup-evaluate" style="display: none;">
					<div class="col-12" style="margin: 20px 30px;">
						<div class="evaluate">
							<span>Chọn đánh giá của bạn</span>

							<ul class="evaluating-star" id="star-evaluate">
								<li><i onmouseover="hoverStar(0)" onmouseout="checkValue()"
									onclick="getValue(1)" class="fas fa-star"></i></li>
								<li><i onmouseover="hoverStar(1)" onmouseout="checkValue()"
									onclick="getValue(2)" class="fas fa-star"></i></li>
								<li><i onmouseover="hoverStar(2)" onmouseout="checkValue()"
									onclick="getValue(3)" class="fas fa-star"></i></li>
								<li><i onmouseover="hoverStar(3)" onmouseout="checkValue()"
									onclick="getValue(4)" class="fas fa-star"></i></li>
								<li><i onmouseover="hoverStar(4)" onmouseout="checkValue()"
									onclick="getValue(5)" class="fas fa-star"></i></li>
							</ul>
							<div id="score-star" style="display: none;"></div>
							<div class="detail-star">
								<i class="fas fa-caret-left"></i><span id="capture">Tuyệt
									vời quá</span>
							</div>
						</div>
					</div>
					<div class="col-12" id="send-evaluate"
						style="margin-left: 30px; display: flex;">
						<div class="input-evaluate">
							<textarea placeholder="Mời bạn nhập nội dung đánh giá"></textarea>

						</div>

						<div class="btn-send">
							<button>Gửi đánh giá</button>
						</div>
					</div>
				</div>
			</div>

		</div>
		<div class="content-evaluate-frame">
			<div class="header">Đánh giá của khách hàng</div>
			<div class="stick"></div>
			<div class="content-evaluate">
				<div class="title">
					<span class="name-title" style="float: left;">Thanh Bảo</span>
					<ul class="evaluating-star">
						<li><i class="fas fa-star"></i></li>
						<li><i class="fas fa-star"></i></li>
						<li><i class="fas fa-star"></i></li>
						<li><i class="fas fa-star"></i></li>
						<li><i class="fas fa-star"></i></li>
					</ul>
					<div class="confirm">
						<i class="far fa-check-circle"></i> Xác nhận đã mua hàng
						<div class="confirm-content">
							<p>MobileShop xác nhận :</p>
							<p>
								<span><i class="far fa-user"></i></span>Khách hàng <span
									class="var-title">Thanh Bảo</span>
							</p>
							<p>
								<span><i class="fas fa-location-arrow"></i></span>Mua online
								trên website Thegioididong.com
							</p>
							<p>
								<span><i class="far fa-clock"></i></span>Mua <span
									class="var-title">2 tháng</span> trước
							</p>
						</div>
					</div>
				</div>

				<div class="content">

					<p>Máy tốt nhưng mới mua gặp hiện tượng kết nối wifi không đc
						hay do lỗi của ổ wifi</p>
				</div>
			</div>
			<div class="content-evaluate">
				<div class="title">
					<span class="name-title" style="float: left;">Thanh Bảo</span>
					<ul class="evaluating-star">
						<li><i class="fas fa-star"></i></li>
						<li><i class="fas fa-star"></i></li>
						<li><i class="fas fa-star"></i></li>
						<li><i class="fas fa-star"></i></li>
						<li><i class="fas fa-star"></i></li>
					</ul>
					<div class="confirm">
						<i class="far fa-check-circle"></i> Xác nhận đã mua hàng
						<div class="confirm-content">
							<p>MobileShop xác nhận :</p>
							<p>
								<span><i class="far fa-user"></i></span>Khách hàng <span
									class="var-title">Thanh Bảo</span>
							</p>
							<p>
								<span><i class="fas fa-location-arrow"></i></span>Mua online
								trên website Thegioididong.com
							</p>
							<p>
								<span><i class="far fa-clock"></i></span>Mua <span
									class="var-title">2 tháng</span> trước
							</p>
						</div>
					</div>
				</div>

				<div class="content">

					<p>Máy tốt nhưng mới mua gặp hiện tượng kết nối wifi không đc
						hay do lỗi của ổ wifi</p>
				</div>
			</div>
		</div>
		<div class="frame-border-comment">
			<div class="comment-frame row">
				<div class="header">Thảo luận về sản phẩm</div>
				<div class="stick"></div>
				<div class="col-12">
					<div class="create-cmt">
						<div style="display: flex; width: 70%;">
							<input type="text" placeholder="Nhập tên của bạn"
								class="name input-cmt">
							<!-- 								 <input type="text" -->
							<!-- 								placeholder="Nhập email của bạn" class="email input-cmt"> -->
						</div>
						<div class="col-12" id="send-cmt" style="">
							<div class="input-evaluate">
								<textarea placeholder="Nội dung bình luận"></textarea>

							</div>

							<div class="btn-cmt">
								<button>Gửi bình luận</button>
							</div>
						</div>
					</div>
					<div class="comment">
						<div class="comment-title">
							<span class="ico-user">B</span> <span class="name-title">Thanh
								Bảo</span>
						</div>
						<div class="comment-content">
							<p>Mình dùng bằng lái và cmnd mua trả góp 1 chiếc đt a21s rồi
								. Bgio có thể dùng 2 loại giấy tờ đó mua trả góp laptop dc k vậy
								. Mình chưa có hộ khẩu . Xin cảm ơn</p>
						</div>
						<div class="respone-cmt">
							<button class="respone-btn">
								<i class="fas fa-reply" style="margin-right: 5px;"></i>Trả lời
							</button>
							<span class="cmt-time">- 5 ngày trước</span>
						</div>
						<ul class="respone">
							<li>
								<div class="comment-title">
									<span class="ico-user">B</span> <span class="name-title">Thanh
										Bảo</span>
								</div>
								<div class="comment-content">
									<p>Mình dùng bằng lái và cmnd mua trả góp 1 chiếc đt a21s
										rồi . Bgio có thể dùng 2 loại giấy tờ đó mua trả góp laptop dc
										k vậy . Mình chưa có hộ khẩu . Xin cảm ơn</p>
								</div>
								<div class="respone-cmt">
									<button class="respone-btn">
										<i class="fas fa-reply" style="margin-right: 5px;"></i>Trả lời
									</button>
									<span class="cmt-time">- 5 ngày trước</span>
								</div>
							</li>
							<li>
								<div class="comment-title">
									<span class="ico-user">B</span> <span class="name-title">Thanh
										Bảo</span>
								</div>
								<div class="comment-content">
									<p>Mình dùng bằng lái và cmnd mua trả góp 1 chiếc đt a21s
										rồi . Bgio có thể dùng 2 loại giấy tờ đó mua trả góp laptop dc
										k vậy . Mình chưa có hộ khẩu . Xin cảm ơn</p>
								</div>
								<div class="respone-cmt">
									<button class="respone-btn">
										<i class="fas fa-reply" style="margin-right: 5px;"></i>Trả lời
									</button>
									<span class="cmt-time">- 4 ngày trước</span>
								</div>
							</li>
						</ul>
					</div>
					<div class="comment">
						<div class="comment-title">
							<span class="ico-user">B</span> <span class="name-title">Thanh
								Bảo</span>
						</div>
						<div class="comment-content">
							<p>Mình dùng bằng lái và cmnd mua trả góp 1 chiếc đt a21s rồi
								. Bgio có thể dùng 2 loại giấy tờ đó mua trả góp laptop dc k vậy
								. Mình chưa có hộ khẩu . Xin cảm ơn</p>
						</div>
						<div class="respone-cmt">
							<button class="respone-btn">
								<i class="fas fa-reply" style="margin-right: 5px;"></i>Trả lời
							</button>
							<span class="cmt-time">- 5 ngày trước</span>
						</div>
						<ul class="respone">
							<li>
								<div class="comment-title">
									<span class="ico-user">B</span> <span class="name-title">Thanh
										Bảo</span>
								</div>
								<div class="comment-content">
									<p>Mình dùng bằng lái và cmnd mua trả góp 1 chiếc đt a21s
										rồi . Bgio có thể dùng 2 loại giấy tờ đó mua trả góp laptop dc
										k vậy . Mình chưa có hộ khẩu . Xin cảm ơn</p>
								</div>
								<div class="respone-cmt">
									<button class="respone-btn">
										<i class="fas fa-reply" style="margin-right: 5px;"></i>Trả lời
									</button>
									<span class="cmt-time">- 5 ngày trước</span>
								</div>
							</li>
							<li>
								<div class="comment-title">
									<span class="ico-user">B</span> <span class="name-title">Thanh
										Bảo</span>
								</div>
								<div class="comment-content">
									<p>Mình dùng bằng lái và cmnd mua trả góp 1 chiếc đt a21s
										rồi . Bgio có thể dùng 2 loại giấy tờ đó mua trả góp laptop dc
										k vậy . Mình chưa có hộ khẩu . Xin cảm ơn</p>
								</div>
								<div class="respone-cmt">
									<button class="respone-btn">
										<i class="fas fa-reply" style="margin-right: 5px;"></i>Trả lời
									</button>
									<span class="cmt-time">- 4 ngày trước</span>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Page Footer -->
	<jsp:include page="/VIEW/jsp/jsp-component/footer.jsp"></jsp:include>
</body>
<script charset="UTF-8">
	var value = 0;
	function hoverStar(n) {
		var stars = document.getElementById("star-evaluate")
				.getElementsByClassName("fa-star");
		console.log(stars.length);
		cap(n);
		for (let i = 0; i < stars.length; i++) {
			var el = stars[i];
			if (n == i) {
				for (let j = 0; j <= n; j++) {
					stars[j].style.color = "#FFC107";
				}
			} else {
				stars[i].style.color = "#bbbbbb";
			}
		}
	}
	function checkValue() {
		var stars = document.getElementById("star-evaluate")
				.getElementsByClassName("fa-star");
		cap(value - 1);
		for (let i = 0; i < stars.length; i++) {
			if (i + 1 == value) {
				for (let j = 0; j <= i; j++) {
					stars[j].style.color = "#FFC107";
				}
			} else {
				stars[i].style.color = "#bbbbbb";
			}
		}
	}
	function getValue(n) {
		value = n;
		document.getElementById("score-star").innerHTML = value;
	}
	function cap(n) {
		var x = document.getElementById("capture");
		if (n == 0) {
			x.innerHTML = "Quá tệ";
		}
		if (n == 1) {
			x.innerHTML = "Tạm được";
		}
		if (n == 2) {
			x.innerHTML = "Tốt";
		}
		if (n == 3) {
			x.innerHTML = "Quá tốt";
		}
		if (n == 4) {
			x.innerHTML = "Tuyệt vời";
		}
	}
	function clickSend() {
		var s = document.getElementById('showup-btn').innerHTML;
		if (s != 'Đóng lại') {
			document.getElementById('showup-evaluate').style.display = 'block';
			document.getElementById('showup-btn').innerHTML = 'Đóng lại';
		} else {
			document.getElementById('showup-evaluate').style.display = 'none';
			document.getElementById('showup-btn').innerHTML = 'Gửi đánh giá của bạn';
		}
	}
</script>
<script src="${url }/js/js-page/slide-product.js"></script>
<script src="${url }/js/js-page/comment.js" charset="utf-8"></script>
<script src="${url }/js/js-static/cart.js"></script>

</html>