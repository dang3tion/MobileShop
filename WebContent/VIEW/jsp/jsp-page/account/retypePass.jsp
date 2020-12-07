<%@ page language="java" contentType="text/html; charset=utf-8"
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


<%--breadcumb--%>
<jsp:include page="/VIEW/jsp/jsp-component/breadcumb.jsp"></jsp:include>
<!-- Page Content -->

<form action="${pageContext.request.contextPath}/retype" method="post" onsubmit="return checkRegister()" class="form-signin" id="register">
    <img class="mb-4" src="../../image/imgLogin/icon.png" alt="" width="72" height="72">
    <h1 class="h3 mb-3 font-weight-normal">Nhập mật khẩu mới</h1>
    <div class="row">

        <div class="col-lg-7 col-md-7 col-sm-12" style="margin: auto">
            <div class="frame-register">

                <div class="form-input">
                    <i class="fas fa-key"></i>
                    <input name="password" type="password" id="inputPassword" class="form-control" placeholder="Mật Khẩu"
                           onfocusout="check_password(this.id)"></div>
                <div class="require mt-1 ml-5" id="require-password"> Mật khẩu tối thiểu 8 ký tự, bao gồm chữ và số
                </div>
            </div>
        </div>
        <div class="col-lg-7 col-md-7 col-sm-12"  style="margin: auto">
            <div class="frame-register">

                <div class="form-input">
                    <i class="fas fa-key"></i>
                    <input type="password" id="inputPassword-confirm" class="form-control"
                           placeholder="Nhập lại mật khẩu"
                           onfocusout="check_password2(this.id,'inputPassword')">
                </div>
                <div class=" require mt-1 ml-5" id="require-password2">Nhập lại mật khẩu không khớp</div>
            </div>
        </div>


    </div>


    </div>
    <h2 style="color: red">${message}Tài khoản đã tồn tại</h2>

    <button class="btn btn-lg btn-primary btn-block">Ok</button>

</form>
<!-- /.container -->


<jsp:include page="/VIEW/jsp/jsp-component/footer.jsp"></jsp:include>
<!-- Bootstrap core JavaScript -->

<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${url}/js/js-page/form-forgot.js"></script>
</body>

</html>