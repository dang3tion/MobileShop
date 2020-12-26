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
												<div class="row">
													<div class="show-page mb-3 ml-3">

														Hiển thị <span> <select id="show"
															onclick="select_page()">
																<option value="10">10</option>
																<option value="20">20</option>
																<option value="50">50</option>
														</select></span> cột
													</div>


													<div class="show-page  arrange">

														Tìm kiếm <span> <input id="myInput"
															style="padding-left: 15px; border: 0.5px solid grey;"
															text" placeholder="Search.."></span>
													</div>

												</div>

												<table id="bootstrap-data-table" class="table table-hover ">
													<thead class="thead-light">
														<tr>
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
																<td>${c.name}</td>
																<td>${c.email}</td>
																<td>${c.numberPhone}</td>
																<td>${c.date}</td>
																<td class="feedback">${c.content}</td>
																<td>${c.state}</td>
																<td class="row" style="border: none;">
																	<div style="margin: auto;">
																		<button type="button" class="btn btn-primary"
																			data-toggle="modal" data-target="#${c.id}"
																			data-whatever="@mdo">
																			<i class="text-center fas fa-paper-plane"></i>
																		</button>

																		<button class="btn btn-danger sizeTh1"
																			data-toggle="modal" data-target="#delete"
																			data-toggle="tooltip" data-placement="top"
																			title="Xóa">
																			<i class="txt-center menu-icon fas fa-trash-alt"></i>
																		</button>
																	</div>

																</td>

															</tr>


															<!--Modal add-->
															<div class="modal fade" id="${c.id}" tabindex="-1"
																role="dialog" aria-labelledby="exampleModalLabel"
																aria-hidden="true">
																<form
																	action="${pageContext.request.contextPath}/admin/feedback"
																	method="post">
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
															<div class="modal fade" id="delete" tabindex="-1"
																role="dialog" aria-labelledby="exampleModalLabel"
																aria-hidden="true">
																<div class="modal-dialog" role="document">
																	<div class="modal-content">
																		<div class="modal-header">
																			<h5 class="modal-title" id="exampleModalLabel">Xác
																				nhận xóa phản hồi của khách hàng</h5>
																			<button type="button" class="close"
																				data-dismiss="modal" aria-label="Close">
																				<span aria-hidden="true">&times;</span>
																			</button>
																		</div>
																		<div class="modal-body">Bạn có muốn xóa phản hồi
																			này.</div>
																		<div class="modal-footer">
																			<button type="button" class="btn btn-secondary"
																				data-dismiss="modal">Không</button>
																			<button type="button" data-dismiss="modal"
																				class="btn btn-primary">Đồng ý</button>
																		</div>
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

	</div>
</body>


</html>