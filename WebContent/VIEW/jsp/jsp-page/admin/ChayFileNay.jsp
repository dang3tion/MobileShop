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

<div>

	<div ng-controller="driveController">
		<button ng-disabled="uploading" ng-click="clickFileUpload()">upload</button>
		<input type="file" id="uploadImage" accept="image/*"
			onchange="angular.element(this).scope().upload()"
			style="display: none;">

		<h1>{{image}}</h1>
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
	
	</div>
</body>
</html>