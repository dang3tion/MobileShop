<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%@ taglib
	prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:forEach items="${listProduct}" var="pro" varStatus="i">
	<tr style="    font-size: 14px;">
		<td>${i.index +STT}</td>
		<td><img src="${pro.imgMain}"
			style="width: 70px; height: 60px; object-fit: contain;"></img></td>
		<td>${pro.ID }</td>
		<td>${pro.name}</td>
		<td>${pro.branch.name }</td>
		<td>${pro.update_date }</td>
		<td>${pro.quantity }</td>
		<td>${pro.quantitySale }</td>



		<td><fmt:formatNumber type="number" maxFractionDigits="3"
				value="${pro.prices.price }" /> <span class="unit">đ </span></td>
		<c:choose>
			<c:when test="${pro.prices.priceSales!=0}">
				<td><fmt:formatNumber type="number" maxFractionDigits="3"
						value="${pro.prices.priceSales }" /> <span class="unit">đ
				</span></td>
			</c:when>
			<c:otherwise>
				<td>Chưa có</td>
				<br />
			</c:otherwise>
		</c:choose>
		<td>${pro.status }</td>

		<td class="row" style="border: none;">
			<div style="margin: auto;">
				<a href="${pageContext.request.contextPath}/product-edit"><button
						class="m-wTD btn btn-primary" data-toggle="tooltip"
						data-placement="top" title="Chỉnh sửa" data-toggle="modal"
						data-target="#editUser">
						<i class="txt-center fas fa-edit"></i>
					</button></a>

			</div>

		</td>
	</tr>

</c:forEach>
