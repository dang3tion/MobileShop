<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="filter-menu1" style="margin-top: 0px;">
	<div class="">
		<nav aria-label="breadcrumb">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a
					href="${pageContext.request.contextPath}/home">Trang chủ</a></li>
				<li class="breadcrumb-item active" aria-current="page">${param.title}</li>

			</ol>
		</nav>
	</div>
</div>