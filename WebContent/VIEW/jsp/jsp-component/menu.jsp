<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
	<div class="zalo-chat-widget" data-oaid="783045327304238665"
		data-welcome-message="Rất vui khi được hỗ trợ bạn!" data-autopopup="0"
		data-width="350" data-height="420"></div>
	<script src="https://sp.zalo.me/plugins/sdk.js"></script>
	<!-- Thanh menu tim kiem -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-menu fixed-top">
		<div class="container">
			<a class="navbar-brand" href="index.html"><i
				class="fas fa-mobile-alt"></i> Mobile Shop</a>
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
					<li class="nav-item "><a href="../Giuaky/LienHe/Contact.html">
							<div class="item-menu">

								<i class="fas fa-phone-square-alt"></i>
								<div class="item-menu-text">
									<p>Liên hệ & Hỗ trợ</p>
								</div>

							</div>
					</a></li>
					<li class="nav-item"><a
						href="../Giuaky/Check-reicept_Page/check-receipt.html">
							<div class="item-menu">
								<i class="fas fa-money-check"></i>
								<div class="item-menu-text">
									<p>Kiểm tra đơn hàng</p>
								</div>

							</div>
					</a></li>
					<li class="nav-item"><a
						href="../Giuaky/Login_Page/sign-in/signIn.html">
							<div class="item-menu">
								<i class="fas fa-user"></i>
								<div class="item-menu-text">
									<p>Đăng nhập</p>
								</div>

							</div>
					</a></li>
					<li class="nav-item"><a
						href="../Giuaky/GioHang&checkout_Page/gioHang.html">
							<div class="item-menu" id="cart">
								<i class="fas fa-shopping-cart"></i>
								<div class="item-menu-text">
									<p>Giỏ hàng</p>
								</div>
								<label class="quantity-cart" id="quantity-cart">0</label>
							</div>
					</a></li>
				</ul>
			</div>
		</div>

	</nav>