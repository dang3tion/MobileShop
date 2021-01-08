<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<div class="card">
	<div class="card-img text-center">
		<c:url value="/detail" var="URLdetail">
			<c:param name="id" value="${param.id}" />
		</c:url>
		<a href="${URLdetail}"> <img src="${param.image}" width="80%"></a>
	</div>
	<div class="card-content">
		<div class="card-title">
			<a href="${URLdetail}">${param.name}</a>
		</div>
		<div class="card-price">
			<div class="card-count">
			<fmt:formatNumber type="number" maxFractionDigits="3"
			value="${param.price}" /><span class="unit">đ</span>
			</div>
			
			
			<c:if test="${param.salePrice!=0 }">
			<div class="card-discount"><fmt:formatNumber type="number" maxFractionDigits="3"
			value="${param.salePrice}" />
				 <span class="unit">đ</span>
			</div>
			</c:if>
		</div>
		<div class="card-stars">
			<span> <i class="fas fa-star text-warning"></i></span> <span>
				<i class="fas fa-star text-warning"></i>
			</span> <span> <i class="fas fa-star text-warning"></i></span> <span>
				<i class="fas fa-star text-warning"></i>
			</span> <span> <i class="fas fa-star  text-dark"></i></span>
		</div>
	</div>
</div>



