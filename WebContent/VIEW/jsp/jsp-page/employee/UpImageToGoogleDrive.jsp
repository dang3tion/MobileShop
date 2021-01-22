<%@ page language="java" contentType="text/html; charset=utf-8;"
	pageEncoding="utf-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html lang="en" ng-app="driveApp">
<c:url var="urlDrive" scope="session" value="/VIEW/js/js-static"></c:url>

<div ng-controller="driveController">
	<input type="file" id="uploadImage" accept="image/*"
		onchange="angular.element(this).scope().upload()" hidden>
	<h1 ng-repeat="image in images">{{image}}</h1>
</div>


<div class="input">
	<input type="file" id="actual-btn" hidden /> <label
		class="choose-file" ng-click="clickFileUpload()" for="uploadImage">Chọn
		ảnh</label>
</div>

<br/>
<br/>

<div class="input">
	<input type="file" id="actual-btn" hidden /> <label
		class="choose-file" ng-click="clickFileUpload()" for="uploadImage">Chọn
		ảnh</label>
</div>

<br/>


<div class="input">
	<input type="file" id="actual-btn" hidden /> <label
		class="choose-file" ng-click="clickFileUpload()" for="uploadImage">Chọn
		ảnh</label>
</div>



<style>

.choose-file {
	background-color: rgb(0, 130, 119);
	color: white;
	padding: 0.5rem;
	font-family: sans-serif;
	border-radius: 0.3rem;
	cursor: pointer;
	margin-top: 20px;
}

</style>


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