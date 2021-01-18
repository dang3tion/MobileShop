<%@ page language="java" contentType="text/html; charset=utf-8;"
	pageEncoding="utf-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="en" ng-app="driveApp">
<head>
<meta charset="UTF-8">
<c:url var="urlDrive" scope="session" value="/VIEW/js/js-static"></c:url>
<head>

</head>
<body>
	<div ng-controller="driveController">
		<h2>Cấp quyền tài khoản</h2>
		Trạng thái đăng nhập :{{loggedIn}}
		<button ng-disabled="checkingLogin || loggedIn" ng-click="login()">Cấp
			quyền drive</button>

		<div ng-show="loggedIn">
			<button ng-disabled="uploading" ng-click="clickFileUpload()">Bếm
				vào đây để tải ảnh từ máy tính lên google drive</button>
			<input type="file" id="uploadImage" accept="image/*"
				onchange="angular.element(this).scope().upload()"
				style="display: none;">
			<div ng-show="uploading">Đang tải ảnh lên...</div>

			<h3>Ảnh kết quả:</h3>
			<div ng-show="!images.length">Chưa có ảnh nào được up lên</div>
			<div ng-repeat="image in images"
				style="max-width: 300px; max-height: 300px;">
				<img src="{{image}}" style="max-width: 100%; max-height: 100%;">

				<h1> link ảnh : {{image}}</h1>

			</div>
		</div>
	</div>
	<script>
		window.gapiCallbacks = [];

		function gapiLoaded() {
			gapi.auth.init(function() {
				gapi.client.load('drive', 'v2').then(function() {
					var GapiQueue = function() {
						this.push = function(callback) {
							setTimeout(callback, 0);
						};
					};

					var _old_gapiCallbacks = window.gapiCallbacks;

					window.gapiCallbacks = new GapiQueue();

					_old_gapiCallbacks.forEach(function(callback) {
						window.gapiCallbacks.push(callback);
					});
				}, function(reason) {
					console.err(reason);
				});
			});
		}
	</script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.15/angular.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.2/moment.min.js"></script>
	<script src="https://apis.google.com/js/client.js?onload=gapiLoaded"></script>
	<script src="${urlDrive}/drive-controller.js"></script>
	<script src="${urlDrive}/gapi-auth-service.js"></script>
	<script src="${urlDrive}/drive-service.js"></script>
</body>
</html>