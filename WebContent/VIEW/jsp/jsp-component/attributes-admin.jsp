<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach items="${listAttributes }" var="a" varStatus="i">
	<tr style="    font-size: 15px;">
		<td>${i.index+STT}</td>
		<td>${a.title }</td>

		<c:choose>
			<c:when test="${a.type=='VB'}">
				<td>Văn bản</td>
			</c:when>
			<c:otherwise>
				<td>Số</td>
			</c:otherwise>
		</c:choose>
		<td>${a.classAttribute.name }</td>

	</tr>
</c:forEach>
