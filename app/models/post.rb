class Post
  include Mongoid::Document
  field :name, type: String
  field :content, type: String
  field :keywords, type: Array
end
