// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require angular
//= require_tree .

// (function() {

// 	var playlistCheat = angular.module('playlistCheat', []);

// 	playlistCheat.controller('PlaylistController', ['$scope', '$http', function($scope, $http){

// 		this.message = "hello";

// 		// this.id = function(number)  {
// 		// 	return number;
// 		// }

// 		$scope.id = 0
// 		test = 0
// 		console.log(typeof test)

// 		$scope.getID = function(number) {
// 			// console.log($scope.id)
// 			console.log(test)
// 			// console.log(number)
// 			// console.log(id)

// 			test += number
// 			console.log(test)
// 			// return number;
// 		}

// 		console.log(test)

// 		// var hello = $scope.getID()

// 		// // console.log($scope.getID())
// 		// console.log($scope.id)

// 		$http.get('/playlists/3.json').success(function(data) {
// 			console.log(data);

// 		// });

// 	}]);

// })();