<%@ page language="java" contentType="text/html; charset=utf-8;"
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
	<jsp:include page="/VIEW/jsp/jsp-component/menu.jsp"></jsp:include>


	<c:import url="/VIEW/jsp/jsp-component/breadcumb.jsp">
		<c:param name="title" value="Quên mật khẩu"></c:param>
	</c:import>

	<!-- Page Content -->
	<form method="post" onsubmit="return checkMail2()"
		action="${pageContext.request.contextPath}/forgot" class="form-signin"
		id="forget">
		<img class="mb-4" src="${url}/image/img-sys/QMK.png" alt="" width="72"
			height="72">
		<h1 class="h3 mb-3 font-weight-normal">Nhập email đã đăng kí</h1>
		<input name="email" id="inputEmail" class="form-control"
			placeholder="Nhập email" onfocusout=" check_email2(this.id)">
		<div class="require" style="display: none" id="require-email2">
		Nhập email theo đúng theo định dạng email <br>Ví dụ:
			nlumobile@gmail.com
		</div>

		<br />
		</div>
		<h5 style="color: red">${message}</h5>
		<button class="btn btn-lg btn-primary btn-block mt-3" type="submit">OK</button>

	</form>

	<!-- /.container -->


	<jsp:include page="/VIEW/jsp/jsp-component/footer.jsp"></jsp:include>
	<!-- Bootstrap core JavaScript -->

	 
	   
	<c:url var="url" scope="session" value="/VIEW"></c:url>
	<script src="${url}/js/js-page/form-login.js"></script>
</body>

</html>