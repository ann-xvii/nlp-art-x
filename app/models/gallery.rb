class Gallery
  include Mongoid::Document
  include Mongoid::Timestamps


  field :title, type: String
  field :keyword_search, type: String
  field :museum, type: String
  field :given_name, type: String
  

  
  belongs_to :post
  embeds_many :artobjects
end
