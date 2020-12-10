<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%-- <%@ page import="model_utility.Const"%> --%>
<!-- Thanh navigation Bar cho khach hang -->
<nav class="navbar navbar-expand-lg navbar-dark bg-menu fixed-top">
	<div class="container">
		<a class="navbar-brand" href="${pageContext.request.contextPath}/index"><i
			class="fas fa-mobile-alt"></i> ${SHOPINFO.name}</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarResponsive" aria-controls="navbarResponsive"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="input-group md-form form-sm form-2 pl-5 pr-5">
			<input class="form-control my-0 py-1 lime-border" type="text"
				placeholder="Bạn tìm gì..." aria-label="Search">
			<div class="input-group-append">
				<span class="input-group-text lime lighten-2" id="basic-text1">
					<a href="result_Page/result-searching.html"><i
						class="fas fa-search text-grey" aria-hidden="true"></i></a>
				</span>
			</div>
		</div>

		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ml-auto pt-3">
				<li class="nav-item "><a
					href="${pageContext.request.contextPath}/contact">
						<div class="item-menu">

							<i class="fas fa-phone-square-alt"></i>
							<div class="item-menu-text">
								<p>Liên hệ & Hỗ trợ</p>

							</div>

						</div>
				</a></li>
				<li class="nav-item"><a
					href="${pageContext.request.contextPath}/check-receipt">
						<div class="item-menu">
							<i class="fas fa-money-check"></i>
							<div class="item-menu-text">
								<p>Kiểm tra đơn hàng</p>
							</div>

						</div>
				</a></li>

				<li class="nav-item"><a
					href="${pageContext.request.contextPath}/cart">
						<div class="item-menu" id="cart">
							<i class="fas fa-shopping-cart"></i>
							<div class="item-menu-text">
								<p>Giỏ hàng</p>
							</div>
							<label class="quantity-cart" id="quantity-cart">0</label>
						</div>
						<style>
#quantity-cart {
	position: absolute;
	top: -5px;
	left: 55px;
	color: black;
	background-color: #d88e3f;
	border-radius: 4px;
	padding: 4px 8px;
	font-size: 10px;
	font-weight: 700;
	display: none;
}
</style>
				</a></li>

				<!-- xử lý nút login - START -->


				<c:choose>

					<c:when
						test="${CUSTOMER_LOGINED!=null && CUSTOMER_LOGINED.name == '' }">
						<li class="nav-item"><a
							href="${pageContext.request.contextPath}/member/profile">
								<div class="item-menu">
									<i class="fas fa-user"></i>
									<div class="item-menu-text">
										<p>Cập nhật thông tin!</p>
									</div>

								</div>
						</a></li>
					</c:when>
					<c:when
						test="${CUSTOMER_LOGINED!=null && CUSTOMER_LOGINED.name != '' }">
						<li class="nav-item"><a
							href="${pageContext.request.contextPath}/member/profile">
								<div class="item-menu">
									<i class="fas fa-user"></i>
									<div class="item-menu-text">
										<p>Chào, ${CUSTOMER_LOGINED.name}!</p>
									</div>

								</div>
						</a></li>
					</c:when>
					<c:otherwise>
						<li class="nav-item"><a
							href="${pageContext.request.contextPath}/login">
								<div class="item-menu">
									<i class="fas fa-user"></i>
									<div class="item-menu-text">
										<p>Đăng nhập</p>
									</div>

								</div>
						</a></li>
					</c:otherwise>
				</c:choose>

				<!-- xử lý nút login END -->



			</ul>
		</div>
	</div>

</nav>