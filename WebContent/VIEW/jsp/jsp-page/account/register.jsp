<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
						<button type="button" class="btn btn-success" data-dismiss="modal">
							<fmt:message key="close"></fmt:message>
						</button>
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
	<form onsubmit="return checkRegisterABCDEFGH()"
		style="margin-top: -55px"
		action="${pageContext.request.contextPath}/register" method="post"
		class="form-signin" id="register">

		<div class="form-signin color_tt" id="login">

			<img class="mb-4" src="${url}/image/img-sys/register.png" alt=""
				width="100" height="100">
			<h1 class="h3 mb-3 font-weight-normal"><fmt:message key="register"></fmt:message></h1>
			<label style="margin-bottom: -25px" for="recipient-name"
				class="d-flex justify-content-start align-baseline col-form-label">Email:</label>
			<input name="email" type="text" id="inputemail" value=""
				class="form-control" onfocusout="check_email(this.id)"
				placeholder="Email">
			<div class="require" id="require-email">
				<fmt:message key="checkmaillogin"></fmt:message>
			</div>
			<label style="margin-bottom: -25px" for="recipient-name"
				class="d-flex justify-content-start align-baseline col-form-label"><fmt:message key="pass"></fmt:message>:</label> <input name="password" type="password" id="inputPassword"
				class="form-control" value="" placeholder="<fmt:message key="nhappasslogin"></fmt:message>">
			<div class="require" id="require-password"><fmt:message key="checkpasslogin"></fmt:message></div>
			<label style="margin-bottom: -25px" for="recipient-name"
				class="d-flex justify-content-start align-baseline col-form-label"><fmt:message key="repass"></fmt:message>:</label> <input type="password" id="inputPassword-confirm"
				class="form-control" value="" placeholder="<fmt:message key="nhaprepass"></fmt:message>">
			<div class=" require" id="require-password2"><fmt:message key="checkrepass"></fmt:message></div>
			<br /> <a href="${pageContext.request.contextPath}/login"><fmt:message key="quaylai"></fmt:message></a>
			<button onclick="checkEmpty()"
				class="btn btn-lg btn-primary btn-block"><fmt:message key="register1"></fmt:message></button>
		</div>
	</form>

	<jsp:include page="/VIEW/jsp/jsp-component/footer.jsp"></jsp:include>
	<script src="${url}/js/js-page/form-register.js"></script>
</body>

</html>