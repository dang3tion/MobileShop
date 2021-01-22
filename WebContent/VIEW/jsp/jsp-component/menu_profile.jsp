<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<div class="col-sm-4">



	<ul class="list-group mt-3 ps-menu">
		<a href="${pageContext.request.contextPath}/member/profile">
			<li id="ThongTinCaNhan" class="list-group-item ${param.infoactive}"><i
				class="fa fa-id-card"></i> Thông tin cá nhân</li>
		</a>
		<a href="${pageContext.request.contextPath}/member/receipted">
			<li id="DonDatHang" class="list-group-item ${param.receiptedactive}"><i
				class="fas fa-box"></i> Đơn hàng đã đặt </li>
		</a>
		<a href="${pageContext.request.contextPath}/logout">
			<li id="SanPhamDoiTra" class="list-group-item"><i
				class="fas fa-sign-out-alt"></i> Đăng xuất</li>
		</a>
	</ul>



	<script>
		$(document).ready(function() {
			$('.toast').toast('show');
		});
	</script>

</div>