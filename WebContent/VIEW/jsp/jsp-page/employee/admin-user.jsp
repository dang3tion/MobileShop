

<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<c:url var="url" scope="page" value="/VIEW"></c:url>
<jsp:include page="/VIEW/jsp/jsp-component/head-css-admin.jsp"></jsp:include>
</head>



<body>
	<div class="d-flex" id="wrapper">
		<!-- Sidebar left -->
		<c:import url="/VIEW/jsp/jsp-component/sidebar-admin.jsp">
			<c:param name="useractive" value="active"></c:param>
		</c:import>
		<!-- Page right -->
		<div id="page-content-wrapper">
			<!-- 		toggle logout -->
			<jsp:include page="/VIEW/jsp/jsp-component/toggle-logout-bar.jsp"></jsp:include>
			<!-- 			main content -->
			<div class="container-fluid">
				<div class="mb-5 mt-3">
					<h4 class="mt-3 mb-3">Thống kê tài khoản</h4>



					<table class="table">
						<thead class="thead-dark">
							<tr>
								<th scope="col">Số tài khoản đã tạo</th>
								<th scope="col">số tài khoản đang hoạt động</th>
								<th scope="col">số tài khoản bị khóa</th>
								<th scope="col">số tài khoản đã đăng kí hôm nay</th>
							</tr>
						</thead>
						<tbody>
							<tr class="">
								<th scope="row">${totalAccount}</th>
								<td>${TongSoAccDangHoatDong}</td>
								<td>${TongSoAccBiKhoa}</td>
								<td>${totalAccountCreateToday}</td>
							</tr>
						</tbody>
					</table>

				</div>
				<div class="border mb-2">
					<h4 class="text-center mt-3 mb-3"></h4>
					<div class="row">




						<form onsubmit="return checkSubmit()" action="${pageContext.request.contextPath}/employee/searchUser"
							method="GET">
							<div class="ml-5 mb-2 form-row align-items-center">
								<div class="col-auto">
									<div class="input-group mb-2">
										<div class="input-group-prepend">
											<div class="input-group-text">
												<i class="fas fa-search"></i>
											</div>
										</div>
										<input name="keyword" type="text" id = "check" class="form-control"
											placeholder="nhập từ khóa">
										
									</div>
								</div>
								<div class="col-auto">
									<button onclick="checkClick()" type="submit" class="btn btn-primary mb-2">Tìm
										kiếm</button>
								</div>
							</div>
						</form>


						<!-- 						Chế độ Xem -->

						<form>
							<div class=" mx-2 row">
								<span class="container-che-do-xem"><strong>Chế
										độ xem :</strong></span> <label class="mx-2  container-che-do-xem">Xem
									tất cả <input
									 type="radio" onclick="location.reload();"
									class="mx-2" checked="checked" name="radio"> <span
									class="checkmark"></span>
								</label> <label class="mx-2 container-che-do-xem"> Đang hoạt
									động <input class="mx-2" name="radio"
									value="enable" type="radio"
									onclick="switchChedoXem(this.value)"> <span
									class="checkmark"></span>
								</label> <label class="mx-2 container-che-do-xem">Đã bị khóa
									<input onclick="switchChedoXem(this.value)"
									class="mx-2" value="disable" type="radio" name="radio">
									<span class="checkmark"></span>
								</label>
							</div>
						</form>
						<!-- 						Chế độ Xem -->



					</div>
					<table class="table table-hover">
						<thead class="thead-light">
							<tr>
								<th width="2" scope="col">Số TT</th>
								<th scope="col">Mã KH</th>
								<th scope="col">Tên</th>
								<th scope="col" data-toggle="tooltip" data-placement="top"
									title=""><span title=""> Số</span> điện thoại</th>
								<th width="200" scope="col" data-toggle="tooltip"
									data-placement="top" title=""><span
									title="Địa chỉ giao hàng mặc định"> Địa</span> chỉ</th>
								<th scope="col">Email</th>
								<th scope="col">Thời gian tạo</th>
								<th width="100" scope="col">Trạng thái</th>
								<th width="100" scope="col">Khóa/Mở khóa</th>
							</tr>
						</thead>


						<tbody id="content-table">
							<!-- 	############ AJAX TRẢ DỮ LIỆU TẠI ĐÂY #################### -->




							<!-- 	############ AJAX TRẢ DỮ LIỆU TẠI ĐÂY #################### -->
						</tbody>
					</table>
				</div>

				<!-- 				PHÂN TRANG -->
				<div class="page-navigation" id="page-navigation"
					value="${totalPage}">
					<div class="beta">
						<button onclick="previousPage()">Trước</button>
						<span id="page-number"> </span>
						<button onclick="nextPage()">Sau</button>
					</div>
				</div>
			</div>
			<!-- 				PHÂN TRANG -->


		</div>

	</div>

	</div>

	<!-- 	@@@@@@@@@ GỬI DỮ LIỆU XUỐNG SERVER @@@@@@@@@@@@@@@@@ -->

	<input id="curent-home-page-admin-management-user"
		value="${CURRENT_PAGE_MANAGEMENT_USER}" style="display:none"></input>


	<script>
		function getCurrentPage() {
			return document
					.getElementById("curent-home-page-admin-management-user").value;
		}

		function SendDataToServlet(number) {
			getNumberPageDefault(number);
			$
					.ajax({
						type : 'GET',
						url : '${pageContext.request.contextPath}/AJAXAdminUserManager',
						data : {

							page : parseInt(number)

						},
						success : function(responseText) {
							$('#content-table').html(responseText);
						}

					});

		}
		function SendDataLock(emailvalue) {

			$
					.ajax({
						type : 'POST',
						url : '${pageContext.request.contextPath}/AJAXAdminUserManager',
						data : {

							page : getMove(),
							email : emailvalue
						},
						success : function(responseText) {
							$('#content-table').html(responseText);
						}

					});

		}
		function switchChedoXem(value) {
			
			$
			.ajax({
				type : 'GET',
				url : '${pageContext.request.contextPath}/AJAXswitchChedoXemAdminManageUser',
				data : {

					statusAccount : value
				
				},
				success : function(responseText) {					
					document.getElementById('page-navigation').value = responseText;
// 					alert(responseText);
				}

			});
			
			

			$
					.ajax({
						type : 'GET',
						url : '${pageContext.request.contextPath}/AJAXAdminUserManager',
						data : {

							cheDoXem : value
						
						},
						success : function(responseText) {
							$('#content-table').html(responseText);
						}

					});

		}
	</script>

	<script src="${url}/js/js-page/devide-page-admin.js"></script>



	<!-- 	@@@@@@@@@ GỬI DỮ LIỆU XUỐNG SERVER @@@@@@@@@@@@@@@@@ -->
	<style>
