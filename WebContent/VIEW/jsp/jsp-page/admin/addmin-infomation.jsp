<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<c:url var="url" scope="page" value="/VIEW"></c:url>
<jsp:include page="/VIEW/jsp/jsp-component/head-css-admin.jsp"></jsp:include>
</head>

<body>

	<div class="d-flex" id="wrapper">
		<!-- Sidebar left -->
		<c:import url="/VIEW/jsp/jsp-component/sidebar-admin.jsp">
			<c:param name="indexactive" value="active"></c:param>
		</c:import>
		<!-- Page right -->
		<div id="page-content-wrapper">
			<!-- 		toggle logout -->
			<jsp:include page="/VIEW/jsp/jsp-component/toggle-logout-bar.jsp"></jsp:include>
			<!-- 			main content -->
			<div class="container-fluid">
				  <div class=" col-8 mb-5" style="background-color: #f1f1f1; margin:auto; margin-top:100px">
        
              <h4 style="margin:30px auto; text-align: center;">Thay đổi mật khẩu</h4>

              <form>
                <div class="form-group row">
                  <label for="staticEmail" style="font-weight: bold;" class="col-sm-3 col-form-label">Mật khẩu mới:</label>
                  <div class="col-sm-9">
                    <input type="password" class="form-control" name="password" type="password" onChange="onChange()" placeholder="Nhập mật khẩu mới">
                   <!-- ? <input  class="form-control-plaintext" name="password" type="password" onChange="onChange()" placeholder="Nhập mật khẩu mới"> -->
                  </div>
                </div>
                <div class="form-group row">
                  <label for="inputPassword" style="font-weight: bold;" class="col-sm-3 col-form-label">Nhập lại mật khẩu:</label>
                  <div class="col-sm-9">
                    <input type="password" class="form-control" name="confirm"  type="password" onChange="onChange()" placeholder="Nhập lại mật khẩu">
                  </div>
                  <button type="button" onsubmit="return false" class="btn btn-primary" data-toggle="modal" data-target="#changePass" style="margin: 15px;margin-left: 650px; float: right;">Lưu</button>
                </div>

                 <!-- Modal -->
                    <div class="modal fade" style="display: none;"  id="changePass" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Thay đổi mật khẩu</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                            </div>
                            <div class="modal-body">
                            <h6 style="color: red;">Bạn có muốn thay đổi mật khẩu</h6>
                            </div>
                            <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Không</button>
                            <button type="submit" class="btn btn-primary" data-dismiss="modal" > Có</button>
                            </div>
                        </div>
                        </div>
                    </div>
              </form>

              <!-- Button trigger modal -->

 

        </div>
			</div>

		</div>

	</div>
	
</body>
</html>
