<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<c:forEach var="user" items="${listUser}" varStatus="i">
	<tr>
		<td>${STTstart+i.index}</td>
		<th scope="row">${user.id}</th>
		<c:choose>
			<c:when test="${user.name != '' }">
				<td>${user.name}</td>
			</c:when>
			<c:otherwise>
				<td>chưa cập nhật</td>
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${user.phoneNumber != '' }">
				<td>${user.phoneNumber}</td>
			</c:when>
			<c:otherwise>
				<td>chưa cập nhật</td>
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${user.address != '' }">
				<td>${user.address}</td>
			</c:when>
			<c:otherwise>
				<td>khách hàng chưa cập nhật</td>
			</c:otherwise>
		</c:choose>
		<td>${user.email}</td>
		<td>${user.timeCreate}</td>
		<td><c:choose>
				<c:when test="${user.status == 'ENABLE'}">
				Đang hoạt động
			</c:when>
				<c:otherwise>
				Đã bị khóa
			</c:otherwise>
			</c:choose></td>
		<td class="row" style="border: none;">
			<div style="margin: auto;">
				<button
					class="btn 
				
				<c:choose>
				<c:when test="${user.status == 'ENABLE'}">
				btn-danger
			</c:when>
				<c:otherwise>
				btn-success
			</c:otherwise>
			</c:choose>
				
				
				 sizeTh1"
					value="true" id='block' data-placement="top" title="Block"
					data-target="#block-user" data-toggle="modal">
					<i class="txt-center fas fa-lock"></i>
				</button>

			</div> <span>

				<div class="modal fade" id='block-user' tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Xác nhận
									chặn</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<i aria-hidden="true">&times;</i>
								</button>
							</div>
							<div class="modal-body">
								Bạn có muốn


								<c:choose>
									<c:when test="${user.status == 'ENABLE'}">
				khóa
			</c:when>
									<c:otherwise>
				mở khóa
			</c:otherwise>
								</c:choose>

								tài khoản này không?
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Hủy</button>


								<c:choose>
									<c:when test="${user.status == 'ENABLE'}">
										<button onclick="SendDataToServlet(123)" type="button" class="btn btn-danger">khóa</button>
									</c:when>
									<c:otherwise>
										<button onclick="SendDataToServlet(123)" type="button" class="btn btn-sucess">Mở
											khóa</button>
									</c:otherwise>
								</c:choose>

<script>
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
	</script>
							</div>
						</div>
					</div>
				</div>
		</span>
		</td>

	</tr>
</c:forEach>

