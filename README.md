## Welcome to NLP-Curator!
NLP Curator is an art discovery tool. Write a post, view keywords and see phrase-level and document-level sentiment analysis, and view artwork curated by the text you've written. 
* [NLP Curator](https://nlp-curator.herokuapp.com/)


### Software used in NLP Curator

NLP Curator runs on the following technologies:

* Rails 4.1.7
* Ruby 2.1.3
* MongoDB
* Bootstrap 3.3.2
* AngularJS
* D3.js
* Circle CI for continuous integration
* Heroku for deployment
* RSpec, Factory Girl, and Capybara for testing


### APIs used in NLP Curator
* [Skyttle API for text analytics](http://www.skyttle.com/)
* [Cooper Hewitt Design Museum API, NYC](https://collection.cooperhewitt.org/api/)
* [Rijksmuseum API, Amsterdam](https://www.rijksmuseum.nl/en/api)
* [Brooklyn Museum API, NY](http://www.brooklynmuseum.org/opencollection/api/)


### Ruby Gems installed in NLP Curator

NLP Curator uses the following gems:

* mongoid (database)
* bootstrap-sass
* masonry-rails
* httparty
* unirest
* figaro
* better_errors (streamlined development)
* rspec-rails (testing)
* factory_girl_rails (testing)
* capybara (testing)
* shoulda-matchers
* thin (production server)
* rspec_junit_formatter
* rails_12factor (heroku deployment)

Run the following commands to use these gems
* To install to your machine, run

```
gem install name_of_gem
```

* To include the gem into your app
	* add each gem to your Gemfile, then
	* run `bundle install`


### Running the test suite in NLP Curator
NLP-Curator uses RSpec, Factory Girl and Capybara for testing models, controllers and features.  Tests are broken down into specific files in the app's `spec` directory. 

* To run all tests, run:
	```
	bundle exec rspec
	```

* To run a specific set of tests, simply include the file path. Here is an example for the post_spec.rb:
	```
	bundle exec rspec spec/models/post_spec.rb
	```

### Thanks for visiting NLP Curator!

Feel free to ask questions or send pull requests. Donations can be made in the form of hummus or green tea. Enjoy!






