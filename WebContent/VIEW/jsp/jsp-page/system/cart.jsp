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


	<section class="pt-5 pb-5 ">
		<div class="container">
			<div class="row">


				<c:choose>
					<c:when test="${ LIST_PRODUCT_IN_CART != null}">
						<div class="col-8">


							<div class="frame-cart">
								<ul>

									<c:forEach items="${listSanPham}" var="pro" begin="0" end="3">
										<div class="col-3">
											<c:import url="/VIEW/jsp/jsp-component/cart-product.jsp">
												<c:param name="id" value="${pro.id}"></c:param>
												<c:param name="image" value="${pro.thumbnail}"></c:param>
												<c:param name="name" value="${pro.name}"></c:param>
												<c:param name="price" value="${pro.price}"></c:param>
												<c:param name="salePrice" value="${pro.salePrice}"></c:param>
											</c:import>
										</div>
									</c:forEach>

								</ul>
							</div>

						</div>
						<div class="col-4">
							<h5 class="mb-3 text-left ml-5">Tạm tính</h5>
							<div class="receipt">

								<ul>
									<li class="price-product">
										<h5>
											iPhone 12 Pro Max 123GB<span>x</span> 1
										</h5>
										<p>
											23.000.000 <span class="unit"> đ</span>
										</p>

									</li>
									<li class="price-product">
										<h5>
											Samsung Galayxy S10 <span>x</span> 1
										</h5>
										<p>
											17.000.000 <span class="unit"> đ</span>
										</p>
									</li>
									<li class="price-product">
										<h5>
											Vivo S8 64G<span>x</span> 1
										</h5>
										<p>
											26.000.000 <span class="unit"> đ</span>
										</p>
									</li>
								</ul>
								<div class="sum-price">
									<div class="title">
										<p>Tổng tiền</p>
									</div>
									<div class="price-sum">
										<p class="price">
											66.000.000 <span class="unit"> đ</span>
										</p>
										<p>(Đã bao gồm VAT nếu có)</p>
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
							<div class="row mb-2  text-center">
								<div class="col-12">

									<img style="" src="${url}/image/img-sys/emptycart.webp">
									<h2 style="margin-top: -50px" >Giỏ hàng trống</h2>
									
								<a href=" ${pageContext.request.contextPath}/index" class="btn btn-primary b" role="button" aria-disabled="true">Trang chủ</a>
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