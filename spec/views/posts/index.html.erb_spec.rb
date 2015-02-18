# require 'rails_helper'

# RSpec.describe "posts/index", type: :view do
#   before(:each) do
#     assign(:posts, [
#       Post.create!(
#         :name => "Name",
#         :content => "MyString is a lovely string. It has more than 100 characters which means that it is valid and can be sent through my keyword extractor."
#       ),
#       Post.create!(
#         :name => "Name",
#         :content => "MyString is a lovely string. It has more than 100 characters which means that it is valid and can be sent through my keyword extractor."
#       )
#     ])
#   end

#   it "renders a list of posts" do
#     render
#     assert_select ".post strong", :text => "Name".to_s, :count => 2
#     assert_select ".post p", :text => "Content".to_s, :count => 2
#   end
# end
