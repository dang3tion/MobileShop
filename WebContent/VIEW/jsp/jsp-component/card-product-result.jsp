<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<h3>${TESTING}</h3>

<!-- <div class="row"> -->
<%-- 	<c:forEach items="${lstPrices}" var="pro" begin="0" end="8"> --%>
<!-- 		<div class="col-4"> -->
<%-- 			<c:import url="/VIEW/jsp/jsp-component/card-product-index.jsp"> --%>
<%-- 				<c:param name="URLdetail"></c:param> --%>
<%-- 				<c:param name="id" value="${pro.id}"></c:param> --%>
<%-- 				<c:param name="image" value="${pro.img}"></c:param> --%>
<%-- 				<c:param name="name" value="${pro.name}"></c:param> --%>
<%-- 				<c:param name="price" value="${pro.price}"></c:param> --%>
<%-- 				<c:param name="salePrice" value="${pro.priceSales}"></c:param> --%>
<%-- 			</c:import> --%>
<!-- 		</div> -->
<%-- 	</c:forEach> --%>

<!-- </div> -->

<div class="row">
	<c:forEach begin="0" end="8">
		<div class="col-4">
			<c:import url="/VIEW/jsp/jsp-component/card-product-index.jsp">
				<c:param name="URLdetail"></c:param>
				<c:param name="id" value="sdffsdf"></c:param>
				<c:param name="image" value="https://cdn.tgdd.vn/Products/Images/42/217536/TimerThumb/samsung-galaxy-m51-(4).jpg"></c:param>
				<c:param name="name" value="4534234"></c:param>
				<c:param name="price" value="24234234"></c:param>
				<c:param name="salePrice" value="423423"></c:param>
			</c:import>
		</div>
	</c:forEach>

<!-- </div> -->


