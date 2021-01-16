<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<tr>
	<c:forEach items="${listProduct}" var="pro">
		<td>${pro.numOrder}</td>
		<td style="max-width: 140px;"><img src="${pro.img}" width="100px"
			height="100px" alt=""></td>
		<td>${pro.id}</td>
		<td>${pro.name}</td>
		<td>${pro.branch}</td>
		<td>${pro.date}</td>
		<td>${pro.quatity}</td>


		<td>${pro.quatityRemain}</td>
		<td class="color-price">${pro.price}</td>
		<td class="color-price">${pro.priceSale}</td>
		<td class="color-price">${pro.state}</td>


		<td class="row" style="border: none;">
			<div style="margin: auto;">
				<a href="${pageContext.request.contextPath}/product-edit"><button
						class="m-wTD btn btn-primary" data-toggle="tooltip"
						data-placement="top" title="Chỉnh sửa" data-toggle="modal"
						data-target="#editUser">
						<i class="txt-center fas fa-edit"></i>
					</button></a>
				<button
					class="btn <c:if test ="${pro.state == 'Đang bán'}">
																				 btn-success
																	</c:if>
																	<c:if test ="${pro.state == 'Ngừng bán' ||pro.state == 'Ngưng kinh doanh'}">
																		 btn-danger
																	</c:if> sizeTh1"
					data-toggle="modal"
					<c:if test ="${pro.state == 'Ngưng kinh doanh'}">
																				 data-target="#stop"
																	</c:if>
					<c:if test ="${pro.state == 'Ngừng bán' ||pro.state == 'Đang bán'}">
																			 data-target="#delete${pro.id}"
																	</c:if>
					data-toggle="tooltip" data-placement="top"
					title="Thay đổi trạng thái sản phẩm">
					<i
						class="txt-center menu-icon <c:if test ="${pro.state == 'Đang bán'}">
																				fas fa-lock-open
																	</c:if>
																	<c:if test ="${pro.state == 'Ngừng bán' ||pro.state == 'Ngưng kinh doanh'}">
																		 
																		 	fas fa-lock
																	</c:if>"></i>
				</button>
			</div>

		</td>
</tr>
<form action="${pageContext.request.contextPath}/admin/manager-product"
	method="post">
	<div class="modal fade" id="delete${pro.id}" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<input style="display: none" value="${pro.id}" name="idEdit">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Xác nhận thay
						đổi trạng thái sản phẩm</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">Bạn có muốn thay đổi trạng thái sản
					phẩm ${pro.name}.</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Không</button>
					<button type="submit" class="btn btn-primary">Đồng ý</button>
				</div>
			</div>
		</div>
	</div>
</form>
</c:forEach>


