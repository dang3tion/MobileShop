<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<c:url var="url" scope="page" value="/VIEW"></c:url>
<jsp:include page="/VIEW/jsp/jsp-component/head-css-admin.jsp"></jsp:include>
<link href="${url}/css/css-page/admin-user.css" type="text/css"
	rel="stylesheet" />
</head>

<body>
	<div class="d-flex" id="wrapper">
		<!-- Sidebar -->

		<c:import url="/VIEW/jsp/jsp-component/sidebar-admin.jsp">
			<c:param name="attributeactive" value="active"></c:param>
		</c:import>




		<div id="page-content-wrapper">


			<!-- 		toggle logout -->
			<jsp:include page="/VIEW/jsp/jsp-component/toggle-logout-bar.jsp"></jsp:include>

			<!-- main content page -->
			<div class="container-fluid">
				<div class="mb-5 mt-3 ">
					<div class="content">
						<div class="animated fadeIn">
							<div class="row">

								<div class="col-md-12">
									<div class="card">
										<div class="card-body">
											<div class=" mb-2">

												<h4 class="text-center mt-3 mb-3">Danh sách các thông
													số kĩ thuật</h4>
												<div class="row">

													<div class="show-page  arrange">

														Sắp xếp <span> <select id="show"
															onclick="select_page()">
																<option value="10">A-Z</option>
																<option value="20">Z-A</option>
														</select></span>
													</div>
													<div class="show-page  arrange">

														Tìm kiếm <span> <input id="myInput"
															style="padding-left: 15px; border: 0.5px solid grey;"
															placeholder="Search.."></span>
													</div>

												</div>

												<button data-target="#add-attribute" style="float: right;"
													data-toggle="modal" data-toggle="tooltip"
													style="margin-right: 10px;" data-placement="top"
													title="Thêm thuộc tính"
													class="btn btn-success btn-add mt-2 ml-1 ">
													<i class="fas fa-plus-square mr-2"></i>Thêm thuộc tính mới
												</button>
												<button data-target="#add-class" style="float: right;"
													data-toggle="modal" data-toggle="tooltip"
													style="margin-right: 10px;" data-placement="top"
													title="Thêm nhóm mới" class="btn btn-primary btn-add mt-2 ">
													<i class="fas fa-plus-square mr-2"></i>Thêm nhóm mới
												</button>
												<div style="float: left; margin-top: 14px; color: #2196F3;">
													<p>${reString }</p>
												</div>
												<table id="bootstrap-data-table" class="table table-hover">
													<thead class="thead-light">
														<tr>
															<th data-toggle="tooltip" data-placement="top"
																title="Số thứ tự">STT</th>
															<th>Tên thông số kỹ thuật</th>
															<th>Loại thông số</th>
															<th>Nhóm thông số</th>

															<th></th>
														</tr>
													</thead>

													<tbody id="content-table">

													</tbody>
												</table>

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
									</div>
								</div>
							</div>
							<!-- .animated -->
						</div>
						<!-- .content -->



						<!-- Modal -->
						<form action="${pageContext.request.contextPath}/admin/attribute"
							method="post">
							<div class="modal fade" id="add-class" tabindex="-1"
								aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog"
									style="min-width: 700px; margin: auto; margin-top: 100px;">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel"></h5>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body">
											<h5>Nhập tên nhóm thuộc tính</h5>
											<input type="text" class="title-attribute" autofocus
												name="class-attribute">



										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-dismiss="modal">Đóng</button>
											<button type="button" class="btn btn-primary"
												data-target="#addclass" data-toggle="modal"
												data-toggle="tooltip" data-placement="top">Lưu</button>
										</div>
									</div>
								</div>
							</div>
							<div class="modal fade" id="addclass" tabindex="-1" role="dialog"
								aria-labelledby="exampleModalLabel" aria-hidden="true"
								style="background-color: #0000002e;">
								<div class="modal-dialog" style="margin-top: 200px;"
									role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">Xác nhận
												tạo lớp thuộc tính mới</h5>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body">Bạn có chắc muốn tạo nhóm mới?</div>
										<div class="modal-footer">
											<input type="submit" name="button-add-class"
												class="btn btn-primary" value="Đồng ý">
											<button type="button" class="btn btn-secondary"
												data-dismiss="modal">Không</button>

										</div>
									</div>
								</div>
							</div>

						</form>

						<form action="${pageContext.request.contextPath}/admin/attribute"
							method="post">
							<div class="modal fade" id="add-attribute" tabindex="-1"
								aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog"
									style="min-width: 700px; margin: auto; margin-top: 100px;">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel"></h5>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body">
											<h5>Nhập tên thông số</h5>
											<input type="text" class="title-attribute" autofocus
												name="name-attribute">
											<h5>Chọn loại thông số</h5>

											<select class="select-choose" name="type">
												<option value="VB">Văn bản</option>
												<option value="SO">Số</option>
											</select>

											<h5>Nhóm thông số</h5>
											<select class="select-choose" id="class-select"
												name="class-attribute">
												<c:forEach items="${listClass }" var="c">
													<option value="${ c.name}">${ c.name}</option>
												</c:forEach>
											</select>


										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-dismiss="modal">Đóng</button>
											<button type="button" class="btn btn-primary"
												data-target="#add" data-toggle="modal" data-toggle="tooltip"
												data-placement="top">Lưu</button>
										</div>
									</div>
								</div>
							</div>

							<div class="modal fade" id="add" tabindex="-1" role="dialog"
								aria-labelledby="exampleModalLabel" aria-hidden="true"
								style="background-color: #0000002e;">
								<div class="modal-dialog" style="margin-top: 200px;"
									role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">Xác nhận
												thêm thuộc tính</h5>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body">Bạn có chắc muốn thêm thông số
											này không?</div>
										<div class="modal-footer">
											<input type="submit" name="add-attribute"
												class="btn btn-primary" value="Đồng ý">
											<button type="button" class="btn btn-secondary"
												data-dismiss="modal">Không</button>

										</div>
									</div>
								</div>
							</div>
						</form>
						<!--Modal edit-->

						<!--/Modal edit-->


					</div>
					<!-- /#right-panel -->
				</div>


			</div>
			<input id="curent-page" value="${current_page}" style="display: none"></input>
		</div>
</body>
<script>
	function getCurrentPage() {
		return document.getElementById("curent-page").value;
	}
	function SendDataToServlet(number) {
		getNumberPageDefault(number);
		$.ajax({
			type : 'GET',
			url : '${pageContext.request.contextPath}/AJAXAdminAttribute',
			data : {

				page : parseInt(number)

			},
			success : function(responseText) {
				$('#content-table').html(responseText);
			}

		});

	}
</script>
<script src="${url}/js/js-page/devide-page-admin.js"></script>
</html>