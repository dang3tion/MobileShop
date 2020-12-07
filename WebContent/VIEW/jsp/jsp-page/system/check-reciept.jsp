<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<jsp:include page="/VIEW/jsp/jsp-component/head-css.jsp" />
<c:url var="url" scope="application" value="/VIEW"></c:url>
 <link rel="stylesheet" href="${url }/css/css-page/receipt.css">
</head>

<body>
	<jsp:include page="/VIEW/jsp/jsp-component/menu.jsp"></jsp:include>
	<!-- Thanh menu loc du lieu va sap xep-->
	<c:import url="/VIEW/jsp/jsp-component/breadcumb.jsp">
		<c:param name="title" value="SỦa lại title nè"></c:param>
	</c:import>
	<!-- Page Content -->



	<!-- /.container -->
	<div class="container" style="margin-top: 100px; margin-bottom: 300px;">

		<div class="row">
			<div class="col-12">
				<div class="frame-check">
					<h5>Nhập mã đơn hàng cần kiểm tra</h5>
					<div class="frame-input">
						<label><i class="alpha fas fa-money-check"></i></label> <input
							type="text" placeholder="Nhập mã đơn hàng" value="MS291">
						<label> <a
							href="../Check-reicept_Page/check-receipt-result.html"><i
								class="beta fas fa-search"></i></a></label>

					</div>
				</div>
			</div>
   <div class="col-12">
                <div class="check-result">
                    <h4 class="text-left mb-4">Kết quả tìm kiếm</h4>
                    <table class="table table-hover ">
                        <thead class="thead-light">
                            <tr>
                                <th scope="col">Mã đơn hàng</th>
                             <th scope="col">Mã khách hàng</th>
                                <th scope="col">Ngày đặt hàng</th>
                                
                                <th scope="col">Tình trạng đơn hàng</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th scope="row">MS291</th>
                                <td>KH01</td>
                                <td>10/10/2020</td>
                                <td>Đang giao hàng</td>
                            </tr>

                        </tbody>
                    </table>
                </div>
            </div>

		</div>
		<div class="row"></div>
	</div>


	<jsp:include page="/VIEW/jsp/jsp-component/footer.jsp"></jsp:include>
	<!-- Bootstrap core JavaScript -->

	 
	   

</body>

</html>