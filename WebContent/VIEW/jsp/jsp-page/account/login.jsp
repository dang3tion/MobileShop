<%@ page language="java" contentType="text/html; charset=utf-8;"
	pageEncoding="utf-8"%>

<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<jsp:include page="/VIEW/jsp/jsp-component/head-css.jsp" />
<%@ page import="model_utility.Config"%>

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
	<!-- Thanh menu loc du lieu va sap xep-->
	<c:import url="/VIEW/jsp/jsp-component/filter.jsp">
	</c:import>

	<div style="margin-top: 40px"></div>

	<c:import url="/VIEW/jsp/jsp-component/breadcumb.jsp">
		<c:param name="title" value="Đăng nhập"></c:param>
	</c:import>



	<!-- Page Content -->
	<form onsubmit="return checkVali()"
		action="${pageContext.request.contextPath}/login" method="POST">
		<div class="form-signin color_tt" id="login">
			<img class="mb-4" src="${url}/image/img-sys/user.png" width="72"
				height="72">
			<h1 class="h3 mb-3 font-weight-normal">
				<fmt:message key="login"></fmt:message>
			</h1>

			<!-- 			<input type="text" name="email" id="inputEmail" class="form-control" -->
			<%-- 				placeholder="Email hoặc số điện thoại" value="${messEmail}"> --%>
			<input type="text" name="email" id="inputEmail" class="form-control"
				placeholder="<fmt:message key="nhapmaillogin"></fmt:message>"
				value="${messEmail}" onfocusout=" check_email(this.id)">
			<div class="require" id="require-email">

				<fmt:message key="checkmaillogin"></fmt:message>

			</div>
			<input type="password" id="inputPassword" name="password"
				class="form-control "
				placeholder="<fmt:message key="nhappasslogin"></fmt:message>"
				value="" onfocusout="check_password(this)">
			<div class="require" id="require-password">
				<fmt:message key="checkpasslogin"></fmt:message>
			</div>
			<div class="checkbox mb-3">
				<a href="${pageContext.request.contextPath}/forgot" class="mx-2"><fmt:message
						key="quenlogin"></fmt:message></a> <a
					href="${pageContext.request.contextPath}/register" class="mx-2"><fmt:message
						key="dangkilogin"></fmt:message></a>
			</div>
			<div class="form-check">
				<input type="checkbox" name="remember-me" value="on"
					class="form-check-input"> <label
					class=" mt-2 form-check-label"><fmt:message key="ghinhologin"></fmt:message></label>
			</div>

			<button onclick="check11()" class="btn btn-lg btn-primary btn-block"
				style="font-size: 18px;" type="submit"><fmt:message key="login"></fmt:message></button>

			<div class="or-seperator">
				<b><fmt:message key="orlogin"></fmt:message></b>
			</div>

			<a id="google-login-button" class="btn btn-danger btn-lg  btn-block"
				style="font-size: 18px;" role="button" aria-pressed="true"
				href="${Config.GOOGLE_URL_HREF_JSP}"><i id="icon-google"
				class="fab fa-google-plus-g mr-3" aria-hidden="true"></i> <fmt:message key="loginGoogle-menu-item"></fmt:message></a>


		</div>
	</form>

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
						<button type="button" class="btn btn-success" data-dismiss="modal"><fmt:message key="close"></fmt:message></button>
					</div>
				</div>
			</div>
		</div>

	</c:if>
	<!-- @@@@@@@@@@ END HIỆN THÔNG BÁO  @@@@@@@@@@@@@ -->


	<jsp:include page="/VIEW/jsp/jsp-component/footer.jsp"></jsp:include>

	<c:url var="url" scope="session" value="/VIEW"></c:url>
	<script src="${url}/js/js-page/form-login.js"></script>

</body>

</html>