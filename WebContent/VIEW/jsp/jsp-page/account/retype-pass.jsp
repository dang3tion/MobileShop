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

<%@page import="model_DAO.DAO_IconMenu"%>
<%
	DAO_IconMenu dao = new DAO_IconMenu();
request.setAttribute("color", dao.colorWeb());
%>
<body
	style="color: ${color.colorText};background-color: ${color.colorBody}">
	<jsp:include page="/VIEW/jsp/jsp-component/menu.jsp"></jsp:include>
	<c:import url="/VIEW/jsp/jsp-component/filter.jsp">
	</c:import>
	<div style="margin-top: 40px"></div>
	<%--breadcumb--%>
	<c:import url="/VIEW/jsp/jsp-component/breadcumb.jsp">
		<c:param name="title" value="Nhập mật khẩu mới"></c:param>
	</c:import>
	<!-- Page Content -->

	<form onsubmit="return checkRegisterKK()"
		action="${pageContext.request.contextPath}/retype" method="post"
		class="form-signin" id="register">
		<img class="mb-4" src="${url}/image/img-sys/pass.png" width="72"
			height="72">
		<h1 class="h3 mb-3 font-weight-normal">Nhập mật khẩu mới</h1>

		<div class="col-lg-7 col-md-7 col-sm-12" style="margin: auto">

			<div class="frame-register">
				<div class="form-input">
					<i class="fas fa-key"></i> <input name="password" type="password"
						id="inputPassword" class="form-control"
						placeholder="Nhập mật Khẩu" onfocusout="check_pass(this.id)">
				</div>
				<div class="require" id="require-password">Mật khẩu tối thiểu
					8 ký tự, bao gồm chữ và số</div>
			</div>
			<div class="frame-register">
				<div class="form-input">
					<i class="fas fa-key"></i> <input type="password"
						id="inputPassword-confirm" class="form-control"
						placeholder="Nhập lại mật khẩu"
						onfocusout="check_pass(this.id,inputPassword)">
				</div>

			</div>

			<div class=" require" id="require-password2">Nhập lại mật khẩu
				không khớp</div>

		</div>



		<h5 style="color: red">${message}</h5>

		<button onclick="checkEmpty()"
			class="btn btn-lg btn-primary btn-block">OK</button>
	</form>


	<jsp:include page="/VIEW/jsp/jsp-component/footer.jsp"></jsp:include>
	<script src="${url}/js/js-page/formType.js"></script>


</body>

</html>