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
<%@page import="model_DAO.DAO_IconMenu"%>
<%
DAO_IconMenu dao = new DAO_IconMenu();
request.setAttribute("color", dao.colorWeb());
%>
<body
	style="color: ${color.colorText};background-color: ${color.colorBody}">
	<jsp:include page="/VIEW/jsp/jsp-component/menu.jsp"></jsp:include>
	<!-- Thanh menu loc du lieu va sap xep-->
	<!-- Thanh menu loc du lieu va sap xep-->
	<c:import url="/VIEW/jsp/jsp-component/filter.jsp">
		<c:param name="display" value="on"></c:param>
	</c:import>

	<!-- @@@@@@@@@@ HIỆN THÔNG BÁO KHI ĐĂNG KÍ THÀNH CÔNG @@@@@@@@@@@@@ -->
	<c:if test="${messageSuccess != null}">

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
						<h5 class="modal-title" id="exampleModalLongTitle">${messageSuccess}</h5>
					</div>
					<div class="modal-body">
						<p>Vui lòng cập nhật thông tin cá nhân
						<p>
					</div>
					<div class="modal-footer">
						<a href="${pageContext.request.contextPath}/member/profile"
							class="btn btn-primary" role="button">Cập nhật</a>
						<button type="button" class="btn btn-danger" data-dismiss="modal">Cập
							nhật sau</button>
					</div>
				</div>
			</div>
		</div>

	</c:if>
	<!-- @@@@@@@@@@ END HIỆN THÔNG BÁO KHI ĐĂNG KÍ THÀNH CÔNG @@@@@@@@@@@@@ -->




	<!-- Page Content -->
	<div class="container">


		<div class="row">


			<!-- 			<!--Slider san pham noi bat-->
			<div class="hot-products row col-12 bordertitle">
				<div class="col-lg-12">
					<div class="title ">
						<div class="title float-left">
							<h3>Sản phẩm nổi bật</h3>

							<h1>${CART}123</h1>

						</div>
						<div class="title float-right">
							<a
								href="${pageContext.request.contextPath}/searchingProduct?dssanpham=sanphamnoibat">Xem
								thêm <i class="fas fa-arrow-right"></i>
							</a>
						</div>
					</div>
				</div>
				<div class="col-lg-12">
					<div class="content mt-4">
						<div id="carouselForHorproduct" data-interval="false"
							class="carousel slide" data-ride="carousel">
							<div class="carousel-inner">
								<div class="carousel-item active ">
									<div class="row d-block ">
										<c:forEach items="${lstPrice }" var="pro" begin="0" end="3">
											<div class="col-3">
												<c:import
													url="/VIEW/jsp/jsp-component/card-product-index.jsp">
													<c:param name="URLdetail"></c:param>
													<c:param name="url" value="${pro.URL}"></c:param>
													<c:param name="image" value="${pro.img}"></c:param>
													<c:param name="name" value="${pro.name}"></c:param>
													<c:param name="price" value="${pro.price}"></c:param>
													<c:param name="salePrice" value="${pro.priceSales}"></c:param>
													<c:param name="evaluate" value="${pro.avgEvaluate }"></c:param>
													<c:param name="startIntact" value="${pro.startIntact}"></c:param>
													<c:param name="modStart" value="${pro.modStart }"></c:param>
													<c:param name="checkStart" value="${pro.checkStart}"></c:param>
												</c:import>
											</div>
										</c:forEach>
									</div>
								</div>
								<div class="carousel-item ">
									<div class="row d-block">
										<c:forEach items="${lstPrice }" var="pro" begin="4" end="7">
											<div class="col-3">
												<c:import
													url="/VIEW/jsp/jsp-component/card-product-index.jsp">
													<c:param name="URLdetail"></c:param>
													<c:param name="url" value="${pro.URL}"></c:param>
													<c:param name="image" value="${pro.img}"></c:param>
													<c:param name="name" value="${pro.name}"></c:param>
													<c:param name="price" value="${pro.price}"></c:param>
													<c:param name="salePrice" value="${pro.priceSales}"></c:param>
													<c:param name="evaluate" value="${pro.avgEvaluate }"></c:param>
													<c:param name="startIntact" value="${pro.startIntact}"></c:param>
													<c:param name="modStart" value="${pro.modStart }"></c:param>
													<c:param name="checkStart" value="${pro.checkStart}"></c:param>
												</c:import>
											</div>
										</c:forEach>
									</div>

								</div>
								<a class="carousel-control-prev" href="#carouselForHorproduct"
									role="button" data-slide="prev"> <span
									class="carousel-control-prev-icon" aria-hidden="true"></span> <span
									class="sr-only">Previous</span>
								</a> <a class="carousel-control-next" href="#carouselForHorproduct"
									role="button" data-slide="next"> <span
									class="carousel-control-next-icon " aria-hidden="true"></span>
									<span class="sr-only">Next</span>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 			Slider san pham moi  -->
			<div class="hot-products row col-12 bordertitle">
				<div class="col-lg-12">
					<div class="title ">
						<div class="title float-left">
							<h3>Sản phẩm mới</h3>
						</div>
						<div class="title float-right">
							<a
								href="${pageContext.request.contextPath}/searchingProduct?dssanpham=sanphammoi">Xem
								thêm <i class="fas fa-arrow-right"></i>
							</a>
						</div>
					</div>
				</div>
				<div class="col-lg-12">
					<div class="content mt-4">
						<div id="carouselForNewProduct" data-interval="false"
							class="carousel slide" data-ride="carousel">
							<div class="carousel-inner">
								<div class="carousel-item active ">
									<div class="row d-block ">

										<c:forEach items="${lstNew }" var="pro" begin="0" end="3">
											<div class="col-3">
												<c:import
													url="/VIEW/jsp/jsp-component/card-product-index.jsp">
													<c:param name="URLdetail"></c:param>
													<c:param name="url" value="${pro.URL}"></c:param>
													<c:param name="image" value="${pro.img}"></c:param>
													<c:param name="name" value="${pro.name}"></c:param>
													<c:param name="price" value="${pro.price}"></c:param>
													<c:param name="salePrice" value="${pro.priceSales}"></c:param>
													<c:param name="evaluate" value="${pro.avgEvaluate }"></c:param>
													<c:param name="startIntact" value="${pro.startIntact}"></c:param>
													<c:param name="modStart" value="${pro.modStart }"></c:param>
													<c:param name="checkStart" value="${pro.checkStart}"></c:param>
												</c:import>
											</div>
										</c:forEach>

									</div>
								</div>
								<div class="carousel-item ">
									<div class="row d-block">
										<c:forEach items="${lstNew }" var="pro" begin="4" end="7">
											<div class="col-3">
												<c:import
													url="/VIEW/jsp/jsp-component/card-product-index.jsp">
													<c:param name="URLdetail"></c:param>
													<c:param name="url" value="${pro.URL}"></c:param>
													<c:param name="image" value="${pro.img}"></c:param>
													<c:param name="name" value="${pro.name}"></c:param>
													<c:param name="price" value="${pro.price}"></c:param>
													<c:param name="salePrice" value="${pro.priceSales}"></c:param>
													<c:param name="evaluate" value="${pro.avgEvaluate }"></c:param>
													<c:param name="startIntact" value="${pro.startIntact}"></c:param>
													<c:param name="modStart" value="${pro.modStart }"></c:param>
													<c:param name="checkStart" value="${pro.checkStart}"></c:param>
												</c:import>
											</div>
										</c:forEach>
									</div>

								</div>
								<a class="carousel-control-prev" href="#carouselForNewProduct"
									role="button" data-slide="prev"> <span
									class="carousel-control-prev-icon" aria-hidden="true"></span> <span
									class="sr-only">Previous</span>
								</a> <a class="carousel-control-next" href="#carouselForNewProduct"
									role="button" data-slide="next"> <span
									class="carousel-control-next-icon " aria-hidden="true"></span>
									<span class="sr-only">Next</span>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>



		</div>
		<div class="row">
			<jsp:include page="/VIEW/jsp/jsp-component/sidebar-filter.jsp"></jsp:include>
			<div class="col-9" id="result-content">

				<!-- 				Hang ket qua -->
				<div class="title overflow-auto ">
					<div class="title float-left">
						<h3>Danh sách sản phẩm</h3>
					</div>
					<div class="title float-right">
						<a
							href="${pageContext.request.contextPath}/searchingProduct?dssanpham=sanphamgiacao">Xem
							thêm <i class="fas fa-arrow-right"></i>
						</a>
					</div>
				</div>


				<div class="row">


					<c:forEach items="${lstPrice}" var="pro" begin="0" end="8">
						<div class="col-4">
							<c:import url="/VIEW/jsp/jsp-component/card-product-index.jsp">
								<c:param name="URLdetail"></c:param>
								<c:param name="url" value="${pro.URL}"></c:param>
								<c:param name="image" value="${pro.img}"></c:param>
								<c:param name="name" value="${pro.name}"></c:param>
								<c:param name="price" value="${pro.price}"></c:param>
								<c:param name="salePrice" value="${pro.priceSales}"></c:param>
								<c:param name="evaluate" value="${pro.avgEvaluate }"></c:param>
								<c:param name="startIntact" value="${pro.startIntact}"></c:param>
								<c:param name="modStart" value="${pro.modStart }"></c:param>
								<c:param name="checkStart" value="${pro.checkStart}"></c:param>
							</c:import>
						</div>
					</c:forEach>



				</div>

				<!-- pagination -->
				<div class="row ">
					<div class="col-12 d-flex justify-content-end">
						<nav aria-label="...">
							<ul class="pagination">
								<li class="page-item disabled"><a class="page-link"
									href="#" tabindex="-1" aria-disabled="true">Trở về</a></li>
								<li class="page-item active"><a class="page-link" href="#">1</a></li>
								<li class="page-item " aria-current="page"><a
									class="page-link" href="#">2 </a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
								<li class="page-item"><a class="page-link" href="#">Tiếp</a>
								</li>
							</ul>
						</nav>
					</div>
				</div>



			</div>
		</div>



	</div>




	<jsp:include page="/VIEW/jsp/jsp-component/footer.jsp"></jsp:include>
</body>

</html>