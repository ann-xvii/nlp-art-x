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


  
  it {expect(subject).to respond_to(:date_published)}
  # it {expect(subject).to respond_to(:sentiment_analysis)}
  it {expect(subject).to respond_to(:select_random_index)}
  it {expect(subject).to respond_to(:brooklyn_gallery_request)}
  it {expect(subject).to respond_to(:cooper_hewitt_random_artwork_generator)}
  it {expect(subject).to respond_to(:rijksmuseum_request)}
end
