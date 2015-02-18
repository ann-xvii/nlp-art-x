require 'rails_helper'

RSpec.describe Post, type: :model do
  it "has a valid factory" do
  	expect(FactoryGirl.build(:post)).to be_valid
  end

  it "is invalid without a name" do 
  	post = FactoryGirl.build(:post, name: nil)
  	expect(post).to be_invalid
  end

  it "is invalid without a body" do
  	post = FactoryGirl.build(:post, content: nil)
  	expect(post).to be_invalid
  end

  it "is invalid if the name is less than 2 characters" do
  	post = FactoryGirl.build(:post, name: "I")
  	expect(post).to be_invalid
  end

  it "is invalid if the body is less than 100 characters" do
  	post = FactoryGirl.build(:post, content: "a"*99 )
  	expect(post).to be_invalid
  end

  # it "is invalid without an array of keywords" do
  # 	post = FactoryGirl.build(:post, keywords: nil)
  # end


  it "responds to date published method"

  it "responds to sentiment analysis method"

  it "responds to museum search method"
end
