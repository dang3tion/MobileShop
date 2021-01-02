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
	<!-- breadcumb -->
	<c:import url="/VIEW/jsp/jsp-component/breadcumb.jsp">
		<c:param name="title" value="Liên hệ và hỗ trợ"></c:param>
	</c:import>

	<div class="container">
		<div class="row">
			<div class="col-12">
				${SHOPINFO.policy}
			</div>
			<div class="col-12  d-flex justify-content-center">
				<div class="guide-buy">
					<h4 class="mb-3">Liên hệ với chúng tôi</h4>
					<div class="line mb-5"></div>
					<!-- <iframe
          src="https://docs.google.com/forms/d/e/1FAIpQLSe1XOCa08YXv4uteomrqCV1WhCc3UuI-ZLgyVCyJ0ET47WMcg/viewform?embedded=true"
          width="640" height="870" frameborder="0" marginheight="0" marginwidth="0">Đang tải…</iframe> -->

					<div class="contact">
						<div class="outframe-2">
							<div class="frame-contact">
								<h4>Gửi phản hồi của bạn</h4>
								<form onsubmit="return checkVali()" action="${pageContext.request.contextPath}/contact"
									method="post">
									<div class="collumn">
										<div class="form-2">
											<div class="form-input-2">
												<div class="title">
													<p>Họ tên</p>
												</div>
												<input type="name" placeholder="Nhập tên của bạn"
													onfocusout="fullname(this,name3)" name="name">
											</div>
											<div class=" fillText3" id='name3'></div>
										</div>
									</div>
									<div class="collumn">
										<div class="alpha">
											<div class="form-2">
												<div class="form-input-2">
													<div class="title">
														<p>Email*</p>
													</div>
													<input placeholder="Nhập email" id="email"
														onfocusout="email(this,text2)" name="email">
													
												</div>
												<p id="require-email" style="display: none;color: red; margin-left: -1em">Vui lòng nhập đúng email</p>
												<div class=" fillText3" id="text2">Email must have the
													@ characters</div>
											</div>
										</div>
										<div class="omega">
											<div class="form-2">
												<div class="form-input-2">
													<div class="title">
														<p>Số điện thoại</p>
													</div>
													<input class="input-2" type="text" outf
														placeholder="Nhập số điện thoại"
														onfocusout="number(this,phone)" name="phone">
												</div>
												<div class=" fillText3" id="phone">Only number input</div>
											</div>
										</div>
									</div>

									<div class="collumn">
										<div class="form-3">
											<div class="form-input-3">
												<div class="title">
													<p>Lời nhắn</p>
												</div>
												<textarea cols="40" placeholder="Nhập lời nhắn của bạn"
													name="content"></textarea>
											</div>
										</div>

									</div>
									<div class="collumn">
										<div class="">
											<button onclick="checkClick()" type="submit" class="btn-submit">
												Gửi <i class="fas fa-long-arrow-alt-right"></i>
											</button>
										</div>

									</div>
								</form>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>

	<!-- @@@@@@@@@@ HIỆN THÔNG BÁO  @@@@@@@@@@@@@ -->
	<c:if test="${message != null}">

		<script>
			window.onload = function() {
				document.getElementById('btn-message').click();
			}
		</script>

		<!-- Button trigger modal -->
		<button style="display: none" type="button" id="btn-message"
			class="btn btn-white" data-toggle="modal"
			data-target="#exampleModalCenter"></button>

		<!-- Modal -->
		<div class="modal fade" id="exampleModalCenter" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalCenterTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLongTitle">${message}</h5>
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-success" data-dismiss="modal">Đóng</button>
					</div>
				</div>
			</div>
		</div>

	</c:if>
	<!-- @@@@@@@@@@ END HIỆN THÔNG BÁO  @@@@@@@@@@@@@ -->


	<jsp:include page="/VIEW/jsp/jsp-component/footer.jsp"></jsp:include>

	<script type="text/javascript">
		function vali_isEmail(text) {
			const regex = /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/g;
			const result = regex.test(text);
			return result;
		}
		var checkEmail = false;
		function check_email(id) {
			var s = document.getElementById(id).value;
			if (!vali_isEmail(s)) {
				document.getElementById("require-email").style.display = "block";
				checkEmail = false;
				return true;
			}
			if (vali_isEmail(s)) {
				document.getElementById("require-email").style.display = "none";
				checkEmail = true;
				return false;
			}
		}
		function checkVali() {
			if (checkEmail) {
				console.log("true");
				return true;
			} else {
				// alert("KKKKKK");
				console.log("false");
				return false;
			}
		}
		function checkClick() {
			if (check_email("email")) {
				document.getElementById("require-email").style.display = "block";
			}
		}
	</script>


</body>

</html>