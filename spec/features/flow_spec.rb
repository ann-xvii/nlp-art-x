require 'rails_helper'

describe "the flow of NLP Curator" do
	it "loads the about page when you click the About link" do 
		visit "/"
		click_link "About"
		expect(page).to have_content("Welcome to NLP Curator")
	end	
end