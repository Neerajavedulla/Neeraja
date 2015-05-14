	// create the module and name it scotchApp
var scotchApp = angular.module('scotchApp', ['ngRoute', 'ngGrid']);

// configure our routes
scotchApp.config(function ($routeProvider) {
	    $routeProvider

	    // route for the home page
			.when('/', {
			    templateUrl: 'pages/home.html',
			    controller: 'mainController'
			})

	    // route for the about page
			.when('/about', {
			    templateUrl: 'pages/about.html',
			    controller: 'aboutController'
			})

	    // route for the contact page
			.when('/contact', {
			    templateUrl: 'pages/contact.html',
			    controller: 'contactController'
			})
            .when('/angular', {
                templateUrl: 'pages/angular.html',
                controller: 'angularController'
            })
           .when('/angulaar', {
               templateUrl: 'pages/angulaar.html',
               controller: 'angulaarController'
           })
        //.when('angulaar', {

        //    templateUrl: "pages/angulaar.html",
        //    controller: "EmployeeController"
        //});

	});

	// create the controller and inject Angular's $scope
	scotchApp.controller('mainController', function($scope) {
		// create a message to display in our view
		$scope.message = 'Everyone come and see how good I look!';
	});

	scotchApp.controller('aboutController', function($scope) {
		$scope.message = 'Look! I am an about page.';
	});

	scotchApp.controller('contactController', function($scope) {
		$scope.message = 'Contact us! JK. This is just a demo.';
});
scotchApp.controller('angularController', function ($scope) {
    $scope.onButton1Click = function () {
       
        $scope.lastName = $scope.firstName;
    }


});
scotchApp.controller('angulaarController',function ($scope,$http) {
    $scope.loading = true;
    $scope.addMode = false;
   
    //$scope.removeAttribute('Dispaly');
   // alert("hii");
    //Used to display the data  
    $http.get('/api/Employee/').success(function (data) {
      
        $scope.employees = data;
       // alert(data[0].EmpName);
      //  $scope.employees = data;
        //$scope.loading = false;
    })
    .error(function () {
        $scope.error = "An Error has occured while loading posts!";
        $scope.loading = false;
    }); 
   
     $scope.empGrid = {
         data: 'employees',
        multiSelect:false,
        selectedItems: [],
        enableCellSelection: true,
       // enableRowSelection: false,
       enableCellEdit: true,
            //columnDefs: [{ field: 'EmpID', displayName: 'EmpID' },
            //            { field: 'EmpName', displayName: 'EmpName' },
            //            { field: 'Location', displayName: 'Location' },
            //            { field: 'Salary', displayName: 'Salary' }
            //]
     };
     
    //$scope.loading = false;
    //$scope.y;
});