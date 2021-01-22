<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>

	<form action="hihih">
<!-- 	@@@@@@@@@ START CHOOSE ADDRESS @@@@@@@@@@@@@ -->
		<div class="row">
			<div id="province-dropdown">
				<select value="3" onchange="getDistrict(this.value)" class="mx-2"
					style=" min-width: 140px; padding: 3px; outline: 0; border: 1px solid #b7b7b7; border-radius: 5px;"
					name="province">
					<option disabled selected value>Chọn tỉnh/thành phố</option>
					<c:forEach items="${LIST_PROVINCE}" var="pro">
					 <option value="${pro.key}">${pro.value}</option>
					 </c:forEach>
				</select>
			</div>
			<div id="district-dropdown">
				<select class="mx-2"
					style="min-width: 140px; padding: 3px; outline: 0; border: 1px solid #b7b7b7; border-radius: 5px;"
					name="district">
					<option disabled selected value>Chọn quận/huyện</option>
				</select>
			</div>
			<div id="ward-dropdown">
				<select class="mx-2"
					style="min-width: 140px; padding: 3px; outline: 0; border: 1px solid #b7b7b7; border-radius: 5px;"
					name="ward">
					<option disabled selected value>Chọn phường/xã</option>
				</select>
			</div>
		</div>
		<!-- 	@@@@@@@@@ END CHOOSE ADDRESS @@@@@@@@@@@@@ -->

		<button type="submit">OK</button>

	</form>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"
		integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
		crossorigin="anonymous"></script>

	<script type="text/javascript">
		function getDistrict(provinceIDvalue) {
			$.ajax({
				type : 'GET',
				url : '${pageContext.request.contextPath}/AJAXSelectDistrict',
				data : {
					provinceID : provinceIDvalue
				},
				success : function(response) {
					$('#district-dropdown').html(response);
				}

			});
		}
		function getWard(districtIDvalue) {
			$.ajax({
				type : 'GET',
				url : '${pageContext.request.contextPath}/AJAXSelectWard',
				data : {
					districtID : districtIDvalue
				},
				success : function(response) {
					$('#ward-dropdown').html(response);
				}

			});
		}
	</script>

</body>
</html>