/* The container-che-do-xem */
.container-che-do-xem {
	display: block;
	position: relative;
	padding-left: 35px;
	margin-bottom: 12px;
	cursor: pointer;
	font-size: 18px;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

/* Hide the browser's default radio button */
.container-che-do-xem input {
	position: absolute;
	opacity: 0;
	cursor: pointer;
}

/* Create a custom radio button */
.checkmark {
	position: absolute;
	top: 0;
	left: 0;
	height: 25px;
	width: 25px;
	background-color: #eee;
	border-radius: 50%;
}

/* On mouse-over, add a grey background color */
.container-che-do-xem:hover input ~ .checkmark {
	background-color: #ccc;
}

/* When the radio button is checked, add a blue background */
.container-che-do-xem input:checked ~ .checkmark {
	background-color: #2196F3;
}

/* Create the indicator (the dot/circle - hidden when not checked) */
.checkmark:after {
	content: "";
	position: absolute;
	display: none;
}

/* Show the indicator (dot/circle) when checked */
.container-che-do-xem input:checked ~ .checkmark:after {
	display: block;
}

/* Style the indicator (dot/circle) */
.container-che-do-xem .checkmark:after {
	top: 9px;
	left: 9px;
	width: 8px;
	height: 8px;
	border-radius: 50%;
	background: white;
}
</style>
 <script>
      
 function checkClick(){
     var check = document.getElementById("check").value;
     if(check == ""){
    
       return false;
     }else{
       return true;
     }
   }
 
   function checkSubmit(){
     console.log(checkClick());
     if(checkClick()==false){
       alert("Vui lòng nhập thông tin cần tìm");
       return false;
     }else{
       return true;
     }

   }
    </script>
</body>
</html>




