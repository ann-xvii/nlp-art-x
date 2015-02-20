require 'rails_helper'

RSpec.describe User, type: :model do
  
  it "has a valid factory" do
	expect(FactoryGirl.build(:user)).to be_valid
  end

  it "is invalid without a name" do
		user = FactoryGirl.build(:user, name: nil)
		expect(user).to be_invalid
  end
  
  it "validates length of name less than 50 chars" do
  	user = FactoryGirl.build(:user, name: "a"*51 )
  	expect(user).to be_invalid
  end
  
  it "is invalid without a password" do
		user = FactoryGirl.build(:user, password: "")
		expect(user).to be_invalid
  end

  it "is invalid if password is less than 6 chars" do
  	user = FactoryGirl.build(:user, password: "a"*5 )
  	expect(user).to be_invalid
  end

  it "is invalid if password is greater than 20 chars" do
  	user = FactoryGirl.build(:user, password: "a"*21 )
  	expect(user).to be_invalid
  end


 #  it "is invalid if a user tries to sign up with an email address that already exists in our database, regardless of capitalization" do
	# # FactoryGirl.create(:user, email: "percival@example.com")
	# # FactoryGirl.create(:user, email: "PERCIVAL@example.com")
	# user = FactoryGirl.build(:user, email: "percival@example.com")
	# user1 = FactoryGirl.build(:user, email: "PERCIVAL@example.com")
	# expect(user).to be_invalid
	# expect(user1).to be_invalid
 #  end
  
  it "is invalid without an email address" do
		user = FactoryGirl.build(:user, email: nil)
		expect(user).to be_invalid
  end

  it "is invalid if email is longer than 255 chars" do 
  	user = FactoryGirl.build(:user, email: "a"*266 )
  	expect(user).to be_invalid
  end
  
  it "is invalid if email isn't formatted properly" do
		user = FactoryGirl.build(:user, email: "akl;ejf")
		expect(user).to be_invalid
  end
  
  
end
