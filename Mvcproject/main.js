// main.js
var scotchApp = angular.module('scotchApp', ['ngRoute', 'ngGrid']);

scotchApp.config(function ($routeProvider) {
        
    $routeProvider
    .when('/', {
        templateUrl: 'pages/home.html',
        controller:'mainController'

    })
    .when('/angular', {

        templateUrl: 'pages/angular',
        controller:'myController'

    })


});
scotchApp.controller('myController', function ($scope) {


    $scope.x;


})