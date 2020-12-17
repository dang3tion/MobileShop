<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<jsp:include page="/VIEW/jsp/jsp-component/head-css.jsp" />
<c:url var="url" scope="session" value="/VIEW"></c:url>
<link rel="stylesheet" type="text/css"
	href="${url}/css/css-page/signin.css">
</head>

<body>
	<!-- @@@@@@@@@@ HIỆN THÔNG BÁO  @@@@@@@@@@@@@ -->
	<c:if test="${message != null}">

		<script>
			window.onload = function() {
				document.getElementById('btn-message').click();
			}
		</script>

		<!-- Button trigger modal -->
		<button style="padding: -30px; visibility: hidden; z-index: 99999"
			type="button" id="btn-message" class="btn btn-white"
			data-toggle="modal" data-target="#exampleModalCenter"></button>

		<!-- Modal -->
		<div class="modal fade" id="exampleModalCenter" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalCenterTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLongTitle">${message}</h5>
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-success" data-dismiss="modal">Đóng</button>
					</div>
				</div>
			</div>
		</div>

	</c:if>
	<!-- @@@@@@@@@@ END HIỆN THÔNG BÁO  @@@@@@@@@@@@@ -->
	<jsp:include page="/VIEW/jsp/jsp-component/menu.jsp"></jsp:include>
	<c:import url="/VIEW/jsp/jsp-component/filter.jsp">
	</c:import>
<div style="margin-top: 40px"></div>
	<%--breadcumb--%>
	<c:import url="/VIEW/jsp/jsp-component/breadcumb.jsp">
		<c:param name="title" value="Đăng ký"></c:param>
	</c:import>
	<!-- Page Content -->


	<!-- Page Content -->
	<form style="margin-top: -55px"
		action="${pageContext.request.contextPath}/register" method="post"
		 class="form-signin" id="register">

		<div class="form-signin color_tt" id="login">

			<img class="mb-4" src="${url}/image/img-sys/register.png" alt=""
				width="100" height="100">
			<h1 class="h3 mb-3 font-weight-normal">Đăng kí tài khoản mới</h1>
			<label style="margin-bottom: -25px" for="recipient-name"
				class="d-flex justify-content-start align-baseline col-form-label">Email:</label>
			<input name="email" type="text" id="inputemail" class="form-control"
				onfocusout="check_email(this.id)" placeholder="Email">
			<label style="margin-bottom: -25px" for="recipient-name"
				class="d-flex justify-content-start align-baseline col-form-label">Mật
				khẩu:</label> <input name="password" type="password" id="inputPassword"
				class="form-control" placeholder="Mật Khẩu">
			<label style="margin-bottom: -25px" for="recipient-name"
				class="d-flex justify-content-start align-baseline col-form-label">Nhập
				lại mật khẩu:</label> <input type="password" id="inputPassword-confirm"
				class="form-control" placeholder="Nhập lại mật khẩu">
			<br /> <a href="${pageContext.request.contextPath}/login">Quay
				lại trang đăng nhập</a>
			<button class="btn btn-lg btn-primary btn-block">Đăng kí</button>
		</div>
	</form>

	<jsp:include page="/VIEW/jsp/jsp-component/footer.jsp"></jsp:include>

</body>

</html>