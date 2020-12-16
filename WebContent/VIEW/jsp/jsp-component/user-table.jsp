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
		<td>${user.status}</td>
	</tr>
</c:forEach>

