<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="col-9" id="result-content">
	<!--Hang ket qua ^^^-->

	<div class="row">
		<c:forEach items="${lstPrices}" var="pro" begin="0" end="8">
			<div class="col-4">
				<c:import url="/VIEW/jsp/jsp-component/card-product-index.jsp">
					<c:param name="URLdetail"></c:param>
					<c:param name="id" value="${pro.id}"></c:param>
					<c:param name="image" value="${pro.img}"></c:param>
					<c:param name="name" value="${pro.name}"></c:param>
					<c:param name="price" value="${pro.price}"></c:param>
					<c:param name="salePrice" value="${pro.priceSales}"></c:param>
				</c:import>
			</div>
		</c:forEach>

	</div>


	<!-- 				pagination -->


</div>