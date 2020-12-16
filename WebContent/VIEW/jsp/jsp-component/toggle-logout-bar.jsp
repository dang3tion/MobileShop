<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
	<button class="btn btn-primary" id="menu-toggle">
		<i class="fas fa-bars"></i>
	</button>
	<div class=""></div>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav ml-auto mt-2 mt-lg-0">
			<li class="nav-item active"><a class="nav-link" href="#"
				data-toggle="modal" data-target="#log-out">Đăng xuất <span
					class="log-out"><i class="fas fa-arrow-right"></i></span>
			</a></li>

		</ul>
		<div class="modal fade" id="log-out" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Xác nhận đăng xuất</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">Bạn có muốn đăng xuất?</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-success" data-dismiss="modal">Hủy</button>
						<a href="${pageContext.request.contextPath}/AdminLogout"
							class="btn btn-danger" role="button" aria-pressed="true">Đăng
							xuất</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</nav>



<c:url var="url" scope="session" value="/VIEW"></c:url>
<script
	src="${url}/css/css-static/bootstrap/vendor/jquery/jquery.min.js"></script>
<script
	src="${url}/css/css-static/bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Menu Toggle Script -->
<script>
	$("#menu-toggle").click(function(e) {
		e.preventDefault();
		$("#wrapper").toggleClass("toggled");
	});
</script>
<script src="${url}/js/js-page/divide-page.js"></script>

<!-- search -->
<script>
	$(document).ready(
			function() {
				$("#myInput").on(
						"keyup",
						function() {
							var value = $(this).val().toLowerCase();
							$("#content-table tr").filter(
									function() {
										$(this).toggle(
												$(this).text().toLowerCase()
														.indexOf(value) > -1)
									});
						});
			});
</script>

<script>
	$(document).ready(function() {
		$('[data-toggle="tooltip"]').tooltip();
	});
</script>

