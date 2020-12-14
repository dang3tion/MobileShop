<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:url var="url" scope="session" value="/VIEW"></c:url>


<footer
	class=" bg-dark footerA text-center d-flex justify-content-center">
	<div class="container pt-4">
		<div class="row">
			<div class="ml-5 col-3">
				<div class="block">
					<p>PHƯƠNG THỨC THANH TOÁN</p>

					<p>

						<img class="icon m-2"
							style="background-color: white; border: solid 1.1px; border-color: rgba(88, 87, 85, 0.233); border-radius: 5px; padding: 5px 1px 5.5px 1px;"
							src="${url}/image/img-sys/vietcombank.svg" width="53px"> <img
							class="icon m-2"
							style="background-color: white; border: solid 1.1px; border-color: rgba(88, 87, 85, 0.233); border-radius: 5px; padding: 1px 12px 1px 13px;"
							src="${url}/image/img-sys/momo.png" width="55px"> <img
							class="icon m-2"
							style="background-color: white; border: solid 1.1px; border-color: rgba(88, 87, 85, 0.233); border-radius: 5px; padding: 1.5px 0px 1.5px 0px;"
							src="${url}/image/img-sys/agribank.png" width="53px"> <img
							class="icon m-2"
							style="background-color: white; border: solid 1.1px; border-color: rgba(88, 87, 85, 0.233); border-radius: 5px; padding: 4px 1px 3px 1px;"
							src="${url}/image/img-sys/BIDV.png" width="53px"> <img
							class="icon m-2" src="${url}/image/img-sys/visa.svg"> <img
							class="icon m-2" src="${url}/image/img-sys/cash.svg">
					</p>


				</div>
				<p style="margin-top: -10px; font-size: 1em;">Lượt truy cập</p>
				<p style="margin-top: -20px;">
					<strong id="luottrruycap">9472</strong>
				</p>
				<script>
					var myVar = setInterval(myTimer, 1000);
					function myTimer() {
						document.getElementById("luottrruycap").innerHTML = Math
								.floor(Math.random() * 10000) + 9999;
					}
				</script>
			</div>




			<div class="col-5">
				<div class="PhoneSupport">
					<p>HỖ TRỢ KHÁCH HÀNG</p>
					<p>
						Gọi mua hàng: <strong>1800.1099</strong> (7:30 - 22:00)
					</p>
					<p>
						Gọi khiếu nại: <strong class="ml-1">1800.1079</strong> (8:00 -
						21:30)
					</p>
					<p>
						Gọi bảo hành: <strong>1800.1069</strong> (8:00 - 21:00)
					</p>
				</div>
				<img width="30%" src="${url}/image/img-sys/BoCongThuong.png">
				<img width="10%" src="${url}/image/img-sys/BoCongThuong2.png">
			</div>




			<div  class="col-3 hihi PhoneSupport">
				<p>HỢP TÁC VÀ LIÊN KẾT</p>
				<p>
					<a style="color: white;"  href="${pageContext.request.contextPath}/contact">Chính sách
						bảo hành</a>
				</p>
				<p>
					<a  style="color: white;" href="${pageContext.request.contextPath}/contact"> Chính
						sách đổi trả</a>
				</p>


				<c:choose>
					<c:when
						test="${CUSTOMER_LOGINED!= null && CUSTOMER_LOGINED.role == 'ADMIN'}">
						<p>
							<a style="color: white;" href="${pageContext.request.contextPath}/logout">Đăng xuất</a>
						</p>
					</c:when>
					<c:otherwise>
						<p>
							<a  style="color: white;" href="${pageContext.request.contextPath}/adminlogin">Admin</a>
						</p>
					</c:otherwise>
				</c:choose>


				<p class="footerIcon" style="margin-bottom: -30px">
					<i style="color: rgb(13, 107, 214);"
						class="fa fa-facebook-official" aria-hidden="true"></i> <i
						style="color: rgb(214, 18, 18);" class="fa fa-youtube-play mx-2"
						aria-hidden="true"></i> <i style="color: rgb(144, 42, 228);"
						class="fa fa-linkedin-square" aria-hidden="true"></i> <i
						style="color: rgb(10, 146, 146);" class="fa fa-twitter mx-2"
						aria-hidden="true"></i>
				</p>
				<!-- Chọn ngôn ngữ-->
				<div class="btn-group">
					<button type="button" class="btn btn-warning dropdown-toggle"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<fmt:message key="choose-language"></fmt:message> 
					</button>
					<div class="dropdown-menu">
						<a class="dropdown-item"
							href=" ${pageContext.request.contextPath}/switch-language?lang=en_US"><b>English</b></a>
						<a class="dropdown-item"
							href=" ${pageContext.request.contextPath}/switch-language?lang=cn_CN"><b>漢語</b></a>
						<a class="dropdown-item"
							href=" ${pageContext.request.contextPath}/switch-language?lang=vi_VN"><b>Tiếng
								Việt</b></a>
					</div>
				</div>
			</div>
</footer>
<!-- âsd -->
<script
	src="${url}/css/css-static/bootstrap/vendor/jquery/jquery.min.js"></script>
<script
	src="${url}/css/css-static/bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
