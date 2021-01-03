<%@ page language="java" contentType="text/html; charset=utf-8;"
	pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="en" ng-app="driveApp">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
	<head>
		<script>
			window.gapiCallbacks=[];
	
			function gapiLoaded(){
				gapi.auth.init(function() {
					gapi.client.load('drive', 'v2').then(function () {
						var GapiQueue = function () {
							this.push = function (callback) {
								setTimeout(callback, 0);
							};
						};
	
						var _old_gapiCallbacks = window.gapiCallbacks;
	
						window.gapiCallbacks = new GapiQueue();
	
						_old_gapiCallbacks.forEach(function (callback) {
							window.gapiCallbacks.push(callback);
						});
					},function(reason){
						console.err(reason);
					});
				});
			}
		</script>
		<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.15/angular.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.2/moment.min.js"></script>
	
		<script src="drive-controller.js"></script>
		<script src="gapi-auth-service.js"></script>
		<script src="drive-service.js"></script>
	</head>
	<body>
	<div ng-controller="driveController">
	
	
	
		<h2>Cấp quyền tài khoản</h2>
		Trạng thái đăng nhập :{{loggedIn}}
		<button ng-disabled="checkingLogin || loggedIn" ng-click="login()">Cấp quyền drive</button>
	
		<div ng-show="loggedIn">
			<button ng-disabled="uploading" ng-click="clickFileUpload()">Bếm vào đây để tải ảnh từ máy tính lên google drive</button>
			<input type="file" id="uploadImage" accept="image/*" onchange="angular.element(this).scope().upload()" style="display:none;">
			<div ng-show="uploading">Đang tải ảnh lên...</div>
	
			<h3>Ảnh kết quả:</h3>
			<div ng-show="!images.length">Chưa có ảnh nào được up lên</div>
			<div ng-repeat="image in images" style="max-width:300px;max-height:300px;">
				<img src="{{image}}" style="max-width: 100%;max-height: 100%;">
				
				<h1>Link Ảnh (bỏ "=download"): {{image}} </h1>
				
			</div>
		</div>
	</div>
	
	<script src="https://apis.google.com/js/client.js?onload=gapiLoaded"></script>
	</body>
</html>