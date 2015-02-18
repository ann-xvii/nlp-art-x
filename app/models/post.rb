class Post
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :content, type: String
  # field :keywords, type: Array, default: ['Rome', 'Modern']

  validates :name, presence: true, length: {minimum: 2}
  validates :content, presence: true, length: {minimum: 100}

  def date_published
      created_at.localtime.strftime("%A, %B %-d, %Y at %l:%M %p")
  end

end
