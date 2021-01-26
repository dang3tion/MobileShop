<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
<jsp:include page="/VIEW/jsp/jsp-component/head-css.jsp" />
<c:url var="url" scope="session" value="/VIEW"></c:url>

<!-- HÓA ĐƠN BỊ LỖI CSS -->
<link rel="stylesheet" href="${url}/css/css-page/bill.css">
<link
	href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900"
	rel="stylesheet">
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
	<!-- breadcumb -->
	<c:import url="/VIEW/jsp/jsp-component/breadcumb.jsp">
		<c:param name="title" value="Trạng thái đơn hàng"></c:param>
	</c:import>

	<!-- Page Content -->



	<div class="center canTop" style="margin-top: 40px;">
		<table align="center" border="0" cellpadding="0" cellspacing="0"
			style="padding: 0 30px; background-color: #fff; -webkit-box-shadow: 0px 0px 14px -4px rgba(0, 0, 0, 0.2705882353); box-shadow: 0px 0px 14px -4px rgba(0, 0, 0, 0.2705882353); width: 100%;">
			<tbody>
				<tr>
					<td>

						<table align="left" border="0" cellpadding="0" cellspacing="0"
							style="text-align: left;" width="100%">
							<tr>
								<td style="text-align: center;">
									<h2 style="margin-bottom: 20px;">ĐẶT HÀNG THÀNH CÔNG</h2> <img
									src="${url}/image/img-sys/bill.png" width="150" height="150"
									alt="image bill" style="margin-bottom: 30px;">
								</td>
							</tr>
						</table>
						<div style="margin-left: 110px; text-align: left">
							<p style="font-size: 18px;">
								<b>Chào ${name},</b>
							</p>
							<p style="font-size: 18px;">
								<b>Số điện thoại : ${phoneNumber}</b>
							</p>
							<p style="font-size: 18px;">Nhân viên Shop sẽ liên hệ với bạn sau 5 phút </p>
							
							<c:if test="${CUSTOMER_LOGINED != null}">
							
							<h4 style="color:red">(Xem chi tiết trong mail ${CUSTOMER_LOGINED.email} )</h4>
							
							</c:if>
							
							<p style="font-size: 18px;">
								<b>Mã đơn hàng : ${CodeOrder}</b>
							</p>
							<p style="font-size: 18px;">
								<b>Địa chỉ giao hàng :${address}</b>
							</p>
						</div>
						<table class="order-detail" border="0" cellpadding="0"
							cellspacing="0" align="left"
							style="width: 80%; margin-bottom: 50px; margin-left: 110px;">
							<tr align="left">
								<th>SẢN PHẨM</th>
								<th style="padding-left: 15px;">MÔ TẢ</th>
								<th>SỐ LƯỢNG</th>
								<th>THÀNH TIỀN</th>
							</tr>


							<c:forEach var="pro" items="${LIST_INSTANCE_PRODUCT}">
							
							<tr>
								<td><img
									src="${pro.img}"
									alt="" width="80"></td>
								<td valign="top" style="padding-left: 15px;">
									<h5
										style="font-size: 14px; color: #444; margin-top: 15px; margin-bottom: 0px;">${pro.name}</h5>
								</td>
								<td valign="top" style="padding-left: 15px;">
									<h5
										style="font-size: 14px; color: #444; margin-top: 15px; margin-bottom: 0px;">
										Màu : <span> ${pro.color}</span>
									</h5>
									<h5 style="font-size: 14px; color: #444; margin-top: 10px;">
										Số lượng : <span>${pro.quantityInCart}</span>
									</h5>
								</td>
								<td valign="top" style="padding-left: 15px;">
									<h5 style="font-size: 14px; color: #444; margin-top: 15px">
										<b><strong class="price"><fmt:formatNumber
											type="number" maxFractionDigits="3" value="${pro.price * pro.quantityInCart }" />
										<span class='unit'>đ</span></strong> VNĐ</b>
									</h5>
								</td>
							</tr>
							
							</c:forEach>



							<tr class="pad-left-right-space ">
								<td colspan="2" align="left">
									<p>Tổng:</p>
								</td>
								<td colspan="2" align="right"><b><strong class="price"><fmt:formatNumber
											type="number" maxFractionDigits="3" value="${TOTAL_MONEY }" />
										<span class='unit'>đ</span></strong><span>
											VNĐ</span></b></td>
							<tr class="pad-left-right-space">
								<td colspan="2" align="left">
									<p>Phí giao hàng :</p>
								</td>
								<td colspan="2" align="right"><b>MIỄN PHÍ<span>
											</span></b></td>
							</tr>

							<tr class="pad-left-right-space ">
								<td class="m-b-5" colspan="2" align="left">
									<p">Tổng cộng :</p>
								</td>
								<td class="m-b-5" colspan="2" align="right">
									<h5 style="color: red; text-align: right;">
										${TOTAL_MONEY} <span>VNĐ</span>
									</h5>
								</td>
							</tr>

						</table>

					</td>
				</tr>
			</tbody>
		</table>
		<table class="main-bg-light text-center top-0" align="center"
			border="0" cellpadding="0" cellspacing="0" width="100%">
			<tr>

				<td style="padding: 30px;"><a
					href=" ${pageContext.request.contextPath}/index">
						<button type="button" class="btn btn-warning">
							<i class="fas fa-print"></i> In thành file PDF
						</button>
						<button type="submit" class="btn btn-primary">TIẾP TỤC
							MUA HÀNG</button>
				</a>
					<table border="0" cellpadding="0" cellspacing="0"
						class="footer-social-icon" align="center" class="text-center"
						style="margin-top: 20px;">
						<tr>
							<td><a href="#"><img
									src="assets/images/email-temp/facebook.png" alt=""></a></td>
							<td><a href="#"><img
									src="assets/images/email-temp/youtube.png" alt=""></a></td>
							<td><a href="#"><img
									src="assets/images/email-temp/twitter.png" alt=""></a></td>
							<td><a href="#"><img
									src="assets/images/email-temp/gplus.png" alt=""></a></td>
							<td><a href="#"><img
									src="assets/images/email-temp/linkedin.png" alt=""></a></td>
							<td><a href="#"><img
									src="assets/images/email-temp/pinterest.png" alt=""></a></td>
						</tr>
					</table>
					<div style="border-top: 1px solid #ddd; margin: 20px auto 0;"></div>
					<table border="0" cellpadding="0" cellspacing="0" width="100%"
						style="margin: 20px auto 0;">

						<tr>
							<td>
								<!-- <a href="../index.html">
                                <button type="submit" class="btn btn-primary">TIẾP TỤC MUA HÀNG</button>
                            </a> -->
							</td>
						</tr>
						<tr>
							<td></td>
						</tr>

					</table></td>
			</tr>
		</table>
	</div>

	<!-- /.container -->



	<jsp:include page="/VIEW/jsp/jsp-component/footer.jsp"></jsp:include>
	<!-- Bootstrap core JavaScript -->




</body>

</html>