(function(){

  angular
    .module('app')
    .config(config)
    .run(run);

  function config($routeProvider, $locationProvider){

      // Get rid of hash in our url
      // $locationProvider.html5Mode({enabled:true, requireBase:true});      

      // Define our routes
      $routeProvider

      .when('/', {
        title: "Curator",
        templateUrl: "index.html",
        controller: 'MainController',
        controllerAs: 'main'
      })

      .when('/edit/:id', {
        title: "Edit user",
        templateUrl: "edit.html",
        controller: 'MainController',
        controllerAs: 'main'
      })            

      .when('/new', {
        title: "Edit user",
        templateUrl: "new.html",
        controller: 'MainController',
        controllerAs: 'main'
      })

      .otherwise({        
        redirectTo: '/'
      });  
  }

  function run($location, $rootScope){ 

      var changeRoute = function(event, current, previous){                    
            return $rootScope.title = current.$$route.title;                      
      };

      $rootScope.$on('$routeChangeSuccess', changeRoute);

  }


}).call(this);