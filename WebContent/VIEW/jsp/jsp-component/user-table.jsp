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
			</c:choose> <!-- 			   Khóa Button trigger modal --> <%--     <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#ModalCenter${user.id}"> --%>
			<!--         Khóa --> <!--     </button> --> <!--     Khóa Modal -->
			<%--     <div class="modal fade" id="ModalCenter${user.id}" tabindex="-1" role="dialog" --%>
			<!--         aria-labelledby="exampleModalCenterTitle" aria-hidden="true"> -->
			<!--         <div class="modal-dialog modal-dialog-centered" role="document"> -->
			<!--             <div class="modal-content"> --> <!--                 <div class="modal-header"> -->
			<!--                     <h5 class="modal-title">Modal title</h5> -->
			<!--                     <button type="button" class="close" data-dismiss="modal" aria-label="Close"> -->
			<!--                         <span aria-hidden="true">&times;</span> -->
			<!--                     </button> --> <!--                 </div> -->
			<!--                 <div class="modal-body"> --> <!--                     Bạn Có Muốn Khóa/Mở Khóa tài khoản này ? -->
			<!--                 </div> --> <!--                 <div class="modal-footer"> -->
			<!--                     <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button> -->
			<!--                     <button onclick="SendDataLock()" type="button" class="btn btn-danger">Khóa</button> -->
			<!--                 </div> --> <!--             </div> --> <!--         </div> -->
			<!--     </div> --></td>

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
