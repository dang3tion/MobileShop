"use strict";
var tmp = "";
angular
	.module("driveApp", [])
	.controller("driveController", function(
		$scope,
		gapiAuthService,
		driveService
	) {
		//Auth

		$scope.checkingLogin = true;
		gapiAuthService
			.checkLogin()
			.then(
				function() {
					$scope.loggedIn = true;
				},
				function() {
					$scope.loggedIn = false;
				}
			)
			.finally(function() {
				$scope.checkingLogin = false;
			});

		$scope.login = function() {
			gapiAuthService.login().then(
				function() {
					$scope.loggedIn = true;
				},
				function(authResult) {
					$scope.loggedIn = false;
					console.err(authResult);
				}
			);
		};

		//Drive

		$scope.images = [];


		$scope.upload = function() {
			var allFiles = document.getElementById("uploadImage").files;
			var file = allFiles[0];

			driveService.insertFile(file, file.name).then(function(link) {
				insertImg(tmp, link);
			});
		};
	});


function clickFileUpload(id) {
	document.getElementById("uploadImage").click();
	tmp = id;
}
function insertImg(id, link) {
	var input = document.getElementById(id);
	var img = document.getElementById(id + "-img");
	img.style.display="block";
	img.src = link;
	input.value = link;
}


