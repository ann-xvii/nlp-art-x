(function(){

    angular
        .module('app')
        .factory('PostsFactory', PostsFactory);

    PostsFactory.$inject = ['Resources', '$http'];

    function PostsFactory(Resources, $http){

        var Posts = function(){
            var self = this;

            // Use ngResource for Posts
            var PostResource = new Resources('posts');

            // Get all posts
            self.posts = PostResource.query();

            // Create a post object
            self.post = new PostResource();

            self.create = function(link, title){



                var data = {'link': self.link, 'title': self.title };
                // var data = { 'user_id': '54de6866416e6e1c11000000', 'link': self.link, 'title': self.title };
                //data = 'post%5Blink%5D=test&post%5Btitle%5D=test&commit=Log+in+now';
                // var result = $.param(data);

                console.log("create function has been called");

                console.log($.param(data));
                PostResource.save(data, function(data, headers, status){    
                    // take post from array                             
                    self.posts.unshift(data);

                    




                                            
                    // Clear the modal form
                    
                    // post.link = '';
                    // post.title = '';                            
                }).$promise.catch(function(response) {
                    //this will be fired upon error
                    if(response.status !== 201){
                        self.postError = true;
                    }
                });
            };


            // Delete a post
            self.destroy = function(post, index){

                var postObj = {id: post};
                PostResource.delete(postObj);

                self.posts.splice(index, 1);

            };      
        };

        return Posts;

    }

})();