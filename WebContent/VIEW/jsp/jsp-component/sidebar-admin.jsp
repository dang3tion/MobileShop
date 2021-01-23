<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- Sidebar -->

<!--Nav-->
<div class="side-bar bg-light border-right" id="sidebar-wrapper">
	<div class="sidebar-heading text-center">
		<a href="${pageContext.request.contextPath}/index"><b>${SHOPINFO.name}</b></a>

	</div>
	<div class="list-group list-group-flush">
		<ul>
			<c:if test="${KEY_ADMIN_LOGIN.role == 'ADMIN'}">
				<li><a href="${pageContext.request.contextPath}/admin/index"
					class="list-group-item list-group-item-action ${param.indexactive}">
						Trang chủ <i class="menu-icon fa fa-laptop"></i>
				</a></li>
			</c:if>


			<c:if test="${KEY_ADMIN_LOGIN.role != 'WAREHOUSE'}">
				<li><a
					href="${pageContext.request.contextPath}/admin/cskh/user"
					class="list-group-item list-group-item-action ${param.useractive}">
						Thông tin người dùng<i class="menu-icon fas fa-users font-list"></i>
				</a></li>



			</c:if>

			<c:if test="${KEY_ADMIN_LOGIN.role != 'CSKH'}">
				<li><a
					href="${pageContext.request.contextPath}/admin/warehouse/manager-product"
					class="list-group-item list-group-item-action ${param.listProductactive} ">
						Quản lý sản phẩm <i class="menu-icon fas fa-mobile-alt font-list"></i>
				</a></li>
			</c:if>

			<c:if test="${KEY_ADMIN_LOGIN.role != 'WAREHOUSE'}">
				<li><a
					href="${pageContext.request.contextPath}/admin/cskh/receipt"
					class="list-group-item list-group-item-action ${param.receiptactive} ">
						Quản lí đơn hàng <i
						class="menu-icon fas fa-shopping-cart font-list"></i>
				</a></li>

			</c:if>
			<c:if test="${KEY_ADMIN_LOGIN.role != 'CSKH'}">
				<li><a
					href="${pageContext.request.contextPath}/admin/warehouse/branch"
					class="list-group-item list-group-item-action ${param.branchactive} ">
						Thông tin thương hiệu <i class="menu-icon fas fa-archway"></i>
				</a></li>
			</c:if>


			<c:if test="${KEY_ADMIN_LOGIN.role != 'WAREHOUSE'}">
				<li><a
					href="${pageContext.request.contextPath}/admin/cskh/cancel-receipt"
					class="list-group-item list-group-item-action ${param.cancelactive}">
						Đơn hàng bị hủy <i class="menu-icon fas fa-phone-slash"></i>
				</a></li>

				<li><a
					href="${pageContext.request.contextPath}/admin/cskh/feedback"
					class="list-group-item list-group-item-action ${param.feedbackactive}">
						Phản hồi khách hàng <i class="menu-icon far fa-paper-plane"></i>
				</a></li>
			</c:if>
			<c:if test="${KEY_ADMIN_LOGIN.role != 'CSKH'}">
				<li><a
					href="${pageContext.request.contextPath}/admin/warehouse/attribute"
					class="list-group-item list-group-item-action ${param.attributeactive}">
						Thuộc tính sản phẩm <i class="menu-icon fas fa-cog"></i>
				</a></li>
			</c:if>
			<c:if test="${KEY_ADMIN_LOGIN.role != 'CSKH'}">
				<li><a
					href="${pageContext.request.contextPath}/admin/warehouse/filter"
					class="list-group-item list-group-item-action ${param.filteractive} ">
						Dữ liệu lọc <i class="menu-icon fas fa-filter"></i>
				</a></li>
			</c:if>
			<c:if test="${KEY_ADMIN_LOGIN.role == 'ADMIN'}">
				<li><a href="${pageContext.request.contextPath}/admin/config"
					class="list-group-item list-group-item-action ${param.configactive}">Giao
						diện <i class="menu-icon fas fa-desktop"></i>
				</a></li>

				<li><a
					href="${pageContext.request.contextPath}/admin/information"
					class="list-group-item list-group-item-action ${param.informationactive}">
						Thông tin cửa hàng <i class="menu-icon fas fa-cogs"></i>
				</a></li>
				
				<li><a
					href="${pageContext.request.contextPath}/admin/employeeaccount"
					class="list-group-item list-group-item-action ${param.employeeaccountactive}">
						Quản lí nhân viên <i class="menu-icon fas fa-user-cog"></i>
				</a></li>
				<li><a
					href="${pageContext.request.contextPath}/admin/log"
					class="list-group-item list-group-item-action ${param.logactive}">
						Xem lịch sử quản trị <i class="menu-icon fas fa-history"></i>
				</a></li>
			</c:if>
		</ul>
	</div>
</div>
