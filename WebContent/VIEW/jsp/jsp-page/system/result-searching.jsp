<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
<jsp:include page="/VIEW/jsp/jsp-component/head-css.jsp" />

<c:url var="url" scope="session" value="/VIEW"></c:url>

</head>
<%@page import="model_DAO.DAO_IconMenu"%>
<%
	DAO_IconMenu dao = new DAO_IconMenu();
request.setAttribute("color", dao.colorWeb());
%>


<body
	style="color: ${color.colorText};background-color: ${color.colorBody}">
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




				<c:choose>
					<c:when test="${!empty lstProduct}">
						<div class="row">
							<c:forEach items="${lstProduct}" var="pro" begin="0" end="8">
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
					</c:when>
					<c:otherwise>
						<div class="container text-center">
							<h1>Không tìm thấy sản phẩm phù hợp</h1>
						</div>
					</c:otherwise>
				</c:choose>




				<!-- 				pagination -->




			</div>
			<div class="container">
				<div class="row ">
					<div class="col-12 d-flex justify-content-end">
						<div class="page-navigation" id="page-navigation"
							value="${totalPage}">
							<div class="beta">
								<button onclick="previousPage()">Trước</button>
								<span id="page-number"> </span>
								<button onclick="nextPage()">Sau</button>
							</div>
						</div>
					</div>
				</div>
				<input id="curent-page" value="${current_page}"
					style="display: none"></input>
			</div>
		</div>
	</div>



	<script>
	function getCurrentPage() {
		return document.getElementById("curent-page").value;
	}
	function SendDataToServlet(number) {
		getNumberPageDefault(number);
		$.ajax({
			type : 'GET',
			url : '${pageContext.request.contextPath}/AJAXResultSearching',
			data : {

				page : parseInt(number)

			},
			success : function(responseText) {
				$('#result-content').html(responseText);
			}

		});
		

	}
