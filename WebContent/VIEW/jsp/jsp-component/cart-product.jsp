<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<li class="cart-content"><c:url value="/product-detail"
		var="URLdetail">
		<c:param name="id" value="${param.id}" />
	</c:url>


	<div class="container ">
		<div class="row">
			<div class="col-3">
				<a href="${URLdetail}" target="_blank"><img width="120"
					src="${param.image}"></a>
			</div>
			<div class="col-3 ">
				<a href="${URLdetail}"><h6>${param.name}</h6></a>
				<div>
					Màu sắc: <span class="mr-3">Đen</span>
				</div>
				<div>
					Thương hiệu: <span>Apple</span>
				</div>
				<a href="${URLdetail}" target="_blank">xem chi tiết</a>
			</div>
			<div
				class="col-3 d-flex align-items-center justify-content-end  text-left">
				<div>
					<p>
						<del>
							<fmt:formatNumber type="number" maxFractionDigits="3"
								value="${param.salePrice}" />
							<span class="unit">đ </span>
						</del>
					</p>
					<p>
						<strong><fmt:formatNumber type="number"
								maxFractionDigits="3" value="${param.price}" /> <span
							class="unit">đ</span></strong>
					</p>
				</div>
			</div>
			<div class="col-3 d-flex align-items-center">
				<div style="margin-left: 40px" class="">
					<div class="mb-2 row">
						<form action="${pageContext.request.contextPath}/cart"
							method="post">
							<input name="choose" value="decrease" hidden="true"> <input
								name="page" value="cart-page" hidden="true">
							<button class="btn btn-primary" name="id" value="${param.id}"
								type="submit" class="btn plus">
								<i class="fas fa-minus"></i>
							</button>
						</form>

						<input class="mx-1" type="number" min="1"
							value="${param.quantity}" max="5" disabled>
						<form action="${pageContext.request.contextPath}/cart"
							method="post">
							<input name="choose" value="add" hidden="true"> <input
								name="page" value="cart-page" hidden="true">
							<button class="btn btn-primary" name="id" value="${param.id}"
								type="submit" class="btn plus">
								<i class="fas fa-plus"></i>
							</button>
						</form>
					</div>


					<div>
						<form method="POST"
							action="${pageContext.request.contextPath}/cart">
							<input name="id" value="${param.id}" hidden="true"> <input
								name="page" value="cart-page" hidden="true">
							<button style="width: 100%" name="choose" value="remove"
								class="btn btn-danger">Xóa</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div> <!-- 	!!!!!!!!!!!!!!!!!! -->