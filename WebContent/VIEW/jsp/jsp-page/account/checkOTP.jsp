<%@ page language="java" contentType="text/html; charset=utf-8;"
         pageEncoding="utf-8" %>

<!DOCTYPE html>
<html lang="en">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <jsp:include page="/VIEW/jsp/jsp-component/head-css.jsp"/>
    <c:url var="url" scope="application" value="/VIEW"></c:url>
    <link rel="stylesheet" type="text/css" href="${url}/css/css-page/signin.css">


</head>

<body>
<jsp:include page="/VIEW/jsp/jsp-component/menu.jsp"></jsp:include>
<!-- Thanh menu loc du lieu va sap xep-->
<%--<jsp:include page="/VIEW/jsp/jsp-component/filter.jsp"></jsp:include>--%>
<%--breadcumb--%>

<jsp:include page="/VIEW/jsp/jsp-component/breadcumb.jsp"></jsp:include>

<!-- Page Content -->
<form onsubmit="return checkNum()" method="post" action="${pageContext.request.contextPath}/otp" class="form-signin" id="otp">
    <img class="mb-4" src="../../image/imgLogin/OTP.png" alt="" width="72" height="72">
    <h1 class="h3 mb-3 font-weight-normal">Nhập mã OTP</h1>
    <label  class="sr-only">OTP</label>
    <input  name="OTP" id="checkOTP" class="form-control" placeholder="Nhập mã OTP đã được gửi trong mail"
           value="" onfocusout=" check_OTP(this.id)">
    <br />
    <p style="display: none;color: red" id="check_OTP">Vui lòng không nhập chữ và kí tự đặc biệt.</p>
    </div>
    <h2 style="color: red">${message}Tài khoản đã tồn tại</h2>
    <button class="btn btn-lg btn-primary btn-block mt-3" type="submit">Tiếp tục</button>

</form>

<!-- /.container -->


<jsp:include page="/VIEW/jsp/jsp-component/footer.jsp"></jsp:include>
<!-- Bootstrap core JavaScript -->

<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<c:url var="url" scope="application" value="/VIEW"></c:url>
<script src="${url}/js/js-page/form-login.js"></script>
</body>

</html>