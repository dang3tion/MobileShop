<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<jsp:include page="/VIEW/jsp/jsp-component/head-css.jsp" />
<c:url var="url" scope="session" value="/VIEW"></c:url>
<link rel="stylesheet" href="${url}/css/css-page/contact.css">
</head>

<body>
	<jsp:include page="/VIEW/jsp/jsp-component/menu.jsp"></jsp:include>
	<!-- Thanh menu loc du lieu va sap xep-->
	<c:import url="/VIEW/jsp/jsp-component/filter.jsp">
	</c:import>


	<img style="margin-top: -50px; width: 100%"
		src="${url}/image/img-sys/access-denied.jpg">



	<jsp:include page="/VIEW/jsp/jsp-component/footer.jsp"></jsp:include>

</body>

</html>