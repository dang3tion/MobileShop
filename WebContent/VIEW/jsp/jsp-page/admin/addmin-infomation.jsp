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

	<div class="d-flex" id="wrapper" >
		<!-- Sidebar left -->
		<c:import url="/VIEW/jsp/jsp-component/sidebar-admin.jsp">
			<c:param name="indexactive" value="active"></c:param>
		</c:import>
		<!-- Page right -->
		<div id="page-content-wrapper"  style="
    background-color: #e6e6e682;">
			<!-- 		toggle logout -->
			<jsp:include page="/VIEW/jsp/jsp-component/toggle-logout-bar.jsp"></jsp:include>
			<!-- 			main content -->
		     <div class="container-fluid">
        <div class="frame-cog">
          <h3>Thông tin cửa hàng</h3>
          <div class="save">
            <button  data-toggle="modal" data-target="#save">  Lưu lại toàn bộ

            </button>
         
          </div>   <div class="modal fade" id="save" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLongTitle">Xác nhận thay đổi</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                  Bạn có muốn xác nhận thay đổi này?
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Không</button>
                  <button type="button" onclick="themMau()" id="btnAddColor" data-dismiss="modal" class="btn btn-primary">Đồng ý</button>
                </div>
              </div>
            </div>
          </div>
          <div class="frame-cog-content">
            <div class="frame">
            <h5>Thông tin chung</h5>
            <ul class="information">
              <li class="content-input">
                <div class="title"><p>Tên cửa hàng</p></div>

                <div class="input"><input type="text" value="asdfassafdsadf"></div>
              
              </li>
              <li class="content-input">
                <div class="title"><p>Biểu tượng</p></div>

                <div class="input"><input accept="image/png, image/jpeg" type="file" value=""></div>
              
              </li>
              <li class="content-input">
                <div class="title"><p>Địa chỉ thực</p></div>
                <div class="input"><input type="text"></div>
              </li> <li class="content-input">
                <div class="title"><p>Địa chỉ Facebook</p></div>
                <div class="input"><input type="text"></div>
              </li> <li class="content-input">
                <div class="title"><p>Địa chỉ Youtube</p></div>
                <div class="input"><input type="text"></div>
              </li>
            </ul></div>
           
            <div class="frame-number"> <h5>Thông tin liên hệ</h5>
              <div class="tab">
            <div class="title-number">
              <ul>
              <li>Tiêu đề</li>
              <li> Số điện thoại</li>
              <li> Giờ hoạt động</li></ul>
            </div>
            <ul class="number">
              <li>
                <div class="content-number"><input type="text" value="asdfassafdsadf"></div>
                <div class="content-number"><input type="number"></div>
                <div class="content-number"><input type="text"></div>
                <div class="content-number"><button ><i class="fas  fa-trash-alt"></i></div>
              </li>
            </ul></div>
            <button class="plus"><i class="fas fa-plus"></i></button>
          </div>
          <div class="frame-liscen">  <script src="../ckeditor/ckeditor.js"></script>
            <div class="form-group space-top" >
              <h5 class="spacing_form">Chính sách</h5>
              <form action="" method="post">
  
                <!-- (2): textarea sẽ được thay thế bởi CKEditor -->
                <textarea id="edit" name="edit" cols="200" rows="80">
  
                      </textarea>
  
                <!-- (3): Code Javascript thay thế textarea có id='editor1' bởi CKEditor -->
                <script>
  
                  CKEDITOR.replace('edit');
  
                </script>
  
              </form>
            </div>
  
          </div>
          </div>
        </div>
     
      </div>
    </div>
    <!-- /#page-content-wrapper -->
  </div>
  <!-- /#wrapper -->

  <!-- Bootstrap core JavaScript -->
  <script src="../vendor/jquery/jquery.min.js"></script>
  <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script> 
   <script src="ckeditor/ckeditor.js"></script>
  <script>CKEDITOR.replace('ten');</script>
  <!--Check pass-->
  <script>
      function onChange() {
            const password = document.querySelector('input[name=password]');
            const confirm = document.querySelector('input[name=confirm]');
            if (confirm.value === password.value) {
                confirm.setCustomValidity('');
            } else {
                confirm.setCustomValidity('Mật khẩu không phù hợp');
            }
    }   


  </script>
		</div>

	</div>

	</div>

</body>
</html>
