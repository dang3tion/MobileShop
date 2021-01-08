<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
	<!DOCTYPE html>
	<html lang="en">
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<head>
			<jsp:include page="/VIEW/jsp/jsp-component/head-css.jsp" />
			<c:url var="url" scope="session" value="/VIEW"></c:url>
		</head>
		<%@page import="model_DAO.DAO_IconMenu" %>
			<% DAO_IconMenu dao=new DAO_IconMenu(); request.setAttribute("color", dao.colorWeb()); %>

				<body style="color: ${color.colorText};background-color: ${color.colorBody}">
					<jsp:include page="/VIEW/jsp/jsp-component/menu.jsp"></jsp:include>
					<c:import url="/VIEW/jsp/jsp-component/filter.jsp">
						<c:param name="display" value="on"></c:param>
					</c:import>
					<!-- Thanh menu loc du lieu va sap xep-->
					<c:import url="/VIEW/jsp/jsp-component/breadcumb.jsp">
						<c:param name="title" value="Tìm kiếm"></c:param>
					</c:import>
					<!-- Page Content -->

					<div class="container">


						<!--Thanh bar tim kiem theo noi dung-->
						<div class="row">
							<jsp:include page="/VIEW/jsp/jsp-component/sidebar-filter.jsp"></jsp:include>
							<!--Noi dung ket qua sau khi tim kiem-->
							<div class="col-9" id="result-content">
								<!--Hang ket qua ^^^-->

								<div class="row">
									<c:forEach items="${lstPrices}" var="pro" begin="0" end="8">
										<div class="col-4">
											<c:import url="/VIEW/jsp/jsp-component/card-product-index.jsp">
												<c:param name="URLdetail"></c:param>
												<c:param name="id" value="${pro.id}"></c:param>
												<c:param name="image" value="${pro.img}"></c:param>
												<c:param name="name" value="${pro.name}"></c:param>
												<c:param name="price" value="${pro.price}"></c:param>
												<c:param name="salePrice" value="${pro.priceSales}"></c:param>
											</c:import>
										</div>
									</c:forEach>

								</div>


								<!-- 				pagination -->




							</div>
							<div class="row ">
								<div class="col-12 d-flex justify-content-end">
									<nav aria-label="...">
										<ul class="pagination">
											<li class="page-item disabled"><a class="page-link" href="#" tabindex="-1"
													aria-disabled="true">Trở về</a></li>
											<li class="page-item active"><a class="page-link" href="#">1</a></li>
											<li class="page-item " aria-current="page"><a class="page-link" href="#">2
												</a></li>
											<li class="page-item"><a class="page-link" href="#">3</a></li>
											<li class="page-item"><a class="page-link" href="#">Tiếp</a>
											</li>
										</ul>
									</nav>
								</div>
							</div>
						</div>
					</div>




					<!-- /.container -->
					<script>
						function sortProduct(field, type) {
							getNumberPageDefault(number);
							$
								.ajax({
									type: 'GET',
									url: '${pageContext.request.contextPath}/searchingProduct',
									data: {

										field: field, type: type

									},
									success: function (responseText) {
										$('#result-content').html(responseText);
									}

								});

						}</script>


					<jsp:include page="/VIEW/jsp/jsp-component/footer.jsp"></jsp:include>
					<!-- Bootstrap core JavaScript -->




				</body>

	</html>