<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<li class="cart-content"><c:url value="/product-detail"
		var="URLdetail">
		<c:param name="id" value="${param.id}" />
	</c:url> <a href="${URLdetail}" target="_blank"><img src="${param.image}"></a>


	<div class="content-product">

		<div class="alpha">
			<div class="mb-4">
				<a href="${URLdetail}"> ${param.name}</a>
			</div>
			<p>
				Màu sắc: <span class="mr-3">Đen</span> Thương hiệu: <span>Apple</span>
			</p>
			<a href="${URLdetail}" target="_blank">xem chi tiết</a>
		</div>

		<div class="beta">
			<div class="price">
				<p>
					${param.price} <span class="unit">đ </span>
				</p>
				<p class="discount-price">
					${param.salePrice} <span class="unit">đ </span>
				</p>
			</div>
			<div class="quantity">
				<div class="quantity-content">
					<button class="btn minus">
						<i class="fas fa-minus"></i>
					</button>
					<input type="number" min="1" value="${param.quantity}" max="5" disabled>
					<button class="btn plus">
						<i class="fas fa-plus"></i>
					</button>
				</div>
				<div class="delete-content">

					<form method="POST"
						action="${pageContext.request.contextPath}/cart">
						<input name="id" value="${param.id}" hidden="true">
						<button name="choose" value="remove" class="btn btn-danger">Xóa</button>
					</form>
				</div>
			</div>
		</div>
	</div></li>

