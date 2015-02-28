require 'rails_helper'

describe 'Signing up for NLP Curator' do
	it "allows a user to sign up for nlp curator and creates an object in the database" do
		
		expect(User.count).to eq(0)
		visit "/"
		click_link "Sign Up"

		expect(page).to have_content("Sign Up. Discover artwork")

		fill_in "Name", with: "Jabba the Hut"
		fill_in "Email", with: "rollerskating_ninjas@hotmail.com"
		fill_in "Password", with: "hello1234"
		fill_in "Confirm Password", with: "hello1234"

		click_button "Join Curator!"
		expect(User.count).to eq(1)
	end
end