<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!-- Sidebar -->

<!--Nav-->
<div class="side-bar bg-light border-right" id="sidebar-wrapper">
	<div class="sidebar-heading text-center">
		<b>Mobile Shop</b>
	</div>

	<div class="list-group list-group-flush">
		<ul>
			<li><a href="${pageContext.request.contextPath}/admin/index"
				class="list-group-item list-group-item-action  active"> Trang
					chủ <i class="menu-icon fa fa-laptop"></i>
			</a></li>
			<li><a href="${pageContext.request.contextPath}/admin/user"
				class="list-group-item list-group-item-action"> Thông tin người
					dùng<i class="menu-icon fas fa-users font-list"></i>
			</a></li>
			<li><a href="${pageContext.request.contextPath}/admin/manager-product"
				class="list-group-item list-group-item-action  "> Danh sách điện
					thoại <i class="menu-icon fas fa-mobile-alt font-list"></i>
			</a></li>
			<li><a href=""
				class="list-group-item list-group-item-action "> Quản lí đơn
					hàng <i class="menu-icon fas fa-shopping-cart font-list"></i>
			</a></li>
			<li><a href="${pageContext.request.contextPath}/admin/branch"
				class="list-group-item list-group-item-action "> Thông tin
					thương hiệu <i class="menu-icon fas fa-archway"></i>
			</a></li>
			<li><a
				href="${pageContext.request.contextPath}/admin/cancel-receipt"
				class="list-group-item list-group-item-action"> Đơn hàng bị hủy
					<i class="menu-icon fas fa-phone-slash"></i>
			</a></li>
			<li><a href="${pageContext.request.contextPath}/admin/feedback"
				class="list-group-item list-group-item-action"> Phản hồi khách
					hàng <i class="menu-icon far fa-paper-plane"></i>
			</a></li>
			<li><a href=""
				class="list-group-item list-group-item-action "> Dữ liệu lọc <i
					class="menu-icon fas fa-filter"></i></a></li>
		</ul>
	</div>
</div>
