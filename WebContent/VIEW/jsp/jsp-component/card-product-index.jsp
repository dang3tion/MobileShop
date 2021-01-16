<%@page import="org.apache.jasper.tagplugins.jstl.core.Param"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>




<div class="card">
	<div class="card-img text-center">
		<c:url value="/chi-tiet" var="URLdetail">
			<c:param name="dien-thoai" value="${param.url}" />
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
					value="${param.price}" />
				<span class="unit">đ</span>
			</div>


			<c:if test="${param.salePrice!=0 }">
				<div class="card-discount">
					<fmt:formatNumber type="number" maxFractionDigits="3"
						value="${param.salePrice}" />
					<span class="unit">đ</span>
				</div>
			</c:if>
		</div>
		<h3>${param.evaluate}</h3>
		<h3>${param.startIntact}</h3>
		<h3>${param.modStart}</h3>
		<h3>${param.checkStart}</h3>




		<!-- 		<div class="card-stars"> -->

		<!-- 		 <span> <i id="t1" class="fas fa-star text-warning"></i> -->
		<!--         </span> -->
		<!--          <span> <i id="t2" class="fas fa-star text-warning"></i> -->
		<!--         </span> -->
		<!--          <span> <i id="t3" class="fas fa-star text-warning"></i></span>  -->
		<!--          <span> -->
		<!--             <i id="t4" class="fas fa-star text-warning"></i> -->
		<!--         </span>  -->
		<!--         <span> <i id="t5" class="fas fa-star  text-dark"></i></span> -->

		<!-- 		</div> -->

		<div class="card-stars">

			<c:forEach begin="1" end="${param.startIntact}">
				<span> <i id="t1" class="fas fa-star text-warning"></i>
				</span>
			</c:forEach>
		</div>
	</div>
</div>