</script>
	<script src="${url}/js/js-page/devide-page-admin.js"></script>
	<!-- /.container -->
	<script>
		var obj = {
			href : '',
			toString : function() {
				return this.href;
			}
		};

		function sendAllUserSelected() {

			var jsonDataFilterSidebar = {
				os_ios : false,
				os_android : false,
				os_other : false,
				size_0_5inch : false,
				size_5_6inch : false,
				size_6_99inch : false,
				rom_8GB : false,
				rom_16_128GB : false,
				rom_256GB : false,
				rom_12GB : false,
				ram_4GB : false,
				ram_4_6GB : false,
				ram_8GB : false,
				ram_12GB : false,
				front_cam_5MP : false,
				front_cam_5_12MP : false,
				front_cam_12_99MP : false,
				rear_cam_5MP : false,
				rear_cam_5_12MP : false,
				rear_cam_12_99MP : false
			}

			var jsonDataSortNavigationbar = {
				price_hight_to_low : false,
				price_low_to_hight : false,
				sort_lasted_update : false,
				sort_new_to_old : false,
				sort_old_to_new : false,
				sort_a_z : false,
				sort_z_a : false,
				sort_most_view : false,
				sort_most_vote : false

			}

			if (document.getElementById("thapcao").checked) {
				jsonDataSortNavigationbar.price_hight_to_low = true;
			}
			if (document.getElementById("caothap").checked) {
				jsonDataSortNavigationbar.price_low_to_hight = true;
			}
			if (document.getElementById("sort_lasted_update").checked) {
				jsonDataSortNavigationbar.sort_lasted_update = true;
			}
			if (document.getElementById("sort_new_to_old").checked) {
				jsonDataSortNavigationbar.sort_new_to_old = true;
			}
			if (document.getElementById("sort_old_to_new").checked) {
				jsonDataSortNavigationbar.sort_old_to_new = true;
			}
			if (document.getElementById("sort_a_z").checked) {
				jsonDataSortNavigationbar.sort_a_z = true;
			}
			if (document.getElementById("sort_z_a").checked) {
				jsonDataSortNavigationbar.sort_z_a = true;
			}
			if (document.getElementById("sort_most_view").checked) {
				jsonDataSortNavigationbar.sort_most_view = true;
			}
			if (document.getElementById("sort_most_vote").checked) {
				jsonDataSortNavigationbar.sort_most_vote = true;
			}

			/////////////////////////////////////////////////////////////////////
			if (document.getElementById("os_ios").checked) {
				jsonDataSortNavigationbar.os_ios = true;
			}
			if (document.getElementById("os_android").checked) {
				jsonDataSortNavigationbar.os_android = true;
			}
			if (document.getElementById("os_other").checked) {
				jsonDataSortNavigationbar.os_other = true;
			}
			if (document.getElementById("size_0_5inch").checked) {
				jsonDataSortNavigationbar.size_0_5inch = true;
			}
			if (document.getElementById("size_5_6inch").checked) {
				jsonDataSortNavigationbar.size_5_6inch = true;
			}
			if (document.getElementById("size_6_99inch").checked) {
				jsonDataSortNavigationbar.size_6_99inch = true;
			}
			if (document.getElementById("rom_8GB").checked) {
				jsonDataSortNavigationbar.rom_8GB = true;
			}
			if (document.getElementById("rom_16_128GB").checked) {
				jsonDataSortNavigationbar.rom_16_128GB = true;
			}
			if (document.getElementById("rom_256GB").checked) {
				jsonDataSortNavigationbar.rom_256GB = true;
			}
			if (document.getElementById("rom_12GB").checked) {
				jsonDataSortNavigationbar.rom_12GB = true;
			}
// 			if (document.getElementById("ram_4GB").checked) {
// 				jsonDataSortNavigationbar.ram_4GB = true;
// 			}
// 			if (document.getElementById("ram_4_6GB").checked) {
// 				jsonDataSortNavigationbar.ram_4_6GB = true;
// 			}
			if (document.getElementById("ram_8GB").checked) {
				jsonDataSortNavigationbar.ram_8GB = true;
			}
// 			if (document.getElementById("ram_12GB").checked) {
// 				jsonDataSortNavigationbar.ram_12GB = true;
// 			}
			if (document.getElementById("front_cam_5MP").checked) {
				jsonDataSortNavigationbar.front_cam_5MP = true;
			}
			if (document.getElementById("front_cam_5_12MP").checked) {
				jsonDataSortNavigationbar.front_cam_5_12MP = true;
			}
			if (document.getElementById("front_cam_12_99MP").checked) {
				jsonDataSortNavigationbar.front_cam_12_99MP = true;
			}
			if (document.getElementById("rear_cam_5MP").checked) {
				jsonDataSortNavigationbar.rear_cam_5MP = true;
			}
			if (document.getElementById("rear_cam_5_12MP").checked) {
				jsonDataSortNavigationbar.rear_cam_5_12MP = true;
			}
// 			if (document.getElementById("rear_cam_12_99M").checked) {
// 				jsonDataSortNavigationbar.rear_cam_12_99M = true;
// 			}

			//////////////////////////////////////////////////////////////////////

		/* 	$
					.ajax({
						type : 'GET',
						url : '${pageContext.request.contextPath}/AJAXFilterSortHandling',
						data : {

							dataFilterSidebar : JSON
									.st
									ringify(jsonDataFilterSidebar),
							jsonDataSortNavigationbar : JSON
									.stringify(jsonDataSortNavigationbar),

							currentURL : window.location.href.toString(),

							keyWord : document.getElementById("keyWord").value

						},
						success : function(responseText) {
							$('#result-content').html(responseText);
						}

					});
		} */

	/* 	function sortProduct(field, type) {
			getNumberPageDefault(number);
			$.ajax({
				type : 'GET',
				url : '${pageContext.request.contextPath}/searchingProduct',
				data : {

					field : field,
					type : type

				},
				success : function(responseText) {
					$('#result-content').html(responseText);
				}

			});

		} */
	</script>


	<jsp:include page="/VIEW/jsp/jsp-component/footer.jsp"></jsp:include>
	<!-- Bootstrap core JavaScript -->




</body>

</html>