<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<jsp:include page="/VIEW/jsp/jsp-component/head-css.jsp" />
<c:url var="url" scope="session" value="/VIEW"></c:url>
<link rel="stylesheet" href="${url}/css/css-page/contact.css">
</head>

<body>
	<jsp:include page="/VIEW/jsp/jsp-component/menu.jsp"></jsp:include>
	<!-- Thanh menu loc du lieu va sap xep-->
	<jsp:include page="/VIEW/jsp/jsp-component/filterOther.jsp"></jsp:include>
	<!-- breadcumb -->
	<c:import url="/VIEW/jsp/jsp-component/breadcumb.jsp">
		<c:param name="title" value="Liên hệ và hỗ trợ"></c:param>
	</c:import>

	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="guide-buy">
					<h4 class="mb-3">Hướng dẫn mua hàng</h4>
					<div class="line mb-4"></div>
					<p>Mobile Shop là một điểm đến mua sắm Online cho những khách
						hàng yêu quý những chiếc điện thoại thông minh.</p>
					<p>Sau đây chúng tôi xin hướng dẫn cho quý vị các bước mua hàng
						Online trên trang Web.</p>
					<div class="guide-frame">
						<div class="step">
							<h4>Bước 1:</h4>

							<p>Chọn sản phẩm bạn cần mua trên cửa hàng.</p>
							<div class="text-center justify-content-center">
								<div class="text-center justify-content-center">
									<img style="width: 60%;" src="../image/imgContact/guide1.JPG">
									<p>Cửa hàng cung cấp một số tùy chọn : tìm kiếm, lọc, sắp
										xếp để bạn để bạn dễ dàng tìm được sản phẩm theo ý muốn.</p>
									<div class="text-center justify-content-center">
										<img style="width: 60%;" src="../image/imgContact/guide21.PNG">

									</div>
								</div>
							</div>
							<div class="step">
								<h4>Bước 2:</h4>
								<p>+ Bạn vui lòng cung cấp đầy đủ thông tin để phục vụ việc
									giao nhận hàng</p>
								<p>+ Shop có 2 hình thức thanh toán để bạn lựa chọn : thanh
									toán trước qua thẻ ghi nợ quốc tế hoặc thanh toán bằng tiền mặt
									qua hình thức COD sau khi đã nhận được hàng.</p>
								<div class="text-center justify-content-center">
									<img style="width: 60%;" src="../image/imgContact/guide2.PNG">

								</div>
							</div>
							<div class="step">
								<h4>Bước 3:</h4>
								<p>+ Bạn vui lòng giữ lại hóa đơn mua hàng để thực làm thủ
									tục bảo hành hoặc đổi trả sau này.</p>
								<p>+ Đơn hàng của bạn sẽ được chúng tôi đóng gói và bàn giao
									cho đơn vị vận chuyển ngay sau khi nhận được được hàng. Bạn sẽ
									nhận được sản phẩm sau 3-7 ngày tùy theo khu vực.</p>
								<div class="text-center justify-content-center">

									<img style="width: 40%;" src="../image/imgContact/guide3.png">
								</div>

							</div>
						</div>

					</div>

				</div>
			</div>
			<div class="col-12  d-flex justify-content-center">
				<div class="guide-buy">
					<h4 class="mb-3">Liên hệ với chúng tôi</h4>
					<div class="line mb-5"></div>
					<!-- <iframe
          src="https://docs.google.com/forms/d/e/1FAIpQLSe1XOCa08YXv4uteomrqCV1WhCc3UuI-ZLgyVCyJ0ET47WMcg/viewform?embedded=true"
          width="640" height="870" frameborder="0" marginheight="0" marginwidth="0">Đang tải…</iframe> -->

					<div class="contact">
						<div class="outframe-2">
							<div class="frame-contact">
								<h4>Gửi phản hồi của bạn</h4>

								<div class="collumn">
									<div class="form-2">
										<div class="form-input-2">
											<div class="title">
												<p>Họ tên</p>
											</div>
											<input type="name" placeholder="Nhập tên của bạn"
												onfocusout="fullname(this,name3)">
										</div>
										<div class=" fillText3" id='name3'></div>
									</div>
								</div>
								<div class="collumn">
									<div class="alpha">
										<div class="form-2">
											<div class="form-input-2">
												<div class="title">
													<p>Email*</p>
												</div>
												<input type="email" placeholder="Nhập email" id="email"
													onfocusout="email(this,text2)">
											</div>
											<div class=" fillText3" id="text2">Email must have the
												@ characters</div>
										</div>
									</div>
									<div class="omega">
										<div class="form-2">
											<div class="form-input-2">
												<div class="title">
													<p>Số điện thoại</p>
												</div>
												<input class="input-2" type="text" outf
													placeholder="Nhập số điện thoại"
													onfocusout="number(this,phone)">
											</div>
											<div class=" fillText3" id="phone">Only number input</div>
										</div>
									</div>
								</div>

								<div class="collumn">
									<div class="form-3">
										<div class="form-input-3">
											<div class="title">
												<p>Lời nhắn</p>
											</div>
											<textarea cols="40" placeholder="Nhập lời nhắn của bạn"></textarea>
										</div>
									</div>

								</div>
								<div class="collumn">
									<div class="">
										<button class="btn-submit">
											Gửi <i class="fas fa-long-arrow-alt-right"></i>
										</button>
									</div>

								</div>

							</div>
						</div>
					</div>

				</div>
			</div>

		</div>
	</div>


	<jsp:include page="/VIEW/jsp/jsp-component/footer.jsp"></jsp:include>




</body>

</html>