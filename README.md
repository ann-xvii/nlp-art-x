## Welcome to NLP-Curator!
NLP-Curator is an art discovery tool based on keywords from text that you enter.
Special thanks to the Cooper Hewitt Design Museum, the Smithsonian, the Rijksmuseum and the Brooklyn Museum for their extensive, well-documented APIs that were a pleasure to use.



### Software used in NLP-Curator

General Assemblr runs on the following technologies:

* Rails 4.1.7
* Ruby 2.1.3
* Mongoid 4.0.0
* Bootstrap 3.3.2
* AngularJS
* Circle CI for continuous integration
* Heroku for deployment
* RSpec, Factory Girl, and Capybara for testing


### Ruby Gems installed in NLP Curator

NLP Curator uses the following gems:

* mongodb (database)
* thin (production server)
* better_errors (streamlined development)
* rails_12factor (heroku deployment)
* bootstrap-sass
* rspec-rails (testing)
* factory_girl_rails (testing)
* capybara (testing)
* figaro
* shoulda-matchers
* rspec_junit_formatter

Run the following commands to use these gems
* To install to your machine, run

```
gem install name_of_gem
```

* To include the gem into your app
	* add each gem to your Gemfile, then
	* run `bundle install`


### Running the test suite in NLP-Curator
NLP-Curator uses RSpec, Factory Girl and Capybara for testing models, controllers and features.  Tests are broken down into specific files in the app's `spec` directory. 

* To run all tests, run:
	```
	bundle exec rspec
	```

* To run a specific set of tests, simply include the file path. Here is an example for the post_spec.rb:
	```
	bundle exec rspec spec/models/post_spec.rb
	```

### Thanks for visiting NLP-Curator!

Feel free to ask questions or send pull requests. Donations can be made in pizza or green tea. Enjoy!






