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
					<span style="color: red">Đã bị khóa</span>
				</c:otherwise>
			</c:choose></td>
		<td class="row" style="border: none;"><c:choose>
				<c:when test="${user.status == 'ENABLE'}">
					<button id="lock-or-unlock-user-${user.email}" value=""
						type="button" onclick="onOffAccount('${user.email}')"
						class="btn btn-danger">
						Khóa <i class="fas fa-lock"></i>
					</button>
				</c:when>
				<c:otherwise>
					<button id="lock-or-unlock-user-${user.email}" value=""
						type="button" onclick="onOffAccount('${user.email}')"
						class="btn btn-success">
						<span>Mở</span> <i class="fas fa-lock-open"></i>
					</button>
				</c:otherwise>
			</c:choose></td>

	</tr>
</c:forEach>
<script>
	function onOffAccount(email) {

		var accept = confirm("Xác nhận hành động !");

		if (accept) {
			SendDataLock(email);
		}
	}
</script>
