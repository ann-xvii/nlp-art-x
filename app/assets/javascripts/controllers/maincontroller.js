
// Controller before a person is logged in

(function(){

	angular
		.module('app')
		.controller('MainController', MainController);

	MainController.$inject = ['PostsFactory', 'ipCookie', '$http', '$sce', 'ngSanitize'];


	function MainController(PostsFactory, ipCookie, $http, $sce, ngSanitize){

		var self = this;
		
		self.controllertest = "test yay";
		// Create PostFactory as an object
		self.Post = new PostsFactory();
		self.id = ipCookie('id');

		self.addFavorite = function () {
			console.log("I been clicked yeaheeee yayeee!");
		}
		

		// defined in model as search input
		self.artinput;
		

		self.searchArt = function (){

		    var API_SEARCH = "https://api.collection.cooperhewitt.org/rest/?method=cooperhewitt.search.collection&access_token=" + ENV['API_TOKEN'] + "&query=" + self.artinput + "&has_images=1&page=1&per_page=10";
		    console.log(API_SEARCH);
		    $http
		        .get(API_SEARCH)
		        .success(function(data, status, header, config){
		            self.items = data;
		            console.log(self.items);
		            //console.log(self.items.objects);
		            self.artinput = null;

		            //self.trustLink = $sce.trustAsResourceUrl(self.items.objects.url);
		            self.trustLink = $sce.trustAsResourceUrl(self.items.objects.url);

		            //console.log(self.items.objects);
		        });
		}
		
		



		
								


	}

})();