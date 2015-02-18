# require 'rails_helper'

# RSpec.describe "posts/edit", type: :view do
#   before(:each) do
#     @post = assign(:post, Post.create!(
#       :name => "MyString",
#       :content => "MyString is a lovely string. It has more than 100 characters which means that it is valid and can be sent through my keyword extractor."
#     ))
#   end

#   it "renders the edit post form" do
#     render

#     assert_select "form[action=?][method=?]", post_path(@post), "post" do

#       assert_select "input#post_name[name=?]", "post[name]"

#       assert_select "input#post_content[name=?]", "post[content]"
#     end
#   end
# end
