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
				


	<section class="pt-5 pb-5 ">
		<div class="container">
			<div class="row">


				<c:choose>
					<c:when test="${ LIST_PRODUCT_IN_CART != null }">
						<div class="col-8">
							<div class="frame-cart">
								<ul>
									<c:forEach items="${LIST_PRODUCT_IN_CART}" var="pro">
										<c:import url="/VIEW/jsp/jsp-component/cart-product.jsp">
											<c:param name="id" value="${pro.id}"></c:param>
											<c:param name="image" value="${pro.thumbnail}"></c:param>
											<c:param name="name" value="${pro.name}"></c:param>
											<c:param name="price" value="${pro.price}"></c:param>
											<c:param name="salePrice" value="${pro.salePrice}"></c:param>
											<c:param name="quantity" value="${pro.quantityInCart}"></c:param>
										</c:import>
									</c:forEach>

								</ul>
								<form method="POST"
									action="${pageContext.request.contextPath}/cart">
									<button type="submit" name="choose" value="remove-all"
										class="ml-5 btn btn-danger">
										<i class="fas fa-trash-alt"></i> Xóa tất cả
									</button>
								</form>
							</div>

						</div>
						<div class="col-4">
							<h5 class="mb-3 text-left ml-5">Tạm tính</h5>
							<div class="receipt">

								<ul class="list-group mb-3">
									<c:forEach items="${LIST_PRODUCT_IN_CART}" var="pro">
										<li
											class="list-group-item d-flex justify-content-between lh-condensed">
											<div>
												<h6 class="my-0">${pro.name}
													<span style="color: blue;"> x ${pro.quantityInCart}
													</span>
												</h6>
											</div> <span style="color: #C41111; font-weight: bolder;"
											class="price">${pro.price * pro.quantityInCart } <span
												class='unit'>đ</span></span>
										</li>
									</c:forEach>

								</ul>
								<div class="sum-price">
									<div class="title">
										<p>Tổng tiền</p>
									</div>
									<div class="price-sum">
										<p class="price">
											${SUM_CART} <span class="unit"> đ</span>
										</p>
										<p>(Đã bao gồm VAT)</p>
									</div>


									<a class="text-none" style="color: rgb(255, 255, 255)"
										href="${pageContext.request.contextPath}/payment">
										<button class="btn-primary btn-receipt">Thanh toán</button>
									</a>




								</div>
							</div>

						</div>

					</c:when>
					<c:otherwise>

						<div style="margin-top: -50px" class="container">
							<div class="row mb-4  text-center">
								<div class="col-12">

									<img style="" src="${url}/image/img-sys/emptycart.webp">
									<h2 style="margin-top: -50px">Giỏ hàng trống</h2>

									<a href=" ${pageContext.request.contextPath}/index"
										class="btn btn-primary b" role="button" aria-disabled="true">Trang
										chủ</a>
								</div>
							</div>
						</div>


					</c:otherwise>
				</c:choose>



			</div>
		</div>


	</section>



	<!-- /.container -->



	<jsp:include page="/VIEW/jsp/jsp-component/footer.jsp"></jsp:include>

	<!-- Bootstrap core JavaScript -->



	<script src="${url }/js/js-static/cart.js"></script>
</body>

</html>