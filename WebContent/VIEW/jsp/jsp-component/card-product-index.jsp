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
				<span> <i style="color: orange;" id="t1" class="fas fa-star text-warning"></i>
				</span>
			</c:forEach>
			<c:if test="${param.checkStart eq true}">
				<span> <i style="color:#FFC107;" class="fas fa-star-half-alt"></i>
				</span>
				<c:forEach begin="1" end="${param.modStart}">

					<span> <i style="color: 	#828282" class="fas fa-star"></i>
					</span>
				</c:forEach>
			</c:if>
			<c:if test="${param.checkStart eq false && param.modStart != 5}">
				<c:forEach begin="1" end="${param.modStart}">
					<span> <i style="color: 	#828282" class="fas fa-star"></i>
					</span>
				</c:forEach>
			</c:if>
			<c:if test="${param.checkStart eq false && param.modStart == 5}">
				<c:forEach begin="1" end="${param.modStart}">
					<span> <i style="visibility: hidden;" id="t1" class="fas fa-star"></i>
					</span>
				</c:forEach>
			</c:if>
		</div>
	</div>
</div>



