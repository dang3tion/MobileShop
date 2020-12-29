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
			<c:param name="feedbackactive" value="active"></c:param>
		</c:import>


		<div id="page-content-wrapper">

			<!-- 		toggle logout -->
			<jsp:include page="/VIEW/jsp/jsp-component/toggle-logout-bar.jsp"></jsp:include>

			<!-- Page Content -->

			<div class="container-fluid">
				<div class="mb-5 mt-3 ">
					<div class="content">
						<div class="animated fadeIn">
							<div class="row">

								<div class="col-md-12">
									<div class="card">
										<div class="card-body">
											<div class=" mb-2">
												<h4 class="text-center mt-3 mb-3">Phản hồi của khách
													hàng</h4>
												<form action="${pageContext.request.contextPath}/admin/feedback" method="post">
													<div class="ml-5 mb-2 form-row align-items-center">
														<div class="col-auto">
															<div class="input-group mb-2">
																<div class="input-group-prepend">
																	<div class="input-group-text">
																		<i class="fas fa-search"></i>
																	</div>
																</div>
																<input name="searchContact" type="text" class="form-control"
																	placeholder="Nhập từ khóa" >
															</div>
														</div>
														<div class="col-auto">
															<button type="submit" class="btn btn-primary mb-2">Tìm
																kiếm</button>
														</div>
													</div>
												</form>
											</div>

											<table id="bootstrap-data-table" class="table table-hover ">
												<thead class="thead-light">
													<tr>
														<th>STT</th>
														<th>Họ tên</th>
														<th>Email</th>
														<th>Số điện thoại</th>
														<th>Thời gian</th>
														<th>Lời nhắn</th>
														<th>Trạng thái</th>
														<th></th>
													</tr>
												</thead>

												<tbody id="content-table">

													<c:forEach items="${listContact}" var="c">
														<tr>
															<td>${c.numericalOrder}</td>
															<td>${c.name}</td>
															<td>${c.email}</td>
															<td>${c.numberPhone}</td>
															<td>${c.date}</td>
															<td class="feedback">${c.content}</td>
															<td>${c.state}</td>
															<td class="row" style="border: none;">
																<div style="margin: auto;">
																	<button type="button" class="btn btn-primary"
																		data-toggle="modal" data-target="#pp${c.id}"
																		data-whatever="@mdo">
																		<i class="text-center fas fa-paper-plane"></i>
																	</button>

																	<button class="btn btn-danger sizeTh1"
																		data-toggle="modal" data-target="#delete${c.id}"
																		data-toggle="tooltip" data-placement="top" title="Xóa">
																		<i class="txt-center menu-icon fas fa-trash-alt"></i>
																	</button>
																</div>

															</td>

														</tr>


														<!--Modal add-->
														<div class="modal fade" id="pp${c.id}" tabindex="-1"
															role="dialog" aria-labelledby="exampleModalLabel"
															aria-hidden="true">
															<form
																action="${pageContext.request.contextPath}/admin/feedback"
																method="post">
																<input style="display: none" value="${c.id}"
																	name="idUpdate">
																<div class="modal-dialog" role="document">

																	<div class="modal-content">
																		<div class="modal-header">
																			<h5 class="modal-title" id="exampleModalLabel">Phản
																				hồi ${c.name}</h5>
																			<button type="button" class="close"
																				data-dismiss="modal" aria-label="Close">
																				<span aria-hidden="true">&times;</span>
																			</button>
																		</div>
																		<div class="modal-body">
																			<div class="form-group">
																				<label for="recipient-name" class="col-form-label">Gửi
																					tới:</label> <input
																					style="font-weight: bold; width: 300em;"
																					type="email" class="form-control"
																					id="exampleFormControlInput1" value="${c.email}"
																					name="emailFeedback">

																			</div>
																			<div class="form-group">
																				<label for="message-text" class="col-form-label">Phản
																					hồi:</label>
																				<textarea class="form-control" rows="10"
																					id="message-text" name="content"></textarea>
																			</div>
																		</div>
																		<div class="modal-footer">
																			<button type="button" class="btn btn-secondary"
																				data-dismiss="modal">Đóng</button>
																			<button type="submit" class="btn btn-primary">Gửi
																				phản hồi</button>
																		</div>
																	</div>
																</div>
															</form>
														</div>




														<!-- Modal -->
														<div class="modal fade" id="delete${c.id}" tabindex="-1"
															role="dialog" aria-labelledby="exampleModalLabel"
															aria-hidden="true">
															<div class="modal-dialog" role="document">
																<div class="modal-content">
																	<form
																		action="${pageContext.request.contextPath}/admin/feedback"
																		method="post">
																		<input style="display: none" value="${c.id}"
																			name="delete">
																		<div class="modal-header">
																			<h5 class="modal-title" id="exampleModalLabel">Xác
																				nhận xóa phản hồi của khách hàng</h5>
																			<button type="button" class="close"
																				data-dismiss="modal" aria-label="Close">
																				<span aria-hidden="true">&times;</span>
																			</button>
																		</div>
																		<div class="modal-body">Bạn có muốn xóa phản hồi
																			của ${c.name}.</div>
																		<div class="modal-footer">
																			<button type="button" class="btn btn-secondary"
																				data-dismiss="modal">Không</button>
																			<button type="submit" class="btn btn-primary">Đồng
																				ý</button>
																		</div>
																	</form>
																</div>
															</div>
														</div>

													</c:forEach>
												</tbody>
											</table>

											<div class="page-navigation">
												<div class="beta">
													<button onclick="previous_page()">Trước</button>
													<span id="page-number"> </span>
													<button onclick="next_page()">Sau</button>
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
	

					<!-- delete product -->

				</div>
			</div>
		</div>
	</div>

<!-- @@@@@@@@@@ HIỆN THÔNG BÁO XÓA  @@@@@@@@@@@@@ -->
	<c:if test="${messagedelete != null}">

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
						<h5 class="modal-title" id="exampleModalLongTitle">${messagedelete}</h5>
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-success" data-dismiss="modal">Đóng</button>
					</div>
				</div>
			</div>
		</div>

	</c:if>
	<!-- @@@@@@@@@@ END HIỆN THÔNG BÁO XÓA @@@@@@@@@@@@@ -->

<!-- @@@@@@@@@@ HIỆN THÔNG GỬI  @@@@@@@@@@@@@ -->
	<c:if test="${messagesend != null}">

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
						<h5 class="modal-title" id="exampleModalLongTitle">${messagesend}</h5>
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