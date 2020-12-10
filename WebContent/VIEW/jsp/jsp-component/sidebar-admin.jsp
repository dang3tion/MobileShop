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
				class="list-group-item list-group-item-action ${param.indexactive}"> Trang
					chủ <i class="menu-icon fa fa-laptop"></i>
			</a></li>
			<li><a href="${pageContext.request.contextPath}/admin/user"
				class="list-group-item list-group-item-action ${param.useractive}"> Thông tin người
					dùng<i class="menu-icon fas fa-users font-list"></i>
			</a></li>
			<li><a href="${pageContext.request.contextPath}/admin/manager-product"
				class="list-group-item list-group-item-action ${param.listProductactive} "> Quản lý sản phẩm <i class="menu-icon fas fa-mobile-alt font-list"></i>
			</a></li>
			<li><a href=""
				class="list-group-item list-group-item-action "> Quản lí đơn
					hàng <i class="menu-icon fas fa-shopping-cart font-list"></i>
			</a></li>
			<li><a href="${pageContext.request.contextPath}/admin/branch"
				class="list-group-item list-group-item-action ${param.branchactive} "> Thông tin
					thương hiệu <i class="menu-icon fas fa-archway"></i>
			</a></li>
			<li><a
				href="${pageContext.request.contextPath}/admin/cancel-receipt"
				class="list-group-item list-group-item-action ${param.cancelactive}"> Đơn hàng bị hủy
					<i class="menu-icon fas fa-phone-slash"></i>
			</a></li>
			<li><a href="${pageContext.request.contextPath}/admin/feedback"
				class="list-group-item list-group-item-action ${param.feedbackactive}"> Phản hồi khách
					hàng <i class="menu-icon far fa-paper-plane"></i>
			</a></li>
			<li><a href="${pageContext.request.contextPath}/admin/attribute"
				class="list-group-item list-group-item-action ${param.attributeactive}"> Thuộc tính sản phẩm <i
					class="menu-icon fas fa-cog"></i></a></li>
			<li><a href="${pageContext.request.contextPath}/admin/filter"
				class="list-group-item list-group-item-action ${param.filteractive} "> Dữ liệu lọc <i
					class="menu-icon fas fa-filter"></i></a></li>
			 <li>
                  <a href="confi-web.html" class="list-group-item list-group-item-action ${param.config}">Giao diện 
                    <i class="menu-icon fas fa-cogs"></i></a>
              </li>
               <li>
                  <a href="change-password.html" class="list-group-item list-group-item-action ${param.information}"> Thông tin shop
                  <i class="menu-icon fas fa-key"></i></a>
              </li>		
			
		</ul>
	</div>
</div>
