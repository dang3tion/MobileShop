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
<form onsubmit="" action="${pageContext.request.contextPath}/login" method="POST">
<div  class="form-signin color_tt" id="login">
    <img class="mb-4" src="../../image/imgLogin/icon.png" alt="" width="72" height="72">
    <h1 class="h3 mb-3 font-weight-normal">Đăng nhập</h1>

    <input type="text" name="email" id="inputEmail" class="form-control" placeholder="Email hoặc số điện thoại"
           value="" onfocusout=" check_email(this.id)">
    <div class="require" id="require-email">Yêu cầu nhập email theo đúng theo định dạng email <br>Ví dụ:
        nlumobile@gmail.com
    </div>
    <input type="password" id="inputPassword" name="password" class="form-control " placeholder="Mật khẩu" value=""
           onfocusout="check_password(this)">
    <div class="require" id="require-password">Mật khẩu phải có ít nhất 8 ký tự</div>
    <div class="checkbox mb-3">
        <a href="QuenMK.html" class="mx-2">Quên mật khẩu</a>
        <a href="Signup.html" class="mx-2">Đăng kí</a>
    </div>
    <h2 style="color: red">${message}Tài khoản đã tồn tại</h2>
        <button class="btn btn-lg btn-primary btn-block" type="submit"> Đăng
            nhập
        </button>

    <h3 class="h6  font-weight-normal mt-5">Đăng nhập bằng</h3>
    <div class="with-login">
        <%--        <a href="#"> <img src="../../image/imgIcon/facebook.svg" id="facebook"></i></a>--%>

        <a href="#"> <img src="${url }/image/image-user/product/iconGoogle.svg" alt="google" id="google"></a>

    </div>

</div>
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