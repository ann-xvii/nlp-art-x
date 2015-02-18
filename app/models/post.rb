class Post
  include Mongoid::Document
  field :name, type: String
  field :content, type: String
  # field :keywords, type: Array, default: ['Rome', 'Modern']

  validates :name, presence: true, length: {minimum: 2}
  validates :content, presence: true, length: {minimum: 100}
end
