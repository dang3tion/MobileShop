<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- ĐA NGÔN NGỮ -->
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setLocale value="${sessionScope.LANGUAGE}" scope="session" />

<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<c:url var="url" scope="session" value="/VIEW/css/css-static"></c:url>
<title>Mobile Shop</title>

<!-- Bootstrap core CSS -->
<link href="${url}/bootstrap/vendor/bootstrap/css/bootstrap.min.css"
	type="text/css" rel="stylesheet" />

<!-- Custom styles for this template -->
<link href="${url}/font/css/all.min.css" type="text/css"
	rel="stylesheet" />

<link href="${url}/css-component/style.css" type="text/css"
	rel="stylesheet" />

<div class="zalo-chat-widget" data-oaid="783045327304238665"
	data-welcome-message="" data-autopopup="0" data-width="350"
	data-height="420"></div>

<script src="https://sp.zalo.me/plugins/sdk.js"></script>
