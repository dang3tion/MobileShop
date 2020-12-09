<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>Tên : ${pro.name}</h1>
	<h2>Giá : ${pro.price}</h2>




	<form method="get" action="${pageContext.request.contextPath}/cart">

		<button name="id" value="${pro.id}">Thêm vào giỏ</button>
	</form>

</body>
</html>