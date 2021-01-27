
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


			<c:choose>
					<c:when test="${!empty lstProduct}">
						<div class="row">
							<c:forEach items="${lstProduct}" var="pro" begin="0" end="8">
								<div class="col-4">
									<c:import url="/VIEW/jsp/jsp-component/card-product-index.jsp">
										<c:param name="URLdetail"></c:param>
										<c:param name="url" value="${pro.URL}"></c:param>
										<c:param name="image" value="${pro.img}"></c:param>
										<c:param name="name" value="${pro.name}"></c:param>
										<c:param name="price" value="${pro.price}"></c:param>
										<c:param name="salePrice" value="${pro.priceSales}"></c:param>
										<c:param name="evaluate" value="${pro.avgEvaluate }"></c:param>
										<c:param name="startIntact" value="${pro.startIntact}"></c:param>
										<c:param name="modStart" value="${pro.modStart }"></c:param>
										<c:param name="checkStart" value="${pro.checkStart}"></c:param>
									</c:import>
								</div>
							</c:forEach>
						</div>
					</c:when>
					<c:otherwise>
						<div class="container text-center">
							<h1>Không tìm thấy sản phẩm phù hợp</h1>
						</div>
					</c:otherwise>
				</c:choose>
