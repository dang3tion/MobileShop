<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<c:forEach var="user" items="${listUser}" varStatus="i">
	<tr>
		<td>${STTstart+i.index}</td>
		<th scope="row">${user.id}</th>
		<td>${user.name}</td>
		<td>${user.phoneNumber}</td>
		<td>${user.address}</td>
		<td>${user.email}</td>
		<td>${user.timeCreate}</td>
		<td>${user.status}</td>
	</tr>
</c:forEach>