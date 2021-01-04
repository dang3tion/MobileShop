<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<c:url var="url" scope="page" value="/VIEW"></c:url>
<jsp:include page="/VIEW/jsp/jsp-component/head-css-admin.jsp"></jsp:include>
<link href="${url }/css/css-page/admin1.css" style="sheet">
</head>

<body>

	<div class="d-flex" id="wrapper">
		<!-- Sidebar left -->
		<c:import url="/VIEW/jsp/jsp-component/sidebar-admin.jsp">
			<c:param name="configactive" value="active"></c:param>
		</c:import>
		<!-- Page right -->
		<div id="page-content-wrapper">
			<!-- 		toggle logout -->
			<jsp:include page="/VIEW/jsp/jsp-component/toggle-logout-bar.jsp"></jsp:include>
			<!-- 			main content -->
			<div class="container-fluid " style="padding: 50px;">
				<div class="mb-5 mt-3 ">
					<h4 class="text-center mt-3 mb-3">Cấu hình trang web</h4>

					<form action="${pageContext.request.contextPath}/admin/config" method="post">
						<div class="row space-r">
							<h5>1.Màu sắc</h5>
						</div>
						<div class="row space-r">
							<div class="col-3" style="margin-top: 20px;">
								<h6>
									Menu: <input type="color" value="#4DABF7">
								</h6>
							</div>

							<div class="col-3" style="margin-top: 20px;">
								<h6>
									Thanh lọc: <input type="color" value="#FFFFFF">
								</h6>
							</div>

							<div class="col-3" style="margin-top: 20px;">
								<h6>
									Body trang web: <input type="color" value="#FFFFFF">
								</h6>
							</div>
							<div class="col-3" style="margin-top: 20px;">
								<h6>
									Màu chữ: <input type="color" value="#000000">
								</h6>
							</div>


						</div>
						<div class="row space-r" style="margin-top: 20px;">
							<h5>2.Biểu tượng trên thanh menu</h5>

						</div>
						<div class="row" style="margin-top: 20px; margin: auto;">
							<div class="card col-3" style="padding: 10px;">
								<h6 style="text-align: center;">Icon 1</h6>
								<div class="card-body">
									<input type="text" class="form-control"
										placeholder="Nhập font awesome" value="${list.get(0).icon}" name = "icon1"> <input
										style="margin-top: 20px;" type="text" class="form-control"
										placeholder="Nhập tiêu đề" value="${list.get(0).content}" name = "content1">
								</div>
							</div>
							<div class="card  col-3" style="padding: 10px;">
								<h6 style="text-align: center;">Icon 2</h6>
								<div class="card-body">
									<input type="text" class="form-control"
										placeholder="Nhập font awesome" value="${list.get(1).icon}" name = "icon2"> <input
										style="margin-top: 20px;" type="text" class="form-control"
										placeholder="Nhập tiêu đề" value="${list.get(1).content}" name = "content2">
								</div>
							</div>
							<div class="card col-3" style="padding: 10px;">
								<h6 style="text-align: center;">Icon 3</h6>
							
								<div class="card-body">
									<input type="text" class="form-control"
										placeholder="Nhập font awesome" value ="${list.get(2).icon}" name = "icon3"> <input
										style="margin-top: 20px;" type="text" class="form-control"
										placeholder="Nhập tiêu đề" value="${list.get(2).content}" name = "content3">
								</div>
							</div>
							<div class="card col-3" style="padding: 10px;">
								<h6 style="text-align: center;">Icon 4</h6>
								<div class="card-body">
									<input type="text" class="form-control"
										placeholder="Nhập font awesome" value="${list.get(3).icon}" name = "icon4"> <input
										style="margin-top: 20px;" type="text" class="form-control"
										placeholder="Nhập tiêu đề" value ="${list.get(3).content}" name = "content4">
								</div>
							</div>

						</div>
						<div class="container">
							<button type="button" class="btn btn-primary "
								data-toggle="modal" data-target="#confi"
								style="float: right; margin-top: 20px; width: 100px; margin-right: 20px;">Lưu</button>
						</div>



						<!-- Modal -->
						<div class="modal fade" id="confi" tabindex="-1" role="dialog"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">Thay đổi
											cấu hình</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">Bạn có chắc chắn muốn thay đổi
										cấu hình</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">Không</button>
										<button type="submit" class="btn btn-primary"
											style="width: 80px;">Có</button>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>



			</div>





		</div>

	</div>

<!-- @@@@@@@@@@ HIỆN THÔNG GỬI  @@@@@@@@@@@@@ -->
	<c:if test="${messageEdit != null}">

		<script>
			window.onload = function() {
				document.getElementById('btn-message').click();
			}
		</script>

		<!-- Button trigger modal -->
		<button style="display: none"
			type="button" id="btn-message" class="btn btn-white"
			data-toggle="modal" data-target="#exampleModalCenter"></button>

		<!-- Modal -->
		<div class="modal fade" id="exampleModalCenter" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalCenterTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLongTitle">${messageEdit}</h5>
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-success" data-dismiss="modal">Đóng</button>
					</div>
				</div>
			</div>
		</div>

	</c:if>
	<!-- @@@@@@@@@@ END HIỆN THÔNG BÁO GỬI @@@@@@@@@@@@@ -->

</body>
</html>
