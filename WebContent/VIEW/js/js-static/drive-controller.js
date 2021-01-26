"use strict";

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
		var tmp = "";
		$scope.clickFileUpload = function(id) {
			document.getElementById("uploadImage").click();
			tmp = id;
		};

		$scope.upload = function() {
			var allFiles = document.getElementById("uploadImage").files;
			var file = allFiles[0];

			driveService.insertFile(file, file.name).then(function(link) {
				insertImg(tmp, link);
			});
		};
	});

function insertImg(id, link) {
	var input = document.getElementById(id);
	var img = document.getElementById(id + "-img");
	img.src = link;
	input.value = link;
}


