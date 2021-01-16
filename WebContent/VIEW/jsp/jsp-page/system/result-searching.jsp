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
			<button onclick="sendAllUserSelected()">OK</button>
			<div class="col-9" id="result-content">
				<!--Hang ket qua ^^^-->






				<!-- 				pagination -->




			</div>
			<div class="row ">
				<div class="col-12 d-flex justify-content-end">
					<nav aria-label="...">
						<ul class="pagination">
							<li class="page-item disabled"><a class="page-link" href="#"
								tabindex="-1" aria-disabled="true">Trở về</a></li>
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




	<!-- /.container -->
	<script>
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

			$
					.ajax({
						type : 'GET',
						url : '${pageContext.request.contextPath}/AJAXFilterSortHandling',
						data : {

							dataFilterSidebar : JSON.stringify(jsonDataFilterSidebar),
							jsonDataSortNavigationbar : JSON.stringify(jsonDataSortNavigationbar)
						},
						success : function(responseText) {
							$('#result-content').html(responseText);
						}

					});
		}

		function sortProduct(field, type) {
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

		}
	</script>


	<jsp:include page="/VIEW/jsp/jsp-component/footer.jsp"></jsp:include>
	<!-- Bootstrap core JavaScript -->




</body>

</html